require 'test_helper'

class ItuCodesTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "calling code is valid" do
    american  =    "1"
    newyorker = "1212"
    russian   =    "7"
    alien     = "alksjlkknm"
   
    assert ItuCodes.valid_code?(american)
    assert ItuCodes.valid_code?(russian)
    
    assert ! ItuCodes.valid_code?(newyorker)     # 1212 is not a country code!
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
    assert_equal( nil, ItuCodes.find("12345678") )
    assert_equal( nil, ItuCodes.find("someverylongandnonterritorialstring") )
  end

end
