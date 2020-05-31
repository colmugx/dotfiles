import { quicklistConf } from '../../config'
import { Music } from './music'

export type TAction = 'open' | 'music'

export interface IChoice {
  text: string
  content?: {
    action: TAction
    attr: string
  }
  child?: any
  subText?: string
  image?: any
}

class Quicklist {
  chooser: Chooser | undefined
  appList: any[] = []
  trigger: any
  actions = {
    open: hs.application.open,
    action: null
  }

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
      if (selected.content) {
        if (selected.content.action === 'music') {
          type TAttr = 'next' | 'previous' | 'playpause'
          hs.itunes[selected.content.attr as TAttr]()
        } else {
          const action = this.actions[selected.content.action]
          action(selected.content.attr)
        }
      }
    }
  }

  show() {
    const list = this.appList.map(app => app.status())
    this.chooser!.choices(list)
    this.chooser!.show()
    this.trigger.enable()
  }
}

export const quicklist = new Quicklist()
hs.hotkey.bind(quicklistConf.hotkey[0], quicklistConf.hotkey[1], () => {
  quicklist.show()
})
