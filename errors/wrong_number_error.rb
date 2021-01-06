# frozen_string_literal: true

class WrongNumber < StandardError
  def initialize
    super('not a number or negative!')
  end
end
