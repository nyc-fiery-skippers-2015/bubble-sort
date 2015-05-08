class Report

  attr_reader :score, :correct_cards, :incorrect_cards
  def initialize (name)
    @name = name
    @score = args[:score, 0]
    @correct_cards = []
    @incorrect_cards = {}
  end


  def correct_cards(card,count)
    correct_cards << [card,count]
  end

  def incorrect_cards (card,count)
    incorrect_cards << [:card => count]
  end


  def correct_percentage
    correct = correct_cards.length / (correct_cards.length + incorrect_cards.length) * 100
  end

  def incorrect_percentage
    incorrect = incorrect_cards.length / (correct_cards.length + incorrect_cards.length) * 100
  end

  def to_s
    "You got #{correct_percentage} correct.\n You got #{incorrect_percentage} incorrect.\n"
    "Your incorrect cards"
    incorrect_cards.each {|key, value| puts "#{key} \n #{value} incorrect answers"}
  end
end
