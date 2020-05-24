/** @luaTable */
interface LuaTable<K extends {} = {}, V = any> {
  readonly length: number
  set(key: K, value: V | undefined): void
  get(key: K): V | undefined
}

/**
 * hs.chooser
 * https://www.hammerspoon.org/docs/hs.chooser.html
 * @noSelf
 */
interface HSChooser {
  new: (callback: (this: void, selected: any) => void) => Chooser
}
interface Chooser {
  choices<T>(choices: T): void
  show(): void
  showCallback(callback: (this: void, selected: any) => void): void
}

/**
 * hs.menubar
 * https://www.hammerspoon.org/docs/hs.menubar.html
 */
interface HSMenubar {
  new: () => Menubar
}
interface MenuItem {
  title: string
  fn?: Function
  tooltip?: string
  image?: string
}
interface Menubar {
  setMenu(menus: MenuItem[]): void
  setTitle(title: string): void
}

/**
 * hs.hotkey
 * https://www.hammerspoon.org/docs/hs.hotkey.html
 * @noSelf
 */
interface HSHotkey {
  bind(key1: string[], key2: string, callback: Function): void
}

/**
 * hs.fnutils
 * https://www.hammerspoon.org/docs/hs.fnutils.html
 * @noSelf
 */
interface HSUtils {
  map<T>(arr: T[], callback: (item: T) => void): T[]
}

/**
 * hs.image
 * https://www.hammerspoon.org/docs/hs.image.html
 * @noSelf
 */
interface HSImage {
  imageFromURL(url: string): any
}
interface Image {
  encodeAsURLString(): string
}

/**
 * hs.fs
 * https://www.hammerspoon.org/docs/hs.fs.html
 * @noSelf
 */
interface HSFs {
  mkdir(name: string): boolean
}

/**
 * hs.pasteboard
 * https://www.hammerspoon.org/docs/hs.pasteboard.html
 * @noSelf
 */
interface HSPasteboard {
  writeObjects(object: any): void
  setContents(content: any): void
  changeCount(name?: string): number
  contentTypes<T>(name?: string): T[]
  readImage(name?: string): Image
  readString(name?: string): string
}

/**
 * hs.timer
 * https://www.hammerspoon.org/docs/hs.timer.html
 * @noSelf
 */
interface HSTimer {
  new: (interval: number, callback: Function) => Timer
}
interface Timer {
  start(): void
}

/**
 * hs.timer
 * https://www.hammerspoon.org/docs/hs.timer.html
 * @noSelf
 */
interface HSNetwork {
  primaryInterfaces(): string

  interfaceDetails(inter: string): LuaTable
}

/**
 * hs.eventtap
 * https://www.hammerspoon.org/docs/hs.eventtap.html
 * @noSelf
 */
interface HSEventTap {
  keyStroke(key1: string[], key2: string): void
}

/**
 * hs.sqlite3
 * https://www.hammerspoon.org/docs/hs.sqlite3.html
 * @noSelf
 */
interface HSSqlite {
  open(path: string): Sqlite
}

/** @luaIterator @tupleReturn */
type LuaIterable<T extends any[]> = Iterable<T>
interface Sqlite {
  exec(sql: string): void
  urows<T>(sql: string): LuaIterable<T[]>
}

/**
 * hs.inspect
 * @noSelf
 */
interface HSInspect {
  inspect(variable: any): string
}

/**
 * hs.styledtext
 * @noSelf
 */
interface HSStyledtext {
  new: (str: string, style: object) => string
}

interface IHammerSpoon {
  hotkey: HSHotkey
  chooser: HSChooser
  menubar: HSMenubar
  network: HSNetwork
  fnutils: HSUtils
  image: HSImage
  pasteboard: HSPasteboard
  timer: HSTimer
  eventtap: HSEventTap
  fs: HSFs
  sqlite3: HSSqlite
  inspect: HSInspect
  styledtext: HSStyledtext

  execute: (this: void, command: string, env?: string) => LuaTable
}

declare const hs: IHammerSpoon
declare const string: {
  gsub(this: void, str: string, pattern: string, rep: string): string
  format(this: void, format: string, data: any): string
}
declare const os: {
  time(this: void): void
  date(this: void, format: string, data: any): string
}
declare function pcall(this: void, fn: Function): void
declare function require(this: void, path: string): void
declare function tonumber(this: void, str: string): number
