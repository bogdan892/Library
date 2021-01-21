# frozen_string_literal: true

module Seeds
  def self.generate
    authors = authors_generate
    books = books_generate(authors)
    readers = readers_generate
    orders_generate(books, readers)
  end

  def self.authors_generate
    Array.new(35) do
      Author.new(
        name: Faker::Name.name, biography: Faker::Lorem.paragraph
      )
    end
  end

  def self.books_generate(authors)
    Array.new(35) do
      Book.new(
        title: Faker::Book.title,
        author: authors[rand(0 - 34)]
      )
    end
  end

  def self.readers_generate
    Array.new(35) do
      Reader.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        city: Faker::Address.city,
        street: Faker::Address.street_name,
        house: Faker::Address.building_number.to_i
      )
    end
  end

  def self.orders_generate(books, readers)
    Array.new(70) do
      Order.new(
        book: books[rand(0 - 34)],
        reader: readers[rand(0 - 34)],
        date: Date.today
      )
    end
  end
end
