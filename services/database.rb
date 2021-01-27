# frozen_string_literal: true

module Database
  PATH_FILE = './storage/library.yml'.to_s
  def save_date(data)
    File.write(PATH_FILE, data.to_yaml, mode: 'a')
  end

  def delete_data
    File.delete(PATH_FILE) if File.exist? PATH_FILE
  end

  private

  def load_library_from_seeds
    File.file?(PATH_FILE) ? YAML.load_file(PATH_FILE) : {}
  end
end
