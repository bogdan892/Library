# frozen_string_literal: true

require_relative '../errors/errors'

# module validating
module Validate
  include Errors

  def check_empty_space(*params)
    raise FieldError if params.empty?
  end

  def instance?(main_class, *args)
    args.each do |object|
      raise WrongClass unless
          object.instance_of?(main_class)
    end
  end

  def positive?(num)
    raise WrongNumber unless num.positive?
  end
end
