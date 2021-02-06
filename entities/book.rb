# frozen_string_literal: true

require_relative '../services/validate'
module Entities
  class Book
    include Services::Validate

    def initialize(title:, author:)
      validate(title, author)

      @title = title
      @author = author
    end

    private

    def to_s
      "#{@title}: #{@author}"
    end

    attr_reader :title, :author

    def validate(title, author)
      check_empty_space(title, author)
      instance?(String, title)
      instance?(Author, author)
    end
  end
end
