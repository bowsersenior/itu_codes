require 'test_helper'

class ItuCodesTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "calling code is valid" do
    american  =    "1"
    newyorker = "1212"
    canadian  = "1250"
    samoan    = "1684"
    russian   =    "7"
    alien     = "alksjlkknm"
   
    assert ItuCodes.valid_code?(american)
    assert ItuCodes.valid_code?(russian)
    
    assert ! ItuCodes.valid_code?(newyorker)     # 1212 is not a country code!
    assert ! ItuCodes.valid_code?(canadian)
    assert ! ItuCodes.valid_code?(samoan)    
    assert ! ItuCodes.valid_code?(alien)
  end
  
  test "parse full number into correct calling codes" do
    american  =    "1"
    newyorker = "1212"
    russian   =    "7"
    alien     = "alksjlkknm"
    
    assert_equal american, ItuCodes.parse_code(american)
    assert_equal american, ItuCodes.parse_code(newyorker)
   
    assert_not_equal russian, ItuCodes.parse_code(newyorker)
    assert_not_equal russian, ItuCodes.parse_code(alien)    
    
    assert_not_equal alien, ItuCodes.parse_code(alien)
    
    assert_nil ItuCodes.parse_code(alien)
  end
   
   
  test "compatriot phone numbers should be detected" do
    american  =    "1"
    newyorker = "1212"
    angeleno  = "1818"
    russian   =    "7"
    alien     = "alksjlkknm"
    
    assert ItuCodes.compatriots?(newyorker, angeleno)
    assert ItuCodes.compatriots?(newyorker, american)
    
    assert ! ItuCodes.compatriots?(newyorker, russian)
    assert ! ItuCodes.compatriots?(american, russian)
    
    assert ! ItuCodes.compatriots?(american, alien)
    assert ! ItuCodes.compatriots?(alien, alien)
  end
  
  test "find should return correct result" do
    assert_equal( "995", ItuCodes.find("Georgia") )
    assert_equal( "Georgia", ItuCodes.find(995) )
    assert_equal( "Georgia", ItuCodes.find("995") )
    assert_equal( 'United States', ItuCodes.find("12345678") )
    assert_equal( nil, ItuCodes.find("someverylongandnonterritorialstring") )
  end
  
  test "should deal gracefully with North America" do
    assert_equal( "American Samoa", ItuCodes.find(1684) )
    assert_equal( "Canada"        , ItuCodes.find(1250) )
    assert_equal( "United States" , ItuCodes.find(1818) )

    assert ItuCodes.find('1').include?("United States")
    assert ItuCodes.find('1').include?("Canada")    
    assert ItuCodes.find('1').include?("American Samoa")
  end
  
  test "should detect american numbers" do
    american  =    "1"
    newyorker = "1212"
    n2        = "121232"
    canadian  = "1250"
    samoan    = "1684"
    russian   = "7"
    
    assert( ItuCodes.american?(american)    )    
    assert( ItuCodes.american?(newyorker)   )
    assert( ItuCodes.american?(n2)          )    
    assert( ! ItuCodes.american?(canadian)  )    
    assert( ! ItuCodes.american?(samoan)    )        
    assert( ! ItuCodes.american?(russian)   )
  end

  test "should convert from ISO 2-letter code to ITU code" do
    assert_equal( '1', ItuCodes.iso2itu('US') )
  end

  test "should convert from ITU code to ISO 2-letter code" do
    assert( ItuCodes.itu2iso('1').include?('US') )    
  end
end
