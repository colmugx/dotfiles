import { quicklistConf } from '../../config'
import { Music } from './music'

export interface IChoice {
  text: string
  content?: any
  child?: any
  subText?: string
  image?: any
}

class Quicklist {
  chooser: Chooser | undefined
  appList: any[] = []
  trigger: any

  constructor() {
    this.init()
    this.getList()
  }

  init() {
    const chooser = hs.chooser.new(selected => this.getItem(selected))
    this.chooser = chooser

    const trigger = hs.hotkey.bind('', 'tab', () => {
      this.switchMenu()
    })
    trigger.disable()
    this.trigger = trigger
  }

  getList() {
    // const appList = []
    const music = new Music(this.chooser!)

    this.appList.push(music)
  }

  switchMenu() {
    const content = this.chooser!.selectedRowContents<IChoice>()
    if (content.child) {
      this.chooser!.choices(content.child)
    } else {
      const list = this.appList.map(app => app.status())
      this.chooser!.choices(list)
    }
    this.chooser!.queryChangedCallback()
  }

  getItem(selected: IChoice) {
    this.trigger.disable()
    if (selected) {
      this.chooser!.choices(selected.content)
      this.chooser!.queryChangedCallback()
    }
  }

  show() {
    const list = this.appList.map(app => app.status())
    this.chooser!.choices(list)
    this.chooser!.show()
    this.trigger.enable()
  }
}

const quicklist = new Quicklist()
hs.hotkey.bind(quicklistConf.hotkey[0], quicklistConf.hotkey[1], () => {
  quicklist.show()
})
