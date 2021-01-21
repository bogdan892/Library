# frozen_string_literal: true

module Validate
  def check_empty_space(*params)
    raise FieldError if params.empty?
  end

  def instance?(main_class, *args)
    valid_objects = args.map { |object| object.is_a?(main_class) }.all?
    raise WrongClass unless valid_objects
  end

  def positive?(num)
    raise WrongNumber unless num.to_i.positive?
  end
end
