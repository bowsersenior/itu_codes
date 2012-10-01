# to-do: deal with headache codes:
# 1 --> Non-US need to be separated by area code
# 7 --> Kazakhstan!
require 'carmen'

require 'itu_codes/constants'
require 'itu_codes/helpers'

# TODO: add ability to search for common names (i.e. 'USA' or 'United States of America' for 'United States')

module ItuCodes
  class << self

    def list
      Constants::ASSIGNED_COUNTRY_CODES
    end

    def lookup(code)
      cleaned = clean(code)
      list.find_all{ |hsh| hsh.keys.first == cleaned }.map do |k|
        k.values.first
      end.uniq
    end

    def find (code_or_name)
      if code_or_name.to_s.match /[^0-9]/  # non-numeric string passed
        find_by_name(code_or_name)
      else
        cleaned = self.clean(code_or_name)
        find_by_itu_code(cleaned)
      end
    end

    def find_by_itu_code(code)
      if american?(code) and code.length > 1
        returner = 'United States'
      else
        returner = list.find_all do |record|
          record.has_key? code
        end.map { |k| k.values.first }.uniq
      end
      returner.size <= 1 ? returner.shift : returner
    end

    def find_by_name(name)
      returner = list.find_all do |record|
        record.has_value? name
      end.map{ |k| k.keys.first }.uniq
      returner.size <= 1 ? returner.shift : returner
    end

    # ie. find_by_country_iso_code('US')
    def iso2itu(iso_code)
      [find_by_name( Helpers.country_name_lookup(iso_code) )].flatten.reject do |c|
        north_american?(c) and c.length > 1
      end.shift rescue nil
    end

    # this is tricky for North American destinations: '1' can be the US, Canada or another country
    def itu2iso(itu_code)
      lookup(itu_code).map do |country|
        Helpers.country_code_lookup(country)
      end.compact
    end

    # returns true for any valid ITU code
    # valid_code?(1)    => true
    # valid_code?(1818) => false
    def valid_code?(some_code)
      if north_american?(some_code)
        some_code.length == 1
      else
        self.list.any? { |hsh| hsh.has_key?(some_code) }
      end
    end

    def north_america
      find_by_itu_code '1'
    end

    def north_american?(some_code)
      some_code.to_s[0,1] == '1'
    end

    # parse a destination code (probably with area code) to find the ITU code
    #   ex:  parse_code(1818) =>  1
    def parse_code(some_code)
      some_code = clean(some_code)
      sub_index = (1..some_code.length).find do |len|
        valid_code? some_code[0,len]
      end
      some_code[0,sub_index] unless sub_index.nil?
    end

    # parse a destination code (probably with area code) to find the number without the ITU code
    #   ex:  parse_number(18184443322) => 8184443322
    def parse_number(some_code)
      some_code = clean(some_code)
      sub_index = (1..some_code.length).find do |len|
        valid_code? some_code[0,len]
      end
      some_code[sub_index,some_code.length - sub_index] unless sub_index.nil?
    end

    def compatriots?(some, other)
      both_valid = ! ( parse_code(some).nil? or parse_code(other).nil? )
      both_valid and ( parse_code(some) == parse_code(other) ) rescue nil
    end

    # def american?(some_code)
    #   # for non-US North American codes, parse_code will return a 4 digit code
    #   # for US, '1' will be returned
    #   some_code = some_code.to_s
    #   countries = lookup(some_code[0,4])
    #   north_american?(some_code) and (countries.include?('United States') or countries.empty?)
    # end

    def american?(some_code)
      # for non-US North American codes, parse_code will return a 4 digit code
      # for US, '1' will be returned
      some_code = some_code.to_s
      countries = lookup(some_code[0,4])
      north_american?(some_code) and (countries.include?('United States'))
    end

    def canadian?(some_code)
      some_code = some_code.to_s
      countries = lookup(some_code[0,4])
      north_american?(some_code) and (countries.include?('Canada'))
    end

    # converts input to string, then strips any non-numeric characters
    def clean(input)
      input.to_s.gsub(/[^0-9]/, '')
    end

  end
end
