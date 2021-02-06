# frozen_string_literal: true

require_relative '../services/validate'
module Entities
  class Reader
    include Services::Validate

    def initialize(name:, email:, city:, street:, house:)
      validate(name, email, city, street, house)

      @name = name
      @email = email
      @city = city
      @street = street
      @house = house
    end

    private

    def to_s
      "#{@name}, #{@email}, #{@city}, #{@street}, #{@house}"
    end

    attr_reader :name, :email, :city, :street, :house

    def validate(name, email, city, street, house)
      check_empty_space(name, email, city, street, house)
      instance?(String, name, email, city, street)
      positive?(house)
    end
  end
end
