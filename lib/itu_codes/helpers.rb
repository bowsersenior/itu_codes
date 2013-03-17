require 'yaml'

module ItuCodes
  module Helpers
    ISO2ITU = YAML.load_file(  File.expand_path(File.dirname(__FILE__)) + '/../data/iso_code_to_itu_country_names.yml')

    # country name is the one used by ITU, not ISO
    def self.country_code_lookup(country_name)
      ISO2ITU.key(country_name)
    end

    def self.country_name_lookup(iso_code)
      ISO2ITU[iso_code]
    end
  end
end