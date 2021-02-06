# frozen_string_literal: true

module Errors
  class WrongNumber < StandardError
    WRONG_NUMBER = 'not a number or negative!'

    def initialize
      super(WRONG_NUMBER)
    end
  end
end
