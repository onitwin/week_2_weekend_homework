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



    #extension

    # def charge_for_stuff(tab_name,stuff)
    #     tab_name.add_money_to_till(stuff)#method calls stuff.price
    # end #testing action of only adding cash to till

    def charge_for_stuff(tab_name,stuff,cust)
      if cust.wallet > stuff.cost
        tab_name.add_money_to_till(stuff)#method calls stuff.price
        cust.remove_cash_from_wallet(stuff)
      else
        return "Sorry, you don't have enough money"
      end
    end

























  end

























end
