require 'yaml'

module ItuCodes
  module Constants
    base_path = File.expand_path(File.dirname(__FILE__))
    ASSIGNED_COUNTRY_CODES    = YAML.load_file base_path + '/../data/assigned_country_codes.yml'
    NORTH_AMERICAN_AREA_CODES = YAML.load_file base_path + '/../data/north_american_area_codes.yml'
  end
end
