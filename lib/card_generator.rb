require_relative 'card'

class CardGenerator
  attr_reader :cards

  def initialize(file_path)
    @file_path = file_path
    @cards = []

    File.foreach(@file_path) do |line|
      question = line.split(",")[0]
      answer = line.split(",")[1]
      category = line.rstrip.split(",")[2]
      @cards << Card.new(question, answer, category)
    end
  end

end
