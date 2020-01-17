class Karaoke

  attr_reader :name,:songs,:guests , :capacity ,:cost,:genre
  attr_writer :songs,

  def initialize(room_name,capacity,cost_for_room,genre)
    @name=room_name
    @songs=[]
    @capacity=capacity
    @cost=cost_for_room
    @guests=[]
    @genre=genre



    def add_guest (guest)
      @guests << guest
    end

    def remove_guest #last in first out policy
      @guests.pop
    end

    def remove_specific_guest(guest)
      for patron in @guests
        if patron ==guest
          @guests.delete(guest)
        end
      end
    end

    def add_song_to_room(playlist)
      @songs << playlist
    end

    def refuse_entry_for_capacity(guest)
      if @guests.length < @capacity
        add_guest(guest)
      else
        return"Sorry, there are too many people in there"
      end
    end

    def remove_specific_song(playlist)
      for song in @songs
        if playlist == song
          @songs.delete(song)
        end
      end
    end






















  end

























end
