require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @generator = CardGenerator.new('cards.txt')
  end

  def test_it_exists
    assert_instance_of CardGenerator, @generator
  end

  def test_it_has_a_deck
    assert_instance_of Deck, @generator.deck
  end

  def test_it_has_cards_in_the_deck
    assert_equal 4, @generator.deck.length
  end
end
