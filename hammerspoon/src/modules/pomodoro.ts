import { pomodoroConf } from '../config'

enum EStatus {
  STOP,
  PAUSE,
  RUNNING,
}

enum EType {
  WORKING,
  BREAKING,
}

class Pomodoro {
  private readonly tomatoPic = hs.image.imageFromPath('./modules/assests/tomato.png')
  menubar: Menubar | undefined
  timer: Timer | undefined
  status: EStatus = EStatus.STOP
  type: EType = EType.WORKING

  currentTime: number = 0

  constructor(
    private readonly timeLength: number,
    private readonly breakLength: number
  ) {
    this.init()
    this.setTime()
  }

  init() {
    const menubar = hs.menubar.new()
    this.menubar = menubar

    this.setStatus(EStatus.STOP)
  }

  setMenu() {
    const menu: MenuItem[] = [
      {
        title: this.status === EStatus.RUNNING ? '暂停' : '开始',
        fn: () => {
          this.toggle()
        },
      },
    ]

    if (this.status !== EStatus.STOP) {
      menu.push({
        title: '停止',
        fn: () => {
          this.stop()
        },
      })
    }

    this.menubar!.setMenu(menu)
  }

  setNotify(type: EType) {
    const text = {
      [EType.BREAKING]: '休息时间',
      [EType.WORKING]: '工作时间'
    }
    const notify = hs.notify.new(() => {}, {
      title: `${text[type]}结束`,
      informativeText: `结束时间：${os.date('%H:%M')}`,
      setIdImage: this.tomatoPic,
      soundName: 'Glass',
    })
    notify.send()
  }

  update() {
    if (this.currentTime === 0) {
      this.setNotify(this.type)
      this.type = this.type === EType.BREAKING ? EType.WORKING : EType.BREAKING
      this.setTime()
      if (this.type === EType.WORKING) {
        this.pause()
      }
    } else {
      this.currentTime -= 1
      this.setTitle()
    }
  }

  toggle() {
    const status = this.timer && this.timer!.running()
    if (status) {
      this.pause()
    } else {
      this.run()
    }
  }

  private run() {
    this.timer = hs.timer.doEvery(1, () => {
      this.update()
    })

    this.setStatus(EStatus.RUNNING)
  }

  private pause() {
    this.timer!.stop()
    this.setStatus(EStatus.PAUSE)
  }

  private stop() {
    this.timer!.stop()
    this.timer = undefined
    this.type = EType.WORKING
    this.setStatus(EStatus.STOP)
    this.setTime()
  }

  private setTitle() {
    const title = this.type === EType.WORKING ? '🍅' : '🛀'
    this.menubar!.setTitle(`${title}${os.date('%M:%S', this.currentTime)}`)
  }

  private setStatus(status: EStatus) {
    this.status = status
    this.setTitle()
    this.setMenu()
  }

  private setTime() {
    this.currentTime = hs.timer.minutes(
      this.type === EType.WORKING ? this.timeLength : this.breakLength,
    )
    this.setTitle()
  }
}

export const pomodoro = new Pomodoro(pomodoroConf.timeLength, pomodoroConf.breakLength)
