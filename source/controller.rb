require_relative 'cardloader.rb'
require_relative 'deck.rb'
require_relative 'report.rb'
require_relative 'view.rb'


class Controller
  attr_reader:flash_deck, :new_report
  def initialize(file)
    @name = file
    @flash_deck = Deck.new(Cardloader.load(file))
    @new_report = Report.new(@name)
    run
  end

def card_check(input, answer)
  input.downcase == answer.downcase
end

def report_update(card_def, counter)
  if counter > 0
    new_report.incorrect_cards(card_def,counter)
  else
    new_report.correct_cards(card_def,counter)
  end
end


def run

    return View.display (new_report)  if flash_deck.cards.empty?
    current_card = flash_deck.get_card
    counter = 0
    checks = false
    until checks || counter == 3
      counter +=1
      View.display(current_card.definition)
      user_input = View.input
      checks = card_check(user_input,current_card.answer)
       puts "Wrong " if checks == false
       puts "Right!" if checks
    end
   # report_update(current_card,counter)
  run
  end

end

 View.display("Welcome to the flash card game")
  new_game = Controller.new('flashcard_samples.txt')

