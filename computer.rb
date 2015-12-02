require './player'

class Computer < Player
  attr_accessor :hand, :wins

  def pick_hand
    self.hand = ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample
  end
end
