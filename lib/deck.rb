class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

   def count
     @cards.count
   end

   def cards_in_category(category)
     @cards.find_all do |card|
      card.category == category
    end
   end

   def categories_list
     @cards.map do |card|
       card.category
     end.uniq
   end

end
