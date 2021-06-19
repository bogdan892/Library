# frozen_string_literal: true

module Services
  module Seeds
    module_function

    def generate
      authors = authors_generate
      books = books_generate(authors)
      readers = readers_generate
      orders_generate(books, readers)
    end

    def authors_generate
      Array.new(35) do
        Entities::Author.new(
          name: Faker::Name.name, biography: Faker::Lorem.paragraph
        )
      end
    end

    def books_generate(authors)
      Array.new(35) do
        Entities::Book.new(
          title: Faker::Book.title,
          author: authors[rand(0 - 34)]
        )
      end
    end

    def readers_generate
      Array.new(35) do
        Entities::Reader.new(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          city: Faker::Address.city,
          street: Faker::Address.street_name,
          house: Faker::Address.building_number.to_i
        )
      end
    end

    def orders_generate(books, readers)
      Array.new(70) do
        Entities::Order.new(
          book: books[rand(0 - 34)],
          reader: readers[rand(0 - 34)],
          date: Date.today
        )
      end
    end
  end
end
