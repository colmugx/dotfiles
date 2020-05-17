/** @noSelfInFile */

export const isImgType = (type: string) => type === 'public.png'
export const isTextType = (type: string) => type === 'public.utf8-plain-text'

export const ORM = {
  list<T>(db: Sqlite) {
    return db.urows<T>(`SELECT * FROM clipboard ORDER BY created_at DESC LIMIT 10`)
  },
}
