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
     @cards.each do |card|
      if card.category == category
        matching_cards << card
      end
    end
    matching_cards
   end

   # def categories_list
   #   categories_array = []
   #   @cards.each do |card|
   #     categories_array << card.category
   #   end
   #   categories_array
   # end

end
