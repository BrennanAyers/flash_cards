require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @generator = CardGenerator.new('../lib/cards.txt')
  end

  def test_it_exists
    assert_instance_of CardGenerator, @generator
  end

  def test_it_has_cards
    assert_instance_of Card, @generator.cards[0]
    assert_equal 4, @generator.cards.length
  end

  def test_it_correctly_generates_the_cards
    assert_equal "What is 5 + 5?", @generator.cards[0].question
    assert_equal "What is Rachel's favorite animal?", @generator.cards[1].question
    assert_equal "What is Mike's middle name?", @generator.cards[2].question
    assert_equal "What cardboard cutout lives at Turing?", @generator.cards[3].question
  end

  def test_it_does_not_generate_cards_if_given_empty_file
    empty_generator = CardGenerator.new('../lib/empty.txt')
    assert_equal [], empty_generator.cards
  end
end
