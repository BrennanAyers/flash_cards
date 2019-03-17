require_relative 'card'

class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @filename = "./lib/#{filename}"
    @cards = []

    File.foreach(@filename) do |line|
      question = line.split(",")[0]
      answer = line.split(",")[1]
      category = line.rstrip.split(",")[2]
      @cards << Card.new(question, answer, category)
    end
  end

  def check_file_path
    "The file path used for this set of cards is: #{@filename}"
  end

end
