require 'yaml'

module ItuCodes
  module Helpers
    ISO2ITU = YAML.load_file('lib/data/iso_code_to_itu_country_names.yml')

    def self.country_code_lookup(country_name)
      ISO2ITU.key(country_name)
    end

    def self.country_name_lookup(iso_code)
      ISO2ITU[iso_code]
    end
  end
end