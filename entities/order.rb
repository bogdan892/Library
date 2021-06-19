# frozen_string_literal: true

module Entities
  class Order
    include Services::Validate

    attr_reader :book, :reader, :date

    def initialize(book:, reader:, date: Date.today)
      validate(date, book, reader)

      @book = book
      @reader = reader
      @date = date
    end

    private

    def to_s
      "#{@book}, #{@reader}, #{@date}"
    end

    def validate(date, book, reader)
      check_empty_space(date, book, reader)
      instance?(Date, date)
      instance?(Reader, reader)
      instance?(Book, book)
    end
  end
end
