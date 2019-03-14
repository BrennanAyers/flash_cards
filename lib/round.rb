require_relative '../lib/turn'

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
    if category_turns == 0
      "No guesses in that category."
    else
      correct / category_turns * 100
    end
  end

  def start
    current_round = 1
    deck_size = @deck.cards.length + 1
    puts "Welcome! You're playing with #{deck_size} cards."
    puts "-" * 20
    until current_round > deck_size
      puts "This is card #{current_round} out of #{deck_size}."
      puts "Question: #{@current_card.question}"
      current_guess = gets.chomp
      current_turn = take_turn(current_guess)
      puts current_turn.feedback
      current_round += 1
    end
    puts "Game Over!"
    puts "You had #{@number_correct} correct guesses out of #{deck_size} for a total score of #{percent_correct.to_i}%."
  end
end
