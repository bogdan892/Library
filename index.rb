# frozen_string_literal: true

require_relative 'req'

library = Library.new
library.delete_data
authors = Array.new(35) do
  Author.new(
    name: Faker::Name.name, biography: Faker::Lorem.paragraph
  )
end
books = Array.new(35) do
  Book.new(
    title: Faker::Book.title,
    author: authors[rand(0 - 34)]
  )
end

readers = Array.new(35) do
  Reader.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    house: Faker::Address.building_number.to_i
  )
end

orders = Array.new(70) do
  Order.new(
    book: books[rand(0 - 34)],
    reader: readers[rand(0 - 34)],
    date: Date.today
  )
end

library.add_entity(orders)

library.load_data
library.save

puts("
            Top Reader: #{library.get_top_reader}
            Most Popular Book: #{library.get_top_books}
            Number of Readers of the Most Popular Books: #{library.get_readers_of_popular_books}")
