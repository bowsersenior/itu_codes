# to-do: deal with headache codes:
# 1 --> Non-US need to be separated by area code
# 7 --> Kazakhstan!
require 'carmen'

require 'itu_codes/constants'
require 'itu_codes/helpers'

# TODO: add ability to search for common names (i.e. 'USA' or 'United States of America' for 'United States')

module ItuCodes
  class << self
    def find_by_itu_code(code)
      returner = lookup(code)

      if returner.size <= 1
        returner.first
      else
        returner
      end
    end

    def find_by_name(name)
      matching = country_codes.select do |k, v|
        [*v].include? name
      end || {}

      returner = matching.keys

      if returner.size <= 1
        returner.first
      else
        returner
      end
    end

    # lookup by ISO 3166 country code
    # e.g. iso2itu('US')
    # see : http://www.iso.org/iso/country_codes.htm
    def iso2itu(iso_code)
      country_name = Helpers.country_name_lookup(iso_code)
      find_by_name(country_name)
    end

    # returns true for any valid ITU code
    # valid_code?(1)    => true
    # valid_code?(1818) => false
    def valid_code?(some_code)
      country_codes[some_code]
    end

    def north_american?(some_code)
      some_code[0,1] == '1'
    end

    # parse a destination code (probably with area code) to find the ITU code
    #   ex:  parse_code(1818) =>  1
    def parse_code(some_number)
      some_number = clean(some_number)
      sub_index = (1..some_number.length).find do |len|
        valid_code? some_number[0,len]
      end
      some_number[0,sub_index] unless sub_index.nil?
    end

    # parse a destination code (probably with area code) to find the number without the ITU code
    #   ex:  parse_number(18184443322) => 8184443322
    def parse_number(some_number)
      country_code = parse_code(some_number)
      some_number.gsub(/^#{country_code}/) unless country_code.nil?
    end

    def compatriots?(some, other)
      both_valid = ! ( parse_code(some).nil? or parse_code(other).nil? )
      both_valid && ( parse_code(some) == parse_code(other) )
    end

    def american?(some_code)
      # for non-US North American codes, parse_code will return a 4 digit code
      # for US, '1' will be returned
      countries = lookup(some_code[0,4]) || []
      countries.include?('United States')
    end

    def canadian?(some_code)
      countries = lookup(some_code[0,4])
      north_american?(some_code) && (countries.include?('Canada'))
    end


    private

    def north_american_codes
      Constants::NORTH_AMERICAN_AREA_CODES
    end

    def country_codes
      Constants::ASSIGNED_COUNTRY_CODES
    end

    def lookup(code)
      cleaned = clean(code)
      matching_countries = country_codes[cleaned] || []

      matching_north_americans = north_american_codes.select do |k, v|
        [*v].include?(code)
      end || {}

      [*matching_countries] + matching_north_americans.keys.compact
    end

    # converts input to string, then strips any non-numeric characters
    def clean(input)
      input.to_s.gsub(/[^0-9]/, '')
    end

    def north_america
      find_by_itu_code '1'
    end
  end
end
