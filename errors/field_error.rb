# frozen_string_literal: true

class FieldError < StandardError
  def initialize
    super('it cannot be empty')
  end
end
