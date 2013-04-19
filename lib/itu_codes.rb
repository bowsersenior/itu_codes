require 'itu_codes/constants'
require 'itu_codes/helpers'

module ItuCodes
  class << self

    # number is a full or partial number
    def country_for(number)
      parsed = parse_code(number)

      return if parsed.nil?
      
      matching_countries = if north_american?(parsed)
        north_american_codes.select do |k, v|
          v.any? do |na_area_code|
            na_area_code =~ /^#{number[0,4]}/
          end
        end.keys
      elsif eurasian?(parsed)
        temp = []
        temp << "Kazakhstan (Republic of)" if kazakh?(number[0,2])
        temp << "Russian Federation" if russian?(number[0,2])
        temp
      else
        country_codes[parsed]
      end

      if matching_countries.is_a?(Array) && matching_countries.length === 1
        matching_countries.first
      else
        matching_countries
      end
    end

    # Must pass a valid ITU code
    def find_by_itu_code(code)
      if valid_code?(code)
        returner = country_for(code)

        if returner.size <= 1
          returner.first
        else
          returner
        end
      end
    end

    # Passed name must match exact name specified in ITU spec
    # see: lib/data/assigned_country_codes.yml
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

    # lookup by ISO 3166 alpha-2 country code
    # e.g. find_by_iso_code('US')
    # see : http://www.iso.org/iso/country_codes.htm
    def iso2itu(iso_code)
      country_name = Helpers.country_name_lookup(iso_code)
      find_by_name(country_name)
    end

    # number is a full or partial number
    def itu2iso(number)
      name = country_for(number)

      if name.is_a?(String)
        Helpers.country_code_lookup(name)
      elsif name.is_a?(Array)
        name.map do |s|
          Helpers.country_code_lookup(s)
        end
      end
    end

    # returns true for any valid ITU code
    # valid_code?(1)    => true
    # valid_code?(1818) => false
    def valid_code?(some_code)
      country_codes.has_key?(some_code)
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

    # parse a north american full number and return the area code
    # returns nil if the number is not north american
    # return 1, if can't find an area code in Constants::NORTH_AMERICAN_AREA_CODES
    #  ex:   north_american_area_code_for("1-264-9568543") => 1264
    def north_american_area_code_for(some_number)
      some_number = clean(some_number)

      itu_code  = parse_code(some_number)

      return nil if itu_code.nil? || !north_american?(itu_code)

      code = itu_code

      north_american_codes.each { |_, v| code = some_number[0,4] if v.include?(some_number[0,4]) }

      return code
    end

    # parse a destination code (probably with area code) to find the number without the ITU code
    #   ex:  parse_number(18184443322) => 8184443322
    def parse_number(some_number)
      some_number = clean(some_number)
      country_code = parse_code(some_number)
      some_number[country_code.length,some_number.length] unless country_code.nil?
    end

    def compatriots?(some, other)
      both_valid = ! ( parse_code(some).nil? || parse_code(other).nil? )

      if north_american?(some) && north_american?(other)
        both_valid && !([*country_for(some)] & [*country_for(other)]).empty?
      elsif eurasian?(some) && eurasian?(other)
        both_valid && !([*country_for(some)] & [*country_for(other)]).empty?
      else
        some  = parse_code(some)
        other = parse_code(other)
        both_valid && some === other
      end
    end

    def north_american?(some_code)
      some_code[0,1] == '1'
    end

    def eurasian?(some_code)
      some_code[0,1] == '7'
    end

    def american?(some_code)
      [* country_for(some_code) ].include?('United States of America')
    end

    def canadian?(some_code)
      [* country_for(some_code) ].include?('Canada')
    end

    # Russian codes start with 7
    # and are not codes defined for Kazakhstan
    def russian?(some_code)
      if some_code.length < 2
        eurasian?(some_code)
      else
        eurasian?(some_code) && !kazakh?(some_code)
      end
    end

    # Kazakhstan country code will start with either 76 or 77
    # see: http://www.itu.int/oth/T020200006F/en
    #      http://www.itu.int/dms_pub/itu-t/oth/02/02/T020200006F0001PDFE.pdf
    # NOTE: apparently, some numbers are still jointly used by Kazakhstan and Russia
    #       7000-0009, 7100-7199, 7200-7299, 7800-7809, 7881-7899
    #       ItuCodes reports these as Russian codes for the time being
    def kazakh?(some_code)
      if some_code.length < 2
        eurasian?(some_code)
      else
        %(77 76).include?(some_code[0,2])
      end
    end

    private

    def north_american_codes
      Constants::NORTH_AMERICAN_AREA_CODES
    end

    def eurasian_codes
      Constants::NORTH_AMERICAN_AREA_CODES
    end

    def country_codes
      Constants::ASSIGNED_COUNTRY_CODES
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
