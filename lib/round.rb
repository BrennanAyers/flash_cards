require '../lib/turn'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.slice!(0)
    @number_correct = 0
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    if new_turn.correct?
      @number_correct += 1
    end
    @current_card = @deck.cards.slice!(0)
    new_turn
  end

  def number_correct_by_category(category)
    correct = 0
    @turns.each do |turn|
      if turn.card.category == category
        if turn.correct?
          correct += 1
        end
      end
    end
    correct
  end

  def percent_correct
    @number_correct / @turns.length.to_f * 100
  end

  def percent_correct_by_category(category)
    category_turns = 0
    @turns.each do |turn|
      if turn.card.category == category
        category_turns += 1
      end
    end
    correct = number_correct_by_category(category)
    correct / category_turns * 100
  end
end
