require 'carmen'

module ItuCodes
  module Helpers
    def self.country_code_lookup(country_name)
      Carmen::country_code(country_name)
    end

    def self.country_name_lookup(iso_code)
      Carmen::country_name(iso_code)
    end
  end
end