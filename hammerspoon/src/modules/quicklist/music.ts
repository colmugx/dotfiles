import { IChoice } from './init'

export class Music {
  readonly appName = '音乐' // Apple Music
  chooser: Chooser | undefined
  album: string = ''
  artist: string = ''
  track: string = ''
  albumImg: string = ''

  constructor(chooser: Chooser) {
    this.chooser = chooser
  }

  status(): IChoice {
    const item: IChoice = {
      text: 'Apple Music',
      image: hs.image.imageFromPath('./modules/assests/AppIcon.icns'),
      content: {
        action: 'open',
        attr: 'Music'
      }
    }
    const isRunning = hs.application.get(this.appName) !== null
    if (!isRunning) {
      return item
    }
    const isStoping = hs.itunes.getPlaybackState() === hs.itunes.state_stopped
    if (isStoping) {
      return item
    }

    const { track, artist, album, albumImg } = this.now()
    const isPlaying = hs.itunes.getPlaybackState() === hs.itunes.state_playing

    return {
      ...item,
      text: `【当前播放】${track} - ${artist}`,
      subText: `${album} by Music`,
      image: albumImg,
      child: this.menu(isPlaying),
    }
  }

  now() {
    const album = hs.itunes.getCurrentAlbum()
    const artist = hs.itunes.getCurrentArtist()
    const track = hs.itunes.getCurrentTrack()

    const [_, data] = hs.osascript.applescriptFromFile(
      './modules/quicklist/album.applescript',
    )

    const path = `/${(data as string).split(':').slice(1).join('/')}`

    const albumImg = hs.image.imageFromPath(path)

    this.track = track
    this.artist = artist
    this.album = album
    this.albumImg = albumImg

    return { track, artist, album, albumImg }
  }

  menu(status: boolean): IChoice[] {
    return [
      {
        text: status ? '暂停(pause)' : '播放(play)',
        subText: `${this.track} by Music`,
        image: this.albumImg,
        content: {
          action: 'music',
          attr: 'playpause'
        }
      },
      {
        text: '上一首(prev track)',
        image: hs.image.imageFromPath('./modules/assests/previous.png'),
        content: {
          action: 'music',
          attr: 'previous'
        }
      },
      {
        text: '下一首(next track)',
        image: hs.image.imageFromPath('./modules/assests/next.png'),
        content: {
          action: 'music',
          attr: 'next'
        }
      },
    ]
  }
}
