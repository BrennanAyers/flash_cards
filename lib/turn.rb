class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
    @correct = @guess == @card.answer
  end

  def correct?
    @correct
  end

  def feedback
    if @correct
      "Correct!"
    else
      "Incorrect."
    end
  end
  

end
