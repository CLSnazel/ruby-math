require './question'
require './player'
class Game

  def initialize
    @p1 = Player.new("Player 1", "P1")
    @p2 = Player.new("Player 2", "P2")
  end
  
  def winner
    result = nil
    
    if(@p1.alive? && !@p2.alive?)
      result = @p1
    elsif (@p2.alive? && !@p1.alive?) 
      result = @p2
    end
    
    return result
  end

  def print_status
    winning_player = winner

    if(winning_player != nil)
      puts "#{winning_player.name} has won with a score of #{winning_player.score}."
    else 
      puts "#{@p1.label}: #{@p1.score} vs #{@p2.label}: #{@p2.score}"
    end

  end

  def print_divider(msg)
    puts "---- " + msg.upcase + " ----"
  end

  def turn(player)
    print_divider(player.name + "'s turn")
    question = Question.new()

    puts player.name + ": " + question.question()
    player.prompt
    answer = player.answer

    is_correct = question.correct?(answer)
    print player.name + ": "
    if(!is_correct)
      puts("That's incorrect. You have lost a life")
      player.reduce_lives
    else 
      puts("Correct! Good Job.")
    end
    print_status
  end

  def end_game
    print_divider("Game over")
    puts "Thanks for playing! Goodbye."
  end

  def run_game
    while(winner == nil)
      turn(@p1)

      if(winner)
        break
      end

      turn(@p2)
    end
    end_game
  end

end