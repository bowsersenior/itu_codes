require 'yaml'

module ItuCodes
  module Helpers
    ISO2ITU = YAML.load_file(  File.expand_path(File.dirname(__FILE__)) + '/../data/iso_code_to_itu_country_names.yml')

    # country name is the one used by ITU, not ISO
    def self.country_code_lookup(country_name)
      codes = ISO2ITU.select{|k,v| v === country_name}.keys

      if codes.empty?
        nil
      elsif codes.size === 1
        codes.first
      else
        codes
      end
    end

    def self.country_name_lookup(iso_code)
      ISO2ITU[iso_code]
    end
  end
end