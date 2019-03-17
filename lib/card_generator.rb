require_relative 'deck'
require_relative 'card'

class CardGenerator
  attr_reader

  def initialize(file)
    @file = "./lib/#{file}"
    @deck = Deck.new
  end

  def cards
    File.foreach(@file) do |line|
      question = line.split(",")[0]
      answer = line.split(",")[1]
      category = line.rstrip.split(",")[2]
      @deck.cards << Card.new(question, answer, category)
    end
  end

end
