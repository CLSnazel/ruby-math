class Question
  MIN_RAND = 1
  MAX_RAND = 20

  def initialize()
    @num1 = rand MIN_RAND...MAX_RAND
    @num2 = rand MIN_RAND...MAX_RAND
    @correct_answer = @num1 + @num2
  end

  def question
    return "What does #{@num1} plus #{@num2} equal?"
  end

  def correct?(answer)
    return @correct_answer == answer
  end
end