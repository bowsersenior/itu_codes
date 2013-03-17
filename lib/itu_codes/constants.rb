require 'yaml'

module ItuCodes
  module Constants
    ASSIGNED_COUNTRY_CODES    = YAML.load_file(File.expand_path(File.dirname(__FILE__)) + '/../data/assigned_country_codes.yml')
    NORTH_AMERICAN_AREA_CODES = YAML.load_file(File.expand_path(File.dirname(__FILE__)) + '/../data/north_american_area_codes.yml')
  end
end
