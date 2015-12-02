class Player
  include Comparable

  def initialize
    @wins = 0
  end

  def <=>(other)
    if hand == other.hand
      0
    elsif self_is_greater_than(other)
      1
    else
      -1
    end
  end

  private

  def self_is_greater_than(other)
    hand == 'scissors' && other.hand == 'paper' ||
    hand == 'paper' && other.hand == 'rock' ||
    hand == 'rock' && other.hand == 'lizard' ||
    hand == 'lizard' && other.hand == 'spock' ||
    hand == 'spock' && other.hand == 'scissors' ||
    hand == 'scissors' && other.hand == 'lizard' ||
    hand == 'lizard' && other.hand == 'paper' ||
    hand == 'paper' && other.hand == 'spock' ||
    hand == 'spock' && other.hand == 'rock' ||
    hand == 'rock' && other.hand == 'scissors'
  end
end
