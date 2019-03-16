class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess.to_s.upcase == @card.answer.to_s.upcase
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end


end
