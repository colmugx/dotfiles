import { isImgType, isTextType } from '../utils'
import config from '../config'

const clipboardConfig = config.clipboard

interface ModelChoice {
  createdAt: number
  type: 'public.png' | 'public.utf8-plain-text'
  title: string
  content: any
}

interface IChoice {
  type: 'public.png' | 'public.utf8-plain-text'
  text: string
  content?: string
  subText?: string
  image?: any
}

class Clipboard {
  chooser: Chooser | undefined
  db: Sqlite | undefined

  constructor() {
    // TODO: 存到数据库
    this.initDb()
    this.init()
  }

  init() {
    const chooser = hs.chooser.new(selected => this.getItem(selected))
    chooser.showCallback(() => this.cleanData())
    this.chooser = chooser
  }

  initDb() {
    // create dir
    hs.fs.mkdir(clipboardConfig.path)

    const db = hs.sqlite3.open(`${clipboardConfig.path}/db.sqlite3`)
    db.exec(`CREATE TABLE clipboard(
      created_at NUMERIC PRIMARY KEY NOT NULL,
      type TEXT NOT NULL,
      title TEXT NOT NULL,
      content TEXT NOT NULL
    );`)

    this.db = db
  }

  save() {
    const types = hs.pasteboard.contentTypes<ModelChoice['type']>()

    for (const type of types) {
      if (isImgType(type)) {
        this.saveImage(type)
      } else if (isTextType(type)) {
        this.saveText(type)
      }
    }
  }

  saveText(type: ModelChoice['type']) {
    const pasteboard = hs.pasteboard
    const content = pasteboard.readString()
    const title = string.gsub(content, '[\r\n]+', '')
    if (!title || title.length < 3) return

    this.saveToDb({ title, content, type })
  }

  saveImage(type: ModelChoice['type']) {
    const pasteboard = hs.pasteboard
    const content = pasteboard.readImage().encodeAsURLString()
    const title = 'IMAGE'

    this.saveToDb({ title, content, type })
  }

  saveToDb({
    title,
    content,
    type,
  }: {
    title: string
    content: string
    type: ModelChoice['type']
  }) {
    this.db!.exec(`DELETE FROM clipboard WHERE type = '${type}' AND content = '${content}';`)
    this.db!.exec(
      `INSERT INTO clipboard VALUES(${os.time()}, '${type}', '${title}', '${content}');`,
    )
  }

  show() {
    const sql = `SELECT * FROM clipboard ORDER BY created_at DESC LIMIT ${clipboardConfig.limit};`
    const choices: IChoice[] = []
    for (const [createAt, type, title, content] of this.db!.urows<string>(sql)) {
      const choice: IChoice = {
        text: title,
        type: type as IChoice['type'],
        content,
        subText: os.date('%Y-%m-%d %H:%M:%S', createAt),
      }
      if (isImgType(type)) {
        choice.image = hs.image.imageFromURL(content)
      }

      choices.push(choice)
    }

    this.chooser!.choices(choices)
    this.chooser!.show()
  }

  getItem(selected: IChoice) {
    if (selected) {
      const { content, type, image } = selected
      if (isImgType(type)) {
        hs.pasteboard.writeObjects(image)
      } else if (isTextType(type)) {
        hs.pasteboard.setContents(content)
      }
      hs.eventtap.keyStroke(['cmd'], 'v')
    }
  }

  cleanData() {
    const selectSql = `(SELECT count(content) FROM clipboard)`
    this.db!.exec(
      `DELETE FROM clipboard WHERE ${selectSql} > ${clipboardConfig.limit} AND content IN
      (SELECT content FROM clipboard ORDER BY created_at DESC LIMIT ${selectSql} OFFSET ${clipboardConfig.limit});`,
    )
  }
}

export const clipboard = new Clipboard()
export let preCount = hs.pasteboard.changeCount()
export const watcher = hs.timer.new(1, () => {
  const now = hs.pasteboard.changeCount()
  if (now !== preCount) {
    pcall(clipboard.save.bind(clipboard))
    preCount = now
  }
})
watcher.start()

hs.hotkey.bind(clipboardConfig.hotkey[0], clipboardConfig.hotkey[1], () => {
  clipboard.show()
})
