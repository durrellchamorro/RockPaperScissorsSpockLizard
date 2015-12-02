require 'yaml'
require './computer'
require './user'

OUTCOMES = YAML.load(File.open('outcomes.yml'))

class RockPaperScissorsSpockLizard
  attr_accessor :user, :computer

  def initialize
    @user = User.new
    @computer = Computer.new
  end

  def play
    user.pick_hand
    computer.pick_hand
    announce_winner
    record_score
    display_score
    display_best_of_five_games_winner_if_winner_exists
    delete_all_wins_if_five_games_winner_exists
    ask_user_to_play_again
  end

  private

  def winner
    user > computer ? " You win!" : " Computer wins!"
  end

  def announce_winner
    if user.hand == computer.hand
      puts "Tie!"
    else
      puts OUTCOMES[user.hand + computer.hand] + winner
    end
  end

  def record_score
    user.wins += 1 if user > computer
    computer.wins += 1 if computer > user
  end

  def display_score
    puts "Total wins:"
    puts "You: #{user.wins}"
    puts "Computer: #{computer.wins}"
  end

  def ask_user_to_play_again
    puts "Press enter to play again or enter 'q' to quit."
    if gets.strip.downcase == 'q'
      system 'clear'
      puts "Good bye"
    else
      play
    end
  end

  def best_of_five_games_winner
    return user if user.wins == 3
    return computer if computer.wins == 3
  end

  def display_best_of_five_games_winner_if_winner_exists
    announce_best_of_five_games_winner if best_of_five_games_winner
  end

  def announce_best_of_five_games_winner
    if best_of_five_games_winner == computer
      puts "Computer won the best of five games!"
    else
      puts "You won the best of five games!"
    end
  end

  def delete_all_wins
    user.wins = 0 && computer.wins = 0
  end

  def delete_all_wins_if_five_games_winner_exists
    delete_all_wins if best_of_five_games_winner
  end
end

RockPaperScissorsSpockLizard.new.play
