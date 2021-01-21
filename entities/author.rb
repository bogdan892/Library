# frozen_string_literal: true

class Author
  include Validate

  def initialize(name:, biography: '')
    validate(name, biography)

    @name = name
    @biography = biography
  end

  private

  def to_s
    "#{@name}. #{@biography}"
  end

  attr_reader :name, :biography

  def validate(*params)
    check_empty_space(*params)
    instance?(String, *params)
  end
end
