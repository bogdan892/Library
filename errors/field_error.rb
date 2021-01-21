# frozen_string_literal: true

class FieldError < StandardError
  MESSAGE_FIELD_ERROR = 'It cannot be empty'

  def initialize
    super(MESSAGE_FIELD_ERROR)
  end
end
