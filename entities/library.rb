# frozen_string_literal: true

class Library
  include Database

  attr_reader :authors, :books, :readers, :orders

  def initialize(authors: [], books: [], readers: [], orders: [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def add_entity(array)
    array.each do |entity|
      case entity
      when Author  then @authors << entity
      when Book    then @books << entity
      when Order   then @orders << entity
      when Reader  then @readers << entity
      else
        raise ArgumentError
      end
    end
  end

  def get_top_reader(quantity = 1)
    get_top(quantity, :reader)
  end

  def get_top_books(quantity = 1)
    get_top(quantity, :book)
  end

  def get_readers_of_popular_books(quantity = 3)
    @orders.select { |order| get_top_books(quantity).include? order.book }.map(&:reader).uniq.size
  end

  def get_top(quantity, entity_name)
    result = @orders
             .group_by(&entity_name)
             .max_by(quantity) { |_, orders| orders.length }
             .map(&:first)

    quantity == 1 ? result.first : result
  end

  def save
    data = {
      authors: @authors,
      books: @books,
      readers: @readers,
      orders: @orders
    }
    save_date(data)
  end

  def load_data
    data = load_library_from_seeds
    @authors = data[:authors]
    @books = data[:books]
    @readers = data[:readers]
    @orders = data[:orders]
  end
end
