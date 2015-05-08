class Deck

attr_reader :cards
  def initialize (card)
   @cards = card || []

  end

  def shuffle
    cards.shuffle
  end

 def get_card
    cards.pop
end

def

end
