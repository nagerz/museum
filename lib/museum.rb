class Museum
  attr_accessor :name,
              :exhibits,
              :patrons,
              :revenue

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended_exhibits = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recommended_exhibits << exhibit
      end
    end
    recommended_exhibits
  end

  def admit(patron)
    @patrons << patron
    #attend_exhibits(patron)
  end

  def patrons_by_exhibit_interest
    exhibit_by_interest = {}
    @exhibits.each do |exhibit|
      interested_patrons = []
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          interested_patrons << patron
        end
      end
      exhibit_by_interest[exhibit] = interested_patrons
    end
    exhibit_by_interest
  end

  def affordable_exhibits(patron)
    affordable_exhibits = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name) && patron.spending_money >= exhibit.cost
        affordable_exhibits << exhibit
      end
    end
    affordable_exhibits
  end

  def sort_affordable_exhibits(patron)
    sorted_exhibits = affordable_exhibits(patron).sort_by {|exhibit| exhibit.cost}
    sorted_exhibits.reverse
  end

  def attend_exhibits(patron)
    while !sort_affordable_exhibits(patron).empty?
      patron.attended_exhibits << sort_affordable_exhibits(patron)[0]
      @revenue += sort_affordable_exhibits(patron)[0].cost
      patron.spending_money -= sort_affordable_exhibits(patron)[0].cost
      attend_exhibits(patron)
    end
    return patron.attended_exhibits
  end

  def patrons_of_exhibits
  end

end
