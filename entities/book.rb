# frozen_string_literal: true

class Book
  include Validate
  attr_reader :title, :author

  def initialize(title:, author:)
    validate title, author

    @title = title
    @author = author
  end

  def to_s
    "#{@title}: #{@author}"
  end

  private

  def validate(*params)
    check_empty_space(params)
  end
end
