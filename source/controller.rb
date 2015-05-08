




class Controller
  attr_reader:flash_deck :new_report
  def initialize (file)
    @name = file
    @flash_deck = Deck.new(Cardloader.load(file))
    @new_report = Report.new
    run
  end

  def card_check( input,answer)
    input.downcase == answer.downcase
  end

  def run
  return View.print_report if flash_deck.cards.empty?

  View.display("Welcome to the flash card game subject:#{@name}")
  current_card = flash_deck.get_card
  View.display(current_card.definition)
  user_input = View.input
  counter = 0
  checks = card_check (user_input,current_card.answer)
  until checks || counter ==3
    counter +=1
    View.display(current_card.definition)
    user_input = View.input
    checks = card_check (user_input,current_card.answer)
  end
  report.add (current_card, counter) if counter > 0
  run
  end

end




game = Controller.new( ARGV[0])
