class Turn

  def initialize(question, activePlayer)
    @question = question
    @activePlayer = activePlayer
  end

  def ask
    puts "Player #{@activePlayer.number}:"\
    " What does #{@question.num1}"\
    " plus #{@question.num2} equal?"
    input = gets.chomp.to_i
    result = @question.answer == input
    if result
      puts "Player #{@activePlayer.number}:"\
      " YES! You are correct."
    else
      puts "Player #{@activePlayer.number}:"\
      " Seriously? No!"
    end
    return result
  end

  attr_reader :question

end