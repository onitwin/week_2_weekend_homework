class Customer

  attr_reader :name, :wallet ,:fave_song
  attr_writer :wallet



  def initialize(name,wallet,fave_song)
    @name=name
    @wallet=wallet
    @fave_song=fave_song
  end

  def check_for_fave_song(room)
    for song in room.songs
      if song.name==@fave_song
        return "Wahoo, I love this song!"
      else
        return "Dammit"
      end
    end
  end#Joseph Sutherland
  #This functions calls the @songs array from within the
  #karaoke class










end
