require_relative 'cardloader.rb'

class Deck
include Cardloader
attr_reader :cards
  def initialize (cards)
    @cards = cards || []
  end

  def shuffle
    # cards.shuffle
  end

  def get_card
    cards.pop
  end
end

p  Deck.new(Cardloader.load('flashcard_samples.txt'))
