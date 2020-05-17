type TModule = {
  hotkey: [string[], string]
  path: string
}
type TConfig = {
  [key: string]: TModule
}

const config: TConfig = {
  clipboard: {
    hotkey: [['cmd', 'shift'], 'v'],
    path: './.clipboard'
  },
}

export default config