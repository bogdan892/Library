# frozen_string_literal: true

module Errors
  class WrongClass < StandardError
    WRONG_CLASS = 'Wrong class!'

    def initialize
      super(WRONG_CLASS)
    end
  end
end
