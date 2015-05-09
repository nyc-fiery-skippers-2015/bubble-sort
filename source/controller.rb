# require_relative 'cardloader.rb'
# require_relative 'deck.rb'
# require_relative 'report.rb'
# require_relative 'view.rb'


# require 'pry'
# class Controller
#   attr_reader :flash_deck, :new_report

#   def initialize(file)
#     @flash_deck = Deck.new(Cardloader.load(file))
#     @new_report = Report.new(new_file)
#     run
#   end

# def card_check(input, answer)
#   input.downcase == answer.downcase
# end

# def report_update(card_def, counter)
#   if counter > 0
#     new_report.incorrect_cards(card_def,counter)
#   else
#     new_report.correct_cards(card_def,counter)
#   end
# end

# def run

#     return View.display (new_report)  if flash_deck.cards.empty?
#     View.display("Welcome to the flash card game, what subject would you like to play?")
#     current_card = flash_deck.get_card
#     View.display(current_card[:definition]) #cards set up as hash
#     View.display("What is the Answer?")
#     user_input = View.input
#     binding.pry
#     counter = 0
#     checks = card_check(user_input, current_card[:answer])
#     until checks || counter == 3
#       counter +=1
#       View.display(current_card[:definition])
#       user_input = View.input
#       checks = card_check(user_input,current_card[:answer])
#     end
#   report_update(current_card[:definition], counter)
#   run
#   end

# end

# if ARGV.any?
#   new_game = Controller.new(ARGV[0])
# end


require_relative 'cardloader.rb'
require_relative 'deck.rb'
require_relative 'report.rb'
require_relative 'view.rb'


require 'pry'
class Controller
  attr_reader :flash_deck
  attr_accessor :new_report
  def initialize(file)
    #@name = file
    @flash_deck = Deck.new(Cardloader.load(file))
    @new_report = Report.new
    View.display("Welcome to the flash card game, what subject would you like to play?")
    run
  end

def card_check(guess, answer)
  guess.downcase == answer.downcase
end

def report_update(card, counter)

  if counter > 0
    puts "Hello"
    new_report.incorrect_cards(card, counter)
  else
    new_report.correct_cards(card, counter)
  end
end

def run

  return View.display (new_report)  if flash_deck.cards.empty?
  # View.display("Welcome to the flash card game, what subject would you like to play?")
  current_card = flash_deck.get_card
  View.display(current_card.definition)
  View.display(current_card.answer)
  View.display("What is the Answer?")
  user_input = View.input
  counter = 0

  checks = card_check(user_input, current_card.answer)

  until checks == true || counter == 3
    View.display(current_card.definition)
    user_input = View.input
    checks = card_check(user_input,current_card.answer)
    counter +=1
  end
  report_update(current_card.definition, counter)
  run
end

end

x = Controller.new('flashcard_samples.txt')
x.run

# if ARGV.any?
#   new_game = Controller.new(ARGV[0])

# end