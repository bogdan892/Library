# frozen_string_literal: true

require_relative 'req'

library = Library.new
library.delete_data

library.add_entity(Author.new(
                     name: Faker::Name.name,
                     biography: Faker::Lorem.paragraph
                   ))
library.add_entity(Book.new(
                     title: Faker::Book.title,
                     author: Author.new(
                       name: Faker::Name.name,
                       biography: Faker::Lorem.paragraph
                     )
                   ))
library.add_entity(Reader.new(
                     name: Faker::Name.name,
                     email: Faker::Internet.email,
                     city: Faker::Address.city,
                     street: Faker::Address.street_name,
                     house: Faker::Address.building_number.to_i
                   ))
library.add_entity(Order.new(
                     book: Book.new(
                       title: Faker::Book.title,
                       author: Author.new(
                         name: Faker::Name.name,
                         biography: Faker::Lorem.paragraph
                       )
                     ),
                     reader: Reader.new(
                       name: Faker::Name.name,
                       email: Faker::Internet.email,
                       city: Faker::Address.city,
                       street: Faker::Address.street_name,
                       house: Faker::Address.building_number.to_i
                     ),
                     date: Date.today
                   ))
library.load_data
library.save_data

puts("
            Top Reader: #{library.get_top_reader}
            Most Popular Book: #{library.get_top_books}
            Number of Readers of the Most Popular Books: #{library.get_readers_of_popular_books}")
