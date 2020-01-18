require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke')
require_relative('../songs')
require_relative('../customer')
require_relative('../tab')

class KaraokeTest < MiniTest::Test


  def setup
    @venue=Karaoke.new('Lungs',3,10,"Rock")
    @charges=Tab.new
    @song2=Song.new("Used for Glue","Rival Schools",3.19,"Rock")
    @song5=Song.new("Born to Die","Lana Del Ray",4.10,"Pop")
    @song9=Song.new("Ring of Fire","Johnny Cash",2.38,"Country")
    @tommy=Customer.new("Tommy",76,"Everlong")
    @joseph=Customer.new("Joseph",5,"Everlong")
    @gina=Customer.new("Gina",300,"Total Eclipse of the Heart")
  end


  def test_for_name
    assert_equal('Lungs',@venue.name)
  end

  def test_for_songs_themselves
    assert_equal("Born to Die",@song5.name)
  end

  def test_for_capacity
    assert_equal(3,@venue.capacity)
  end

  def test_for_cost
    assert_equal(10,@venue.cost)
  end

  def test_for_guests
    assert_equal(0,@venue.guests.length)
  end

  def test_for_songs_in_room
    assert_equal(0,@venue.songs.length)
  end

  def test_for_genre
    assert_equal("Rock",@venue.genre)
  end

  #all basic properties accessible and correct


  #tests for methods
  def test_for_add_guest
    assert_equal(0,@venue.guests.length)#assert 0 guests
    @venue.add_guest(@gina)#push /shovel guest
    assert_equal(1,@venue.guests.length)#check guest list increased
  end

  def test_for_remove_last_guest
    @venue.add_guest(@gina)
    assert_equal(1,@venue.guests.length)
    @venue.remove_guest
    assert_equal(0,@venue.guests.length)
  end

  def test_for_remove_specific_guest
    @venue.add_guest(@gina)
    @venue.add_guest(@tommy)
    assert_equal(2,@venue.guests.length)
    @venue.remove_specific_guest(@gina)
    assert_equal(1,@venue.guests.length)
  end

  # def test_list_of_guests
  #   @venue.add_guest(@gina)
  #   @venue.add_guest(@tommy)
  #   assert_equal(2,@venue.guests.length)
  #   assert_includes([@gina,@tommy],@venue.guests)
  # end

  def test_add_songs_to_array
    assert_equal(0,@venue.songs.length) #check array is empty
    @venue.add_song_to_room(@song2)
    @venue.add_song_to_room(@song5)
    @venue.add_song_to_room(@song9)
    assert_equal(3,@venue.songs.length) #check array has taken 3 new songs
  end

  def test_refuse_entry_for_capacity
    assert_equal(0,@venue.guests.length) #passes
    @venue.refuse_entry_for_capacity(@gina)#add 1 gina
    @venue.refuse_entry_for_capacity(@gina)#add second gina
    @venue.refuse_entry_for_capacity(@gina) #add third gina
    assert_equal(3,@venue.guests.length)#passes
    @venue.refuse_entry_for_capacity(@gina)#attempt to add 4th gina
    assert_equal(3,@venue.guests.length)#4th gina NOT added
  end



  def test_remove_specific_song_from_playlist
    @venue.add_song_to_room(@song2)
    @venue.add_song_to_room(@song5)
    @venue.add_song_to_room(@song9) #first add songs to array
    assert_equal(3,@venue.songs.length)#check array is 3 items long- passes
    @venue.remove_specific_song(@song5)#remove song
    assert_equal(2,@venue.songs.length)#check list reduced in length
  end

  # def test_to_access_tab #this function calls and uses 'Tab' class to take and hold cash
  #   @venue.charge_for_stuff(@charges,@venue)
  #   assert_equal(10,@charges.till)
  # end #this method works, but creating fresh method to only charge if cust has cash

  def test_charge_cust_cust_has_cash
    @venue.charge_for_stuff(@charges,@venue,@gina)
    assert_equal(290,@gina.wallet)
  end

  def test_charge_cust_cant_pay
    @venue.charge_for_stuff(@charges,@venue,@joseph)
    assert_equal("Sorry, you don't have enough money",@venue.charge_for_stuff(@charges,@venue,@joseph))
  end






















end
