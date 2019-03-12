class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

   def count
     @cards.count
   end

   def cards_in_category(category)
     matching_cards = []
     @cards.each {|card|
      if card.category == category
        matching_cards << card
      end}
    matching_cards
   end

end
