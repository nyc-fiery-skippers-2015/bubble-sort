module GameUpdates

 def card_check( input,answer)
    input.downcase == answer.downcase
  end

  def report_update card_def, counter
     if counter > 0
      new_report.incorrect_cards(card_def,counter)
    else
      new_report.correct_cards(card_def,counter)
    end
  end
end
