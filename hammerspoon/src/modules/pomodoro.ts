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
  readonly timeLength = 25
  readonly breakLength = 5
  
  menubar: Menubar | undefined
  timer: Timer | undefined
  status = EStatus.STOP
  type = EType.WORKING
  
  currentTime: number = 0

  constructor() {
    this.init()
  }

  init() {
    const menubar = hs.menubar.new()
    this.menubar = menubar

    this.setTitle()
    this.setMenu()
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

    this.menubar?.setMenu(menu)
  }

  setTitle() {
    const title = '🍅'
    console.log(this.currentTime)
    const min = this.currentTime > 59 ? Math.floor(this.currentTime / 60) : 0
    const sec = this.currentTime - min * 60
    this.menubar?.setTitle(
      `${title}${this.status !== EStatus.STOP 
        ? `${string.format('%02.f:%02.f', min > 0 ? min : 0, sec)}`
        : ''
      }`
    )
  }

  update() {
    this.currentTime -= 1
    this.setTitle()
  }

  toggle() {
    const status = this.timer && this.timer?.running()
    if (status) {
      this.pause()
    } else {
      this.run()
    }
  }

  run() {
    if (this.status === EStatus.STOP) {
      this.currentTime
      = hs.timer.minutes(this.type === EType.WORKING
        ? this.timeLength
        : this.breakLength)
    }

    this.timer = hs.timer.doEvery(1, () => {
      this.update()
    })

    this.setStatus(EStatus.RUNNING)
  }

  pause() {
    this.timer?.stop()
    this.setStatus(EStatus.PAUSE)
  }

  stop() {
    this.timer?.stop()
    this.timer = undefined
    this.setStatus(EStatus.STOP)
  }

  setStatus(status: EStatus) {
    this.status = status
    this.setTitle()
    this.setMenu()
  }
}

export const pomodoro = new Pomodoro()
