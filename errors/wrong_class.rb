# frozen_string_literal: true

class WrongClass < StandardError
  def initialize
    super('Wrong class!')
  end
end
