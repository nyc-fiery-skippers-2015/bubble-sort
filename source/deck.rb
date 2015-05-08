class Deck

attr_reader :cards

  def initialize(cards)
    @cards = cards || []
  end

  def get_card
    cards.shuffle.pop
  end

end


# controller
# Controller.new(Deck.new(CardLoader.load('flashcard_samples.txt')))

