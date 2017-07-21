class Player
  attr_reader :score, :name, :wins, :losses

  def initialize(name)
    @name = name
    @score = 0
    @wins = 0
    @losses = 0
  end

  def start_game
    @score = 0
  end

  def start_turn
    @turn_score = 0
    @turn_over = false
    @roll_counter = 0
  end

  def record_roll(roll)
    if roll == 1
      @turn_score = 0
      @roll_counter = 0
      @turn_over = true
    else
      @turn_score += roll
      @roll_counter += 1
    end
  end

  def end_turn
    @score += @turn_score
  end

  def end_game
    if score >= 100
      @wins += 1
    else
      @losses += 1
    end
  end

  def roll_again?
    !@turn_over
  end
end

class CautiousPlayer < Player
  def roll_again?
    super && @turn_score < 2
  end
end

class TargetPlayer < Player
  def roll_again?
    super && @turn_score <= 30
  end
end

class RollPlayer < Player
  def roll_again?
    super && @roll_counter <= 4
  end
end

class AmbitiousPlayer < Player
  def roll_again?
    super && @turn_score < 50
  end
end
