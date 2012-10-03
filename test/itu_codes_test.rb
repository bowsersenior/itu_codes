require 'test_helper'

class ItuCodesTest < TEST_CASE_CLASS
  def test_calling_code_is_valid
    american  =    "1"
    newyorker = "1212"
    canadian  = "1250"
    samoan    = "1684"
    russian   =    "7"
    alien     = "alksjlkknm"

    assert ItuCodes.valid_code?(american)
    assert ItuCodes.valid_code?(russian)

    refute ItuCodes.valid_code?(newyorker)     # 1212 is not a country code!
    refute ItuCodes.valid_code?(canadian)
    refute ItuCodes.valid_code?(samoan)
    refute ItuCodes.valid_code?(alien)
  end

  def test_parse_full_number_into_correct_calling_codes
    american  =    "1"
    newyorker = "1212"
    russian   =    "7"
    alien     = "alksjlkknm"

    assert_equal american, ItuCodes.parse_code(american)
    assert_equal american, ItuCodes.parse_code(newyorker)

    refute_equal russian, ItuCodes.parse_code(newyorker)
    refute_equal russian, ItuCodes.parse_code(alien)

    refute_equal alien, ItuCodes.parse_code(alien)

    assert_nil ItuCodes.parse_code(alien)
  end


  def test_compatriot_phone_numbers_should_be_detected
    american  =    "1"
    newyorker = "1212"
    angeleno  = "1818"
    russian   =    "7"
    alien     = "alksjlkknm"

    assert ItuCodes.compatriots?(newyorker, angeleno)
    assert ItuCodes.compatriots?(newyorker, american)

    refute ItuCodes.compatriots?(newyorker, russian)
    refute ItuCodes.compatriots?(american, russian)

    refute ItuCodes.compatriots?(american, alien)
    refute ItuCodes.compatriots?(alien, alien)
  end

  def test_should_deal_gracefully_with_North_America
    assert_equal( "American Samoa", ItuCodes.find_by_itu_code('1684') )
    assert_equal( "Canada"        , ItuCodes.find_by_itu_code('1250') )
    assert_equal( "United States" , ItuCodes.find_by_itu_code('1818') )

    assert ItuCodes.find_by_itu_code('1').include?("United States")
    assert ItuCodes.find_by_itu_code('1').include?("Canada")
    assert ItuCodes.find_by_itu_code('1').include?("American Samoa")
  end

  def test_should_detect_american_numbers
    american  = "1"
    newyorker = "1212"
    n2        = "121232"
    canadian  = "1250"
    samoan    = "1684"
    russian   = "7"

    assert ItuCodes.american?(american)
    assert ItuCodes.american?(newyorker)
    assert ItuCodes.american?(n2)
    refute ItuCodes.american?(canadian)
    refute ItuCodes.american?(samoan)
    refute ItuCodes.american?(russian)
  end

  def test_should_convert_from_ISO_3166_code_to_ITU_code
    assert_equal( '1',  ItuCodes.iso2itu('US') )
    assert_equal( '1',  ItuCodes.iso2itu('CA') )
    assert_nil( ItuCodes.iso2itu('not_an_iso_code') )
    assert_equal( '52', ItuCodes.iso2itu('MX') )
  end
end
