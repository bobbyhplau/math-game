require './turn.rb'
require './question.rb'

class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @activePlayer = @player1
    @nextPlayer = @player2
  end

  attr_accessor :player1, :player2, :activePlayer, :nextPlayer

  def score(result)
    if !result
      activePlayer.life -= 1
    end
  end

  def switchActivePlayer
    @activePlayer, @nextPlayer = @nextPlayer, @activePlayer
  end

  def printWinner(number, life)
    puts "Player #{number} wins with a score of #{life}/3"
  end

  def determineWinner
    if player1.life != 0
      printWinner(player1.number, player1.life)
    else
      printWinner(player2.number, player2.life)
    end
  end

  def start
    while @player1.life != 0 && @player2.life != 0 do
      t = Turn.new(Question.new, activePlayer)
      result = t.ask
      score(result)
      switchActivePlayer
      puts "P#{@player1.number}: #{@player1.life}/3 vs "\
      "P#{@player2.number}: #{@player2.life}/3"
      puts "----- NEW TURN -----"
    end
    determineWinner
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end