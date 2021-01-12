# frozen_string_literal: true

class Author
  include Validate
  attr_reader :name, :biography

  def initialize(name:, biography: '')
    validate name, biography

    @name = name
    @biography = biography
  end

  def to_s
    "#{@name}. #{@biography}"
  end

  private

  def validate(*params)
    check_empty_space(*params)
    instance?(String, *params)
  end
end
