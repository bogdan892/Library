# frozen_string_literal: true

class Book
  include Validate

  def initialize(title:, author:)
    validate(title, author)

    @title = title
    @author = author
  end

  def to_s
    "#{@title}: #{@author}"
  end

  private

  attr_reader :title, :author

  def validate(title, author)
    check_empty_space(title, author)
    instance?(String, title)
    instance?(Author, author)
  end
end
