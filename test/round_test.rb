require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'
require '../lib/round'


class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)

    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_starts_with_zero_turns
    assert_equal [], @round.turns
  end

  def test_it_starts_with_the_first_card
    assert_equal "What is the capital of Alaska?", @round.current_card.question
  end

  def test_it_can_take_a_turn
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_it_knows_if_a_guess_is_correct
    new_turn = @round.take_turn("Juneau")

    assert new_turn.correct?
  end

  def test_it_can_hold_turns_in_memory
    new_turn = @round.take_turn("Juneau")

    assert_equal 1, @round.turns.length
    assert_equal "Juneau", @round.turns.first.guess
  end

  def test_it_knows_one_guess_is_correct
    new_turn = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_it_progresses_to_next_card_after_one_turn
    new_turn = @round.take_turn("Juneau")

    assert_equal "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @round.current_card.question
  end

  def test_it_counts_a_second_turn_correctly
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 2, @round.turns.count
  end

  def test_it_provides_feedback_for_incorrect_guesses
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_it_tracks_correct_guesses_accurately
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 1, @round.number_correct
  end

  def test_it_tracks_correct_guesses_by_category
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_it_returns_the_correct_percent_correct
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_it_returns_the_correct_percent_correct_by_category
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    assert_equal 0.0, @round.percent_correct_by_category(:STEM)
    assert_equal "No guesses in that category.", @round.percent_correct_by_category("Pop Culture")
  end

  def test_it_is_on_the_third_card_after_two_turns
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal "Describe in words the exact direction that is 697.5° clockwise from due north?", @round.current_card.question
  end
end
