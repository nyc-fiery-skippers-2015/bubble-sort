require 'pry'
require_relative 'deck.rb'

class Card

  attr_reader :id, :definition, :answer


  def initialize(args = {})
    @id = args[:id]
    @definition = args[:definition]
    @answer = args[:answer]
  end

end

# x = Card.new(:id => 1, :definition => "who are you?", :answer => "your mom")

# y = Card.new(:id => 2, :definition => "what is ruby?", :answer => "a language")

# z = Card.new(:id => 3, :definition => "what is JavaScript?", :answer => "a language")
#  # x = Deck.new(CardLoader.load("flashcard_samples.txt")
