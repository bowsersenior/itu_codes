require 'yaml'

module ItuCodes
  module Helpers
    ISO2ITU = YAML.load_file(  File.expand_path(File.dirname(__FILE__)) + '/../data/iso_code_to_itu_country_names.yml')

    # country name is the one used by ITU, not ISO
    def self.country_code_lookup(country_name)
      hsh   = ISO2ITU.select{|k,v| v === country_name}
      codes = ItuCodes::Helpers.keys_from_hash(hsh)

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

    # ruby 1.8 support, since Hash#select returns an array
    def self.keys_from_hash(hsh_or_array)
      if hsh_or_array.is_a?(Array)
        Hash[hsh_or_array]
      else
        hsh_or_array
      end.keys
    end
  end
end
