# frozen_string_literal: true

class Order
  include Validate
  attr_reader :book, :reader, :date

  def initialize(book:, reader:, date: Date.today)
    validate date

    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "#{@book}, #{@reader}, #{@date}"
  end

  private

  def validate(date)
    instance?(Date, date)
  end
end
