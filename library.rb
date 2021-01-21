# frozen_string_literal: true

require_relative 'confiq/requirements'

library = Library.new
library.load_data
library.delete_data
seeds = Seeds.generate
library.add_entity(seeds)
library.save

puts("\nTop Reader: #{library.get_top_reader}
Most Popular Book: #{library.get_top_books}
Number of Readers of the Most Popular Books: #{library.get_readers_of_popular_books}")
