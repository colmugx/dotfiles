type TModule = {
  hotkey: [string[], string]
  path: string
  [key: string]: any
}
type TConfig = {
  [key: string]: TModule
}

const config: TConfig = {
  clipboard: {
    hotkey: [['cmd', 'shift'], 'v'],
    path: './.clipboard',
    limit: 20
  },
}

export default config