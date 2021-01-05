# frozen_string_literal: true

module Statistics
  def get_top_reader(quantity: 1)
    get_top(quantity, :reader)
  end

  def get_top_books(quantity: 1)
    get_top(quantity, :book)
  end

  def get_readers_of_popular_books(quantity: 3)
    books = get_top(quantity, :book)

    @orders
      .select { |order| books.include? order.book }
      .uniq(&:reader)
      .length
  end

  def get_top(quantity, entity_name)
    result = @orders
             .group_by(&entity_name)
             .max_by(quantity) { |_, orders| orders.length }
             .map(&:first)

    quantity == 1 ? result.first : result
  end
end
