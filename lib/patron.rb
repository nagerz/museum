class Patron
  attr_accessor :name,
              :spending_money,
              :interests,
              :attended_exhibits

  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @interests = []
    @attended_exhibits = []
  end

  def add_interest(interest)
    @interests << interest
  end

end
