# frozen_string_literal: true

require 'yaml'

module Services
  module Database
    PATH_FILE = '../library_storage.yml'
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
end
