class NetworkStatus {
  inter: string = ''

  menubar: Menubar | undefined

  constructor() {
    this.init()
    this.status()
  }

  init() {
    const menubar = hs.menubar.new()
    this.menubar = menubar
  }

  ifstat() {
    const cmd = `/usr/local/bin/ifstat -n -w -i ${this.inter} -b 0.5 1 | tail -n 1`
    return (hs.execute(cmd) as unknown) as string
  }

  refresh() {
    const dataArr = this.ifstat().split(' ')
    const arr = []
    for (const item of dataArr) {
      if (item !== '') {
        arr.push(item)
      }
    }
    const nowDown = arr[0]
    const nowUp = arr[1].split('\n')[0]

    const downMsg = this.formatMsg(tonumber(nowDown))
    const upMsg = this.formatMsg(tonumber(nowUp))

    this.setTitle(downMsg, upMsg)
  }

  formatMsg(value: number) {
    if (value / 8 > 1000) {
      return `${string.format('%.2f', `${+value / 80000}`)}m/s`
    }
    return `${string.format('%.2f', `${+value / 80}`)}k/s`
  }

  refreshStatus() {}

  status() {
    const inter = hs.network.primaryInterfaces()
    this.inter = inter

    const detail = hs.network.interfaceDetails(inter)
    const menuList: MenuItem[] = [
      {
        title: `interface: ${inter}`,
      },
    ]

    if (detail.get('IPv4')) {
      const ipv4 = detail.get('IPv4')
      const address = ipv4.Addresses[1]
      menuList.push(this.createMenu('ipv4', address))
    }
    if (detail.get('IPv6')) {
      const ipv6 = detail.get('IPv6')
      const address = ipv6.Addresses[1]
      menuList.push(this.createMenu('ipv6', address))
    }

    this.setMenu(
      menuList.concat([
        {
          title: '-',
        },
        {
          title: 'refresh status',
          fn: () => {
            this.refreshStatus()
          },
        },
      ]),
    )
  }

  createMenu(key: string, value: string): MenuItem {
    return {
      title: `${key}: ${value}`,
      tooltip: 'copy',
      fn: () => {
        hs.pasteboard.setContents(value)
      },
    }
  }

  setMenu(menu: MenuItem[]) {
    this.menubar?.setMenu(menu)
  }

  setTitle(down: string, up: string) {
    const str = `↑${up}\n↓${down}`
    const title = hs.styledtext.new(str, this.textStyle)

    this.menubar?.setTitle(title)
  }

  get textStyle() {
    return {
      font: {
        size: 9,
      },
      paragraphStyle: {
        alignment: 'left',
        maximumLineHeight: 10,
      },
      baselineOffset: 2,
    }
  }
}

export const netStatus = new NetworkStatus()
export const netWatcher = hs.timer.new(1, () => {
  pcall(netStatus.refresh.bind(netStatus))
})
netWatcher.start()
