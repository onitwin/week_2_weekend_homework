require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke')
require_relative('../songs')
require_relative('../customer')
require_relative('../tab')

class TabTest < MiniTest::Test

  def setup
    @cust3=Customer.new("Joseph",40,"Everlong")
    @rockroom=Karaoke.new("Rock Room",6,30,"Rock")
    @charges=Tab.new #no properties to set, just new item

  end

  def test_for_till_holdings
    assert_equal(0,@charges.till)
  end

  def test_add_money_to_till
    assert_equal(0,@charges.till) #check till before taking Cash
    @charges.add_money_to_till(@rockroom)#insert variable with cost property to charge for
    assert_equal(30,@charges.till)#check value has been charged
  end












end
