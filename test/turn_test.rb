require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn

  end

  def test_it_has_a_card
    assert_instance_of Card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_is_a_correct_guess
    assert @turn.correct?
  end

  def test_it_does_not_mark_a_guess_incorrect_because_of_case
    turn = Turn.new("juneau", @card)

    assert turn.correct?
  end

  def test_it_does_not_modify_the_guess_after_using_correct
    turn = Turn.new("juneau", @card)

    turn.correct?
    assert_equal "juneau", turn.guess
  end

  def test_it_can_provide_feedback
    assert_equal "Correct!", @turn.feedback
  end

  def test_incorrect_answers_are_marked_incorrect
    turn = Turn.new("Anchorage", @card)

    refute turn.correct?
  end

  def test_it_provides_feedback_when_incorrect
    turn = Turn.new("Anchorage", @card)

    assert_equal "Incorrect.", turn.feedback
  end

end
