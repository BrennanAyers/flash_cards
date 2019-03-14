require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :Math)
card_2 = Card.new("What is Rachel's favorite animal?", "AARDVARK", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "NOBODY KNOWS", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "JUSTIN BIEBER", :Pop_Culture)

flashcard_deck = Deck.new([card_1, card_2, card_3, card_4])

flashcard_round = Round.new(flashcard_deck)

## Begin Game

flashcard_round.start

## Game Flow
# All listed comments are output/input to the console

# Welcome

# Card 1/4
# Question
# Ask for Answer
# Correct or Incorrect

# Card 2/4
# Question
# Ask for Answer
# Correct or Incorrect

# Card 3/4
# Question
# Ask for Answer
# Correct or Incorrect

# Card 4/4
# Question
# Ask for Answer
# Correct or Incorrect

# Game Over
# Correct Number of Answers and Percent Correct Answers
# Percent By Category
# Percent By Category
# Percent By Category et al
