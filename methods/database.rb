# frozen_string_literal: true

module Database
  PATH_FILE = 'library.yml'.to_s
  def save_date(data)
    File.write(PATH_FILE, data.to_yaml, mode: 'a')
  end

  def delete_data
    File.delete(PATH_FILE) if File.exist? PATH_FILE
  end

  private

  def load_library_from_seeds
    yaml_file = File.read(PATH_FILE) if File.exist? PATH_FILE
    Psych.safe_load(
      yaml_file,
      [Symbol, Date, Author, Book, Reader, Order],
      [],
      true
    )
  end
end
