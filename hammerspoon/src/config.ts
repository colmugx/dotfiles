type TConfig = {
  [key: string]: any
}

/* -- clipboard -- */
type TClipboard = {
  hotkey: [string[], string]
  path: string
  limit: number
}
const clipboardConf: TClipboard = {
  hotkey: [['cmd', 'shift'], 'v'],
  path: './.clipboard',
  limit: 20,
}

type TQuicklist = {
  hotkey: [string[], string]
}
const quicklistConf: TQuicklist = {
  hotkey: [['option'], 'space'],
}

export { clipboardConf, quicklistConf }
