module TracksHelper

  def ugly_lyrics(lyrics)
    current = lyrics.split(/\n/)
    current.map{|x| "♫"+x}
  end

end
