require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke')
require_relative('../songs')
require_relative('../customer')
require_relative('../tab')

class CustomerTest < MiniTest::Test


  def setup
    @tommy=Customer.new("Tommy",76,"Everlong")
    @gina=Customer.new("Gina",300,"Total Eclipse of the Heart")
    @venue=Karaoke.new('Lungs',3,10,"Rock")
    @song1=Song.new("Everlong","Foo Fighters",3,"Rock")
    @song2=Song.new("Total Eclipse of the Heart","Bonnie Tyler",4.35,"Pop")
  end

  def test_for_name
    assert_equal("Tommy",@tommy.name)
  end

  def test_for_wallet
    assert_equal(300,@gina.wallet)
  end

  def test_for_fave_song
    assert_equal("Total Eclipse of the Heart",@gina.fave_song)
  end

  #all basic properties accessible

  def test_for_fave_song_present
    @venue.add_song_to_room(@song2)#add favourite song to room array
    assert_equal("Wahoo, I love this song!",@gina.check_for_fave_song(@venue))
  end

  def test_for_fave_song_not_present
    @venue.add_song_to_room(@song1)#add song that is not the favourite
    assert_equal("Dammit",@gina.check_for_fave_song(@venue))
  end

  def test_remove_cash_from_wallet
    assert_equal(300,@gina.wallet) #check starting balance in customer wallet
    @gina.remove_cash_from_wallet(@venue)#remove cash
    assert_equal(290,@gina.wallet)#check ending balance
  end























end
