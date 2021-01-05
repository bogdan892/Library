# frozen_string_literal: true

module Database
  PATH_FILE = 'library.yml'.to_s
  def save_data
    data = {
      authors: @authors,
      books: @books,
      readers: @readers,
      orders: @orders
    }

    File.write(PATH_FILE, data.to_yaml, mode: 'a')
  end

  def load_data
    data = File.exist?(PATH_FILE) ? load_library_from_seeds : generate_data
    add_entity_to_library(data)
  end

  def delete_data
    File.delete(PATH_FILE) if File.exist? PATH_FILE
  end

  private

  def load_library_from_seeds
    yaml_file = File.read(PATH_FILE)
    Psych.safe_load(
      yaml_file,
      [Symbol, Date, Author, Book, Reader, Order],
      [],
      true
    )
  end

  def generate_data
    GenerateFakeData.fake_data
  end

  def add_entity_to_library(data)
    @authors  = data[:authors]
    @books    = data[:books]
    @readers  = data[:readers]
    @orders   = data[:orders]
  end
end
