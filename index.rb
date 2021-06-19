# frozen_string_literal: true

require_relative 'confiq/requirements'

library = Entities::Library.new
seeds = Services::Seeds.generate
library.add_entity(seeds)
library.save

puts("\nTop Reader: #{library.top_reader[0]}
Most Popular Book: #{library.top_books[0]}
Number of Readers of the Most Popular Books: #{library.readers_of_popular_books}")

puts("\nTop 3 readers: ")
library.top_reader(3).each { |reader| puts reader }
puts("\n3 Most Popular Book: ")
library.top_books(3).each { |books| puts books }
puts("\nNumber of Readers of the 3 Most Popular Books: #{library.readers_of_popular_books(5)}")
