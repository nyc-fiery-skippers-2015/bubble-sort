require 'pry'
# require_relative 'deck.rb'

class Card

  attr_reader :id, :definition, :answer

  def initialize(args = {})
    @id = args[:id]
    @definition = args[:definition]
    @answer = args[:answer]
  end

end
