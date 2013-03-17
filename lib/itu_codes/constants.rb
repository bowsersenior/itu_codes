require 'yaml'

module ItuCodes
  module Constants
    ASSIGNED_COUNTRY_CODES    = YAML.load_file('lib/data/assigned_country_codes.yml')
    NORTH_AMERICAN_AREA_CODES = YAML.load_file('lib/data/north_american_area_codes.yml')
  end
end
