require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke')
require_relative('../songs')
require_relative('../customer')

class SongTest < MiniTest::Test


  def setup
    @song1=Song.new("Everlong","Foo Fighters",3,"Rock")#3 arguements
    @song2=Song.new("Total Eclipse of the Heart","Bonnie Tyler",4.35,"Pop")
  end

  def test_for_name
    assert_equal("Everlong",@song1.name)
  end

  def test_for_duration
    assert_equal(4.35,@song2.duration)
  end

  def test_for_genre
    assert_equal("Pop",@song2.genre)
  end

  def test_for_band
    assert_equal("Foo Fighters",@song1.band)
  end

#all basic properties accessible and correct
#all properties are set and therefore do not require writer




















end
