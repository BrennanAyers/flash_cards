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

  def check_file_path
    "The file path used for this set of cards is: #{@file_path}"
  end

end
