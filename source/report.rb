class Report

  attr_accessor :correct_cards_array, :incorrect_cards_array
  def initialize
    #@name = name
    @correct_cards_array = []
    @incorrect_cards_array = []
  end


  def correct_cards(card, count)
    correct_cards_array << [card, count]
  end

  def incorrect_cards(card, count)
    incorrect_cards_array.push( [:card => count])
  end


  def correct_percentage
    correct = correct_cards_array.length / (correct_cards_array.length + incorrect_cards_array.length) * 100
  end

  def incorrect_percentage
    incorrect = incorrect_cards_array.length / (correct_cards_array.length + incorrect_cards_array.length) * 100
  end

  def to_s
    "You got #{correct_percentage} correct.\n You got #{incorrect_percentage} incorrect.\n"
    "Your incorrect cards"
    incorrect_cards.each {|key, value| puts "#{key} \n #{value} incorrect answers"}
  end
end
