class Player
  MAX_LIVES = 3
  MIN_LIVES = 0

  attr_reader :name, :label
  
  def initialize(name, label)
    @name = name
    @label = label
    @lives = MAX_LIVES
  end 

  def reduce_lives
    @lives -= 1
  end

  def prompt
    print @label + "> "
  end

  def answer
    return gets.chomp.to_i
  end

  def alive?
    return @lives > MIN_LIVES
  end

  def score
    return "#{@lives}/#{MAX_LIVES}"
  end

end