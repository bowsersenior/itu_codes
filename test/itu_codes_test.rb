require 'test_helper'

lambda do
  # test calling code is valid
  american  =    "1"
  newyorker = "1212"
  canadian  = "1250"
  samoan    = "1684"
  russian   =    "7"
  alien     = "alksjlkknm"

  assert ItuCodes.valid_code?(american), :== => true
  assert ItuCodes.valid_code?(russian), :== => true

  assert ItuCodes.valid_code?(newyorker), :== => false     # 1212 is not a country code!
  assert ItuCodes.valid_code?(canadian), :== => false
  assert ItuCodes.valid_code?(samoan), :== => false
  assert ItuCodes.valid_code?(alien), :== => false
end.call

lambda do
  # test parse full number into correct calling codes
  american  =    "1"
  newyorker = "1212"
  russian   =    "7"
  italian   =   "39"
  alien     = "alksjlkknm"

  assert american, :== => ItuCodes.parse_code(american)
  assert american, :== => ItuCodes.parse_code(newyorker)

  assert russian != ItuCodes.parse_code(newyorker)
  assert russian != ItuCodes.parse_code(alien)

  assert italian,
    :== => ItuCodes.parse_code(italian)

  assert alien != ItuCodes.parse_code(alien)

  assert nil, :== => ItuCodes.parse_code(alien)
end.call

lambda do
  #test parse full number with invalid characters
  american  =    "1"
  only_characters = american+"abdcedfgh"
  characters_and_numbers = american+"abdefg301h33i11j871"
  symbol_characters = american+'%$#.#@*-_,'
  symbol_characters_and_numbers = american+'-*&.$301-331-1871'

  assert ItuCodes.parse_number(only_characters), :== => ""
  assert ItuCodes.parse_number(symbol_characters), :== => ""
  assert ItuCodes.parse_number(characters_and_numbers), :== => "3013311871"
  assert ItuCodes.parse_number(symbol_characters_and_numbers), :== => "3013311871"
end.call

lambda do
  #test north_american_area_code_for
  usa_code_1    =  "1201"
  usa_code_2    =  "1240-30476563"
  canada_code_1 =  "1204"
  canada_code_2 =  "1450-89909876"
  anguilla_1    =  "1264"
  anguilla_2    =  "1-264-9568543"
  french        = "3344556688"

  assert ItuCodes.north_american_area_code_for(usa_code_1),    :== => "1201"
  assert ItuCodes.north_american_area_code_for(usa_code_2),    :== => "1240"
  assert ItuCodes.north_american_area_code_for(canada_code_1), :== => "1204"
  assert ItuCodes.north_american_area_code_for(canada_code_2), :== => "1450"
  assert ItuCodes.north_american_area_code_for(anguilla_1),    :== => "1264"
  assert ItuCodes.north_american_area_code_for(anguilla_2),    :== => "1264"
  assert ItuCodes.north_american_area_code_for(french),        :== => nil
end.call

lambda do
  # test compatriot phone numbers should be detected
  american  =    "1"
  newyorker = "1212"
  anguilan  = "1264"
  angeleno  = "1818"
  russian   =    "7"
  alien     = "alksjlkknm"

  assert ItuCodes.compatriots?(newyorker, angeleno), :== => true
  assert ItuCodes.compatriots?(newyorker, american), :== => true

  assert ItuCodes.compatriots?(newyorker, russian), :== => false
  assert ItuCodes.compatriots?(american, russian), :== => false
  assert ItuCodes.compatriots?(newyorker, anguilan), :== => false

  assert ItuCodes.compatriots?(american, alien), :== => false
  assert ItuCodes.compatriots?(alien, alien), :== => false

  assert ItuCodes.compatriots?('822', '811'), :== => false
  assert ItuCodes.compatriots?('1984', '1985'), :== => true

  assert ItuCodes.compatriots?('7', '75'), :== => true
  assert ItuCodes.compatriots?('7', '76'), :== => true
  assert ItuCodes.compatriots?('76', '77'), :== => true
  assert ItuCodes.compatriots?('75', '77'), :== => false
end.call

lambda do
  # country_for should return the country name(s) or nil
  assert ItuCodes.country_for('33'), :== => "France"
  assert ItuCodes.country_for('88'), :== => nil
  assert ItuCodes.country_for('1'), :is_a? => Array
end.call

lambda do
  # test should deal gracefully with North America
  assert ItuCodes.country_for('1684'), :== => "American Samoa"
  assert ItuCodes.country_for('1250'), :== => "Canada"
  assert ItuCodes.country_for('1818'), :== => "United States of America"

  assert ItuCodes.country_for('1'), :include? => "United States of America"
  assert ItuCodes.country_for('1'), :include? => "Canada"
  assert ItuCodes.country_for('1'), :include? => "American Samoa"
end.call

lambda do
  # test should deal gracefully with Russia and Kazakhstan
  assert ItuCodes.country_for('7'), :== => ["Kazakhstan (Republic of)", "Russian Federation"]

  assert ItuCodes.country_for('75'), :== => "Russian Federation"

  assert ItuCodes.country_for('76'), :== => "Kazakhstan (Republic of)"
  assert ItuCodes.country_for('77'), :== => "Kazakhstan (Republic of)"
end.call



lambda do
  # test should detect american numbers
  american  = "1"
  newyorker = "1212"
  n2        = "121232"
  canadian  = "1250"
  samoan    = "1684"
  russian   = "7"

  assert ItuCodes,
    :american? => american,
    :american? => newyorker,
    :american? => n2

  assert ItuCodes.american?(canadian), :== => false
  assert ItuCodes.american?(samoan), :== => false
  assert ItuCodes.american?(russian), :== => false
end.call

lambda do
  # test should convert from ISO 3166 code to ITU code
  assert ItuCodes.iso2itu('US'), :== => '1'
  assert ItuCodes.iso2itu('CA'), :== => '1'
  assert ItuCodes.iso2itu('not_an_iso_code'), :== => nil
  assert ItuCodes.iso2itu('MX'), :== => '52'
end.call

lambda do
  # convert from ITU code to ISO 3166-1 alpha-2 code
  north_american_iso_codes = %w(
    AS AI AG BS BB BM VG CA KY DM DO GD GU JM MS MP PR KN LC VC SX TT TC US VI
  ).sort

  assert ItuCodes.itu2iso('1').sort, :== => north_american_iso_codes
  assert ItuCodes.itu2iso('1818'), :== => 'US'
  assert ItuCodes.itu2iso('280'), :== => nil
  assert ItuCodes.itu2iso('52'), :== => 'MX'

  assert ItuCodes.itu2iso('75'), :== => 'RU'
  assert ItuCodes.itu2iso('76'), :== => 'KZ'
  assert ItuCodes.itu2iso('77'), :== => 'KZ'

  assert ItuCodes.itu2iso('7'), :== => ['KZ', 'RU']

  assert ItuCodes.itu2iso('88'), :== => nil
end.call

lambda do
  # data should be up to date
  assert ItuCodes.find_by_itu_code('382'), :== => 'Montenegro (Republic of)'
  assert ItuCodes.iso2itu('ME'), :== => '382'

  assert ItuCodes.find_by_itu_code('246'), :== => "Diego Garcia"
  assert ItuCodes.iso2itu('DG'), :== => "246"

  assert ItuCodes.find_by_itu_code('672'), :== => "Australian External Territories"
  assert ItuCodes.iso2itu('NF'), :== => "672"
  assert ItuCodes.itu2iso('672').sort, :== => ["CC", "CX", "HM", "NF"]

  assert ItuCodes.find_by_name("Australian External Territories"),
         :== => "672"
end.call
