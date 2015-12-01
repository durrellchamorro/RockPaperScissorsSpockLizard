require './player'

class User < Player
  attr_reader :hand
  attr_accessor :wins

  def initialize
    @wins = 0
  end

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

  def pick_hand
    display_hand_selection_prompt
    set_hand_from_input
  end

  private

  def display_hand_selection_prompt
    system 'clear'
    puts "Select: 'r' Rock, 'p', Paper, 's' Scissors, 'l' Lizard, 'sp' Spock"
  end

  def set_hand_from_input
    self.hand = gets.strip.downcase
  rescue => @error_message
    puts @error_message
    handle_errors
    pick_hand if @error_message
  end

  def handle_errors
    return unless @error_message
    sleep 2
    system 'clear'
  end
end
