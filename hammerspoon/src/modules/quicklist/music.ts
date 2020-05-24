import { IChoice } from './init'

export class Music {
  chooser: Chooser | undefined
  album: string = ''
  artist: string = ''
  track: string = ''

  constructor(chooser: Chooser) {
    this.chooser = chooser
  }

  status(): IChoice {
    const { track, artist, album, albumImg } = this.now()

    return {
      text: `${track} - ${artist}`,
      subText: `${album} by Music`,
      image: albumImg,
      child: this.menu,
    }
  }

  now() {
    const album = hs.itunes.getCurrentAlbum()
    const artist = hs.itunes.getCurrentArtist()
    const track = hs.itunes.getCurrentTrack()

    const [_, data] = hs.osascript.applescriptFromFile(
      `${os.getenv('HOME')}/.hammerspoon/modules/quicklist/album.applescript`,
    )

    const path = `/${(data as string).split(':').slice(1).join('/')}`

    const albumImg = hs.image.imageFromPath(path)

    this.track = track
    this.artist = artist
    this.album = album

    return { track, artist, album, albumImg }
  }

  get menu(): IChoice[] {
    return [
      {
        text: `${this.track} - ${this.artist}`,
        subText: `${this.album} by Music`,
      },
      {
        text: 'Play/Pause',
      },
      {
        text: 'prev',
      },
      {
        text: 'next',
      },
    ]
  }
}
