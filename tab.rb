class Tab

  attr_reader :till
  attr_writer :till


  def initialize
    @till=0


  end

  def add_money_to_till(item)
    @till += item.cost #make sure that all chargable items have 'cost' property
  end


















end
