# frozen_string_literal: true

class WrongClass < StandardError
  WRONG_CLASS = 'Wrong class!'

  def initialize
    super(WRONG_CLASS)
  end
end
