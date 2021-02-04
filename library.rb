# frozen_string_literal: true

require_relative 'confiq/requirements'

library = Library.new
seeds = Seeds.generate
library.add_entity(seeds)
library.save

puts("\nTop Reader: #{library.top_reader}
Most Popular Book: #{library.top_books}
Number of Readers of the Most Popular Books: #{library.readers_of_popular_books}")
