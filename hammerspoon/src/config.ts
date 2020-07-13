const dbPath = './.db'

/* -- clipboard -- */
type TClipboard = {
  hotkey: [string[], string]
  path: string
  limit: number
}
const clipboardConf: TClipboard = {
  hotkey: [['cmd', 'shift'], 'v'],
  path: dbPath,
  limit: 20,
}

/* -- quicklist -- */
type TQuicklist = {
  hotkey: [string[], string]
}
const quicklistConf: TQuicklist = {
  hotkey: [['option'], 'space'],
}

/* -- pomodoro -- */
const pomodoroConf = {
  timeLength: 25,
  breakLength: 5
}

export { clipboardConf, quicklistConf, pomodoroConf }
