class Patron
  attr_reader :name,
              :spending_money,
              :interests

  def initialize(name, cost)
    @name = name
    @spending_money = cost
    @interests = []
  end

  def add_interest(interest)
    @interests << interest
  end

end
