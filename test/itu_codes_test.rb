#TODO: use rspec
require 'itu_codes.rb'
require 'test/unit'
 
class ItuCodesTest < Test::Unit::TestCase
  def test_valid_code?
    american  =    "1"
    newyorker = "1212"
    russian   =    "7"
    alien     = "alksjlkknm"
 
    assert ItuCodes.valid_code?(american)
    assert ItuCodes.valid_code?(russian)
    
    assert ! ItuCodes.valid_code?(newyorker)     # 1212 is not a country code!
    assert ! ItuCodes.valid_code?(alien)
  end
  
  def test_parse_code
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
 
 
  def test_compatriots?
    american  =    "1"
    newyorker = "1212"
    angeleno  = "1818"
    russian   =    "7"
    alien     = "alksjlkknm"
    
    assert ItuCodes.compatriots?(newyorker, angeleno)
    assert ItuCodes.compatriots?(newyorker, american)
    
    assert ! ItuCodes.compatriots?(newyorker, russian)
    assert ! ItuCodes.compatriots?(american, russian  )
    
    assert nil == ItuCodes.compatriots?(american, alien)
    assert nil == ItuCodes.compatriots?(alien, alien)
  end
  
  def test_find
    assert_equal( [{"995" => "Georgia"}], ItuCodes.find("Georgia") )
    assert_equal( [{"995" => "Georgia"}], ItuCodes.find(995) )
    assert_equal( [{"995" => "Georgia"}], ItuCodes.find("995") )
    assert_equal( [], ItuCodes.find("12345678") )
    assert_equal( [], ItuCodes.find("someverylongandnonterritorialstring") )
  end
  
end