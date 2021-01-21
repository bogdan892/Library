# frozen_string_literal: true

class WrongNumber < StandardError
  WRONG_NUMBER = 'not a number or negative!'

  def initialize
    super(WRONG_NUMBER)
  end
end
