# frozen_string_literal: true

require_relative '../errors/field_error'
require_relative '../errors/wrong_number_error'
require_relative '../errors/wrong_class'

module Errors
  WrongClass.new
  WrongNumber.new
  FieldError.new
end
