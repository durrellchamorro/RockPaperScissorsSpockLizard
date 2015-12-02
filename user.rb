require './player'

class User < Player
  attr_reader :hand
  attr_accessor :wins

  def pick_hand
    display_hand_selection_prompt
    self.hand = gets.strip.downcase
  rescue => error_message
    puts error_message
    sleep 2
    retry
  end

  private

  def hand=(user_selection)
    unless ['r', 'p', 's', 'l', 'sp'].include? user_selection
      fail ArgumentError, "You must select 'r', 'p', 's', 'l', or 'sp'"
    end
    assign_hand(user_selection)
  end

  def assign_hand(user_selection)
    @hand = 'rock' if user_selection == 'r'
    @hand = 'paper' if user_selection == 'p'
    @hand = 'scissors' if user_selection == 's'
    @hand = 'lizard' if user_selection == 'l'
    @hand = 'spock' if user_selection == 'sp'
  end

  def display_hand_selection_prompt
    system 'clear'
    puts "Select: 'r' Rock, 'p', Paper, 's' Scissors, 'l' Lizard, 'sp' Spock"
  end
end
