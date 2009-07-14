# to-do: deal with headache codes:
# 1 --> Non-US need to be separated by area code
# 7 --> Kazakhstan!
require 'enumerator'

# TODO: add ability to search for common names (i.e. 'USA' or 'United States of America' for 'United States')
class OneItuCode < Object
  attr_reader :code, :name, :subcodes, :all_codes
  
  # subcodes should be an array of hashes like so:
  # subcodes = [ { :code => '1684', :name => 'American Samoa'} , { :code => '1264' , :name => "Anguilla"}]
  def initialize(code, name, subcodes=[])
    @code = code
    @name = name
    @subcodes = subcodes
  end
  
  def all_names
    [@name] + @subcodes.map{ |s| s[:name] }
  end
  
  def all_codes
    [@code] + @subcodes.map{ |s| s[:code] }    
  end
  
  def has_name?(name)
    self.all_names.include? name
  end
  
  def has_code?(code)
    self.all_codes.include? code
  end
end


module ItuCodes
  include Carmen

  # TODO: move the base data into a fixture file to speed up loading
	CODE_LIST = [
	  OneItuCode.new("0" , "Reserved"),
	  OneItuCode.new("1", "US, Canada & other North American regions", [ 
      { :code => "1"    , :name  => "United States"	},
  	  { :code => "1684" , :name =>  "American Samoa"},
  		{ :code => "1264" , :name =>  "Anguilla"      },
  		{ :code => "1268" , :name =>  "Antigua and Barbuda"},
  		{ :code => "1242" , :name =>  "Bahamas"},
  		{ :code => "1246" , :name =>  "Barbados"},
  		{ :code => "1441" , :name =>  "Bermuda"},
  		{ :code => "1284" , :name =>  "British Virgin Islands"},
      { :code => "1204" , :name =>  "Canada" }, # from http://www.cnac.ca/co_codes/co_code_status_map.htm
      { :code => "1226" , :name =>  "Canada"},
      { :code => "1250" , :name =>  "Canada"},
      { :code => "1289" , :name =>  "Canada"},
      { :code => "1306" , :name =>  "Canada"},
      { :code => "1343" , :name =>  "Canada"},
      { :code => "1403" , :name =>  "Canada"},
      { :code => "1416" , :name =>  "Canada"},
      { :code => "1418" , :name =>  "Canada"},
      { :code => "1438" , :name =>  "Canada"},
      { :code => "1450" , :name =>  "Canada"},
      { :code => "1506" , :name =>  "Canada"},
      { :code => "1514" , :name =>  "Canada"},
      { :code => "1519" , :name =>  "Canada"},
      { :code => "1581" , :name =>  "Canada"},
      { :code => "1587" , :name =>  "Canada"},
      { :code => "1604" , :name =>  "Canada"},
      { :code => "1613" , :name =>  "Canada"},
      { :code => "1647" , :name =>  "Canada"},
      { :code => "1705" , :name =>  "Canada"},
      { :code => "1709" , :name =>  "Canada"},
      { :code => "1778" , :name =>  "Canada"},
      { :code => "1780" , :name =>  "Canada"},
      { :code => "1807" , :name =>  "Canada"},
      { :code => "1819" , :name =>  "Canada"},
      { :code => "1867" , :name =>  "Canada"},
      { :code => "1902" , :name =>  "Canada"},
      { :code => "1905" , :name =>  "Canada"},
  		{ :code => "1345" , :name =>  "Cayman Islands"},
  		{ :code => "1767" , :name =>  "Dominica"},
  		{ :code => "1809" , :name =>  "Dominican Republic"},
  		{ :code => "1829" , :name =>  "Dominican Republic"},
  		{ :code => "1473" , :name =>  "Grenada"},
  		{ :code => "1671" , :name =>  "Guam"},
  		{ :code => "1876" , :name =>  "Jamaica"},
  		{ :code => "1664" , :name =>  "Montserrat"},
  		{ :code => "1670" , :name =>  "Northern Mariana Islands"},
  		{ :code => "1869" , :name =>  "Saint Kitts and Nevis"},
  		{ :code => "1758" , :name =>  "Saint Lucia"},
  		{ :code => "1784" , :name =>  "Saint Vincent and the Grenadines"},
  		{ :code => "1868" , :name =>  "Trinidad and Tobago"},
  		{ :code => "1649" , :name =>  "Turks and Caicos Islands"},
  		{ :code => "1340" , :name =>  "United States Virgin Islands"}
    ]),
		OneItuCode.new("20" , "Egypt"),
		OneItuCode.new("210" , "Spare code"),
		OneItuCode.new("211" , "Spare code"),
		OneItuCode.new("212" , "Morocco"),
		OneItuCode.new("213" , "Algeria"),
		OneItuCode.new("214" , "Spare code"),
		OneItuCode.new("215" , "Spare code"),
		OneItuCode.new("216" , "Tunisia"),
		OneItuCode.new("217" , "Spare code"),
		OneItuCode.new("218" , "Libyan Arab Jamahiriya"),
		OneItuCode.new("219" , "Spare code"),
		OneItuCode.new("220" , "Gambia"),
		OneItuCode.new("221" , "Senegal"),
		OneItuCode.new("222" , "Mauritania"),
		OneItuCode.new("223" , "Mali"),
		OneItuCode.new("224" , "Guinea"),
		OneItuCode.new("225" , "Cote D'ivoire"),
		OneItuCode.new("226" , "Burkina Faso"),
		OneItuCode.new("227" , "Niger"),
		OneItuCode.new("228" , "Togo"),
		OneItuCode.new("229" , "Benin"),
		OneItuCode.new("230" , "Mauritius"),
		OneItuCode.new("231" , "Liberia"),
		OneItuCode.new("232" , "Sierra Leone"),
		OneItuCode.new("233" , "Ghana"),
		OneItuCode.new("234" , "Nigeria"),
		OneItuCode.new("235" , "Chad"),
		OneItuCode.new("236" , "Central African Republic"),
		OneItuCode.new("237" , "Cameroon"),
		OneItuCode.new("238" , "Cape Verde"),
		OneItuCode.new("239" , "Sao Tome and Principe"),
		OneItuCode.new("240" , "Equatorial Guinea"),
		OneItuCode.new("241" , "Gabon"),
		OneItuCode.new("242" , "Congo"),
		OneItuCode.new("243" , "Congo, the Democratic Republic of the"),
		OneItuCode.new("244" , "Angola"),
		OneItuCode.new("245" , "Guinea-Bissau"),
		OneItuCode.new("246" , "Diego Garcia"),
		OneItuCode.new("247" , "Ascension"),
		OneItuCode.new("248" , "Seychelles"),
		OneItuCode.new("249" , "Sudan"),
		OneItuCode.new("250" , "Rwanda"),
		OneItuCode.new("251" , "Ethiopia"),
		OneItuCode.new("252" , "Somalia"),
		OneItuCode.new("253" , "Djibouti"),
		OneItuCode.new("254" , "Kenya"),
		OneItuCode.new("255" , "Tanzania, United Republic of"),
		OneItuCode.new("256" , "Uganda"),
		OneItuCode.new("257" , "Burundi"),
		OneItuCode.new("258" , "Mozambique"),
		OneItuCode.new("259" , "Spare code"),
		OneItuCode.new("260" , "Zambia"),
		OneItuCode.new("261" , "Madagascar"),
		OneItuCode.new("262" , "Reunion"),
		OneItuCode.new("263" , "Zimbabwe"),
		OneItuCode.new("264" , "Namibia"),
		OneItuCode.new("265" , "Malawi"),
		OneItuCode.new("266" , "Lesotho"),
		OneItuCode.new("267" , "Botswana"),
		OneItuCode.new("268" , "Swaziland"),
		OneItuCode.new("269" , "Comoros"),
		OneItuCode.new("269" , "Mayotte"),
		OneItuCode.new("27" , "South Africa"),
		OneItuCode.new("280" , "Spare code"),
		OneItuCode.new("281" , "Spare code"),
		OneItuCode.new("282" , "Spare code"),
		OneItuCode.new("283" , "Spare code"),
		OneItuCode.new("284" , "Spare code"),
		OneItuCode.new("285" , "Spare code"),
		OneItuCode.new("286" , "Spare code"),
		OneItuCode.new("287" , "Spare code"),
		OneItuCode.new("288" , "Spare code"),
		OneItuCode.new("289" , "Spare code"),
		OneItuCode.new("290" , "Saint Helena"),
		OneItuCode.new("291" , "Eritrea"),
		OneItuCode.new("292" , "Spare code"),
		OneItuCode.new("293" , "Spare code"),
		OneItuCode.new("294" , "Spare code"),
		OneItuCode.new("295" , "Spare code"),
		OneItuCode.new("296" , "Spare code"),
		OneItuCode.new("297" , "Aruba"),
		OneItuCode.new("298" , "Faroe Islands"),
		OneItuCode.new("299" , "Greenland"),
		OneItuCode.new("30" , "Greece"),
		OneItuCode.new("31" , "Netherlands"),
		OneItuCode.new("32" , "Belgium"),
		OneItuCode.new("33" , "France"),
		OneItuCode.new("34" , "Spain"),
		OneItuCode.new("350" , "Gibraltar"),
		OneItuCode.new("351" , "Portugal"),
		OneItuCode.new("352" , "Luxembourg"),
		OneItuCode.new("353" , "Ireland"),
		OneItuCode.new("354" , "Iceland"),
		OneItuCode.new("355" , "Albania"),
		OneItuCode.new("356" , "Malta"),
		OneItuCode.new("357" , "Cyprus"),
		OneItuCode.new("358" , "Finland"),
		OneItuCode.new("359" , "Bulgaria"),
		OneItuCode.new("36" , "Hungary"),
		OneItuCode.new("370" , "Lithuania"),
		OneItuCode.new("371" , "Latvia"),
		OneItuCode.new("372" , "Estonia"),
		OneItuCode.new("373" , "Moldova, Republic of"),
		OneItuCode.new("374" , "Armenia"),
		OneItuCode.new("375" , "Belarus"),
		OneItuCode.new("376" , "Andorra"),
		OneItuCode.new("377" , "Monaco"),
		OneItuCode.new("378" , "San Marino"),
		OneItuCode.new("379" , "Holy See (Vatican City State),"),
		OneItuCode.new("380" , "Ukraine"),
		OneItuCode.new("381" , "Serbia and Montenegro"),
		OneItuCode.new("382" , "Spare code"),
		OneItuCode.new("383" , "Spare code"),
		OneItuCode.new("384" , "Spare code"),
		OneItuCode.new("385" , "Croatia"),
		OneItuCode.new("386" , "Slovenia"),
		OneItuCode.new("387" , "Bosnia and Herzegovina"),
		OneItuCode.new("388" , "Group of countries, shared code"),
		OneItuCode.new("389" , "Macedonia, the Former Yugoslav Republic of"),
		OneItuCode.new("39" , "Italy"),
		OneItuCode.new("40" , "Romania"),
		OneItuCode.new("41" , "Switzerland"),
		OneItuCode.new("420" , "Czech Republic"),
		OneItuCode.new("421" , "Slovakia"),
		OneItuCode.new("422" , "Spare code"),
		OneItuCode.new("423" , "Liechtenstein"),
		OneItuCode.new("424" , "Spare code"),
		OneItuCode.new("425" , "Spare code"),
		OneItuCode.new("426" , "Spare code"),
		OneItuCode.new("427" , "Spare code"),
		OneItuCode.new("428" , "Spare code"),
		OneItuCode.new("429" , "Spare code"),
		OneItuCode.new("43" , "Austria"),
		OneItuCode.new("44" , "United Kingdom"),
		OneItuCode.new("45" , "Denmark"),
		OneItuCode.new("46" , "Sweden"),
		OneItuCode.new("47" , "Norway"),
		OneItuCode.new("48" , "Poland"),
		OneItuCode.new("49" , "Germany"),
		OneItuCode.new("500" , "Falkland Islands"),
		OneItuCode.new("501" , "Belize"),
		OneItuCode.new("502" , "Guatemala"),
		OneItuCode.new("503" , "El Salvador"),
		OneItuCode.new("504" , "Honduras"),
		OneItuCode.new("505" , "Nicaragua"),
		OneItuCode.new("506" , "Costa Rica"),
		OneItuCode.new("507" , "Panama"),
		OneItuCode.new("508" , "Saint Pierre and Miquelon"),
		OneItuCode.new("509" , "Haiti"),
		OneItuCode.new("51" , "Peru"),
		OneItuCode.new("52" , "Mexico"),
		OneItuCode.new("53" , "Cuba"),
		OneItuCode.new("54" , "Argentina"),
		OneItuCode.new("55" , "Brazil"),
		OneItuCode.new("56" , "Chile"),
		OneItuCode.new("57" , "Colombia"),
		OneItuCode.new("58" , "Venezuela"),
		OneItuCode.new("590" , "Guadeloupe"),
		OneItuCode.new("591" , "Bolivia"),
		OneItuCode.new("592" , "Guyana"),
		OneItuCode.new("593" , "Ecuador"),
		OneItuCode.new("594" , "French Guiana"),
		OneItuCode.new("595" , "Paraguay"),
		OneItuCode.new("596" , "Martinique"),
		OneItuCode.new("597" , "Suriname"),
		OneItuCode.new("598" , "Uruguay"),
		OneItuCode.new("599" , "Netherlands Antilles"),
		OneItuCode.new("60" , "Malaysia"),
		OneItuCode.new("61" , "Australia"),
		OneItuCode.new("62" , "Indonesia"),
		OneItuCode.new("63" , "Philippines"),
		OneItuCode.new("64" , "New Zealand"),
		OneItuCode.new("65" , "Singapore"),
		OneItuCode.new("66" , "Thailand"),
		OneItuCode.new("670" , "Timor-Leste"),
		OneItuCode.new("671" , "Spare code"),
		OneItuCode.new("672" , "Australian External Territories"),
		OneItuCode.new("673" , "Brunei Darussalam"),
		OneItuCode.new("674" , "Nauru"),
		OneItuCode.new("675" , "Papua New Guinea"),
		OneItuCode.new("676" , "Tonga"),
		OneItuCode.new("677" , "Solomon Islands"),
		OneItuCode.new("678" , "Vanuatu"),
		OneItuCode.new("679" , "Fiji"),
		OneItuCode.new("680" , "Palau"),
		OneItuCode.new("681" , "Wallis and Futuna"),
		OneItuCode.new("682" , "Cook Islands"),
		OneItuCode.new("683" , "Niue"),
		OneItuCode.new("684" , "Spare code"),
		OneItuCode.new("685" , "Samoa"),
		OneItuCode.new("686" , "Kiribati"),
		OneItuCode.new("687" , "New Caledonia"),
		OneItuCode.new("688" , "Tuvalu"),
		OneItuCode.new("689" , "French Polynesia"),
		OneItuCode.new("690" , "Tokelau"),
		OneItuCode.new("691" , "Micronesia, Federated States of"),
		OneItuCode.new("692" , "Marshall Islands"),
		OneItuCode.new("693" , "Spare code"),
		OneItuCode.new("694" , "Spare code"),
		OneItuCode.new("695" , "Spare code"),
		OneItuCode.new("696" , "Spare code"),
		OneItuCode.new("697" , "Spare code"),
		OneItuCode.new("698" , "Spare code"),
		OneItuCode.new("699" , "Spare code"),
		OneItuCode.new("7" , "Russia & other former Soviet Union", [ 
		  {:code => "7", :name => "Kazakhstan"},
		  {:code => "7", :name => "Russian Federation"}
	  ]),
		OneItuCode.new("800" , "International Freephone Service"),
		OneItuCode.new("801" , "Spare code"),
		OneItuCode.new("802" , "Spare code"),
		OneItuCode.new("803" , "Spare code"),
		OneItuCode.new("804" , "Spare code"),
		OneItuCode.new("805" , "Spare code"),
		OneItuCode.new("806" , "Spare code"),
		OneItuCode.new("807" , "Spare code"),
		OneItuCode.new("808" , "International Shared Cost Service"),
		OneItuCode.new("809" , "Spare code"),
		OneItuCode.new("81" , "Japan"),
		OneItuCode.new("82" , "Korea, Republic of"),
		OneItuCode.new("830" , "Spare code"),
		OneItuCode.new("831" , "Spare code"),
		OneItuCode.new("832" , "Spare code"),
		OneItuCode.new("833" , "Spare code"),
		OneItuCode.new("834" , "Spare code"),
		OneItuCode.new("835" , "Spare code"),
		OneItuCode.new("836" , "Spare code"),
		OneItuCode.new("837" , "Spare code"),
		OneItuCode.new("838" , "Spare code"),
		OneItuCode.new("839" , "Spare code"),
		OneItuCode.new("84" , "Viet Nam"),
		OneItuCode.new("850" , "Korea, Democratic People's Republic of"),
		OneItuCode.new("851" , "Spare code"),
		OneItuCode.new("852" , "Hong Kong"),
		OneItuCode.new("853" , "Macao"),
		OneItuCode.new("854" , "Spare code"),
		OneItuCode.new("855" , "Cambodia"),
		OneItuCode.new("856" , "Lao People's Democratic Republic"),
		OneItuCode.new("857" , "Spare code"),
		OneItuCode.new("858" , "Spare code"),
		OneItuCode.new("859" , "Spare code"),
		OneItuCode.new("86" , "China"),
		OneItuCode.new("870" , "Inmarsat SNAC"),
		OneItuCode.new("871" , "Inmarsat"),
		OneItuCode.new("872" , "Inmarsat"),
		OneItuCode.new("873" , "Inmarsat"),
		OneItuCode.new("874" , "Inmarsat"),
		OneItuCode.new("875" , "Reserved - Maritime Mobile Service Applications"),
		OneItuCode.new("876" , "Reserved - Maritime Mobile Service Applications"),
		OneItuCode.new("877" , "Reserved - Maritime Mobile Service Applications"),
		OneItuCode.new("878" , "Universal Personal Telecommunication Service"),
		OneItuCode.new("879" , "Reserved for national non-commercial purposes"),
		OneItuCode.new("880" , "Bangladesh"),
		OneItuCode.new("881" , "International Mobile, shared code"),
		OneItuCode.new("882" , "International Networks, shared code"),
		OneItuCode.new("883" , "Spare code"),
		OneItuCode.new("884" , "Spare code"),
		OneItuCode.new("885" , "Spare code"),
		OneItuCode.new("886" , "Reserved"),
		OneItuCode.new("887" , "Spare code"),
		OneItuCode.new("888" , "Reserved for future global service"),
		OneItuCode.new("889" , "Spare code"),
		OneItuCode.new("890" , "Spare code"),
		OneItuCode.new("891" , "Spare code"),
		OneItuCode.new("892" , "Spare code"),
		OneItuCode.new("893" , "Spare code"),
		OneItuCode.new("894" , "Spare code"),
		OneItuCode.new("895" , "Spare code"),
		OneItuCode.new("896" , "Spare code"),
		OneItuCode.new("897" , "Spare code"),
		OneItuCode.new("898" , "Spare code"),
		OneItuCode.new("899" , "Spare code"),
		OneItuCode.new("90" , "Turkey"),
		OneItuCode.new("91" , "India"),
		OneItuCode.new("92" , "Pakistan"),
		OneItuCode.new("93" , "Afghanistan"),
		OneItuCode.new("94" , "Sri Lanka"),
		OneItuCode.new("95" , "Myanmar"),
		OneItuCode.new("960" , "Maldives"),
		OneItuCode.new("961" , "Lebanon"),
		OneItuCode.new("962" , "Jordan"),
		OneItuCode.new("963" , "Syrian Arab Republic"),
		OneItuCode.new("964" , "Iraq"),
		OneItuCode.new("965" , "Kuwait"),
		OneItuCode.new("966" , "Saudi Arabia"),
		OneItuCode.new("967" , "Yemen"),
		OneItuCode.new("968" , "Oman"),
		OneItuCode.new("969" , "Reserved - reservation currently under investigation"),
		OneItuCode.new("970" , "Reserved"),
		OneItuCode.new("971" , "United Arab Emirates"),
		OneItuCode.new("972" , "Israel"),
		OneItuCode.new("973" , "Bahrain"),
		OneItuCode.new("974" , "Qatar"),
		OneItuCode.new("975" , "Bhutan"),
		OneItuCode.new("976" , "Mongolia"),
		OneItuCode.new("977" , "Nepal"),
		OneItuCode.new("978" , "Spare code"),
		OneItuCode.new("979" , "International Premium Rate Service"),
		OneItuCode.new("98" , "Iran, Islamic Republic of"),
		OneItuCode.new("990" , "Spare code"),
		OneItuCode.new("991" , "Trial of a proposed new international telecommunication public correspondence"),
		OneItuCode.new("992" , "Tajikistan"),
		OneItuCode.new("993" , "Turkmenistan"),
		OneItuCode.new("994" , "Azerbaijan"),
		OneItuCode.new("995" , "Georgia")
	]

  def self.list
    ItuCodes::CODE_LIST
	end
	
	# returns an array of hashes:
	#   ItuCodes.find(995)        
	#     => [{"995"=>"Georgia"}]
	#   ItuCodes.find("france")
	#     => [{"33"=>"France"}]
	#   ItuCodes.find("stan")
  #     => [{"992"  =>  "Tajikistan (Republic of)"}, 
  #     =>  {"993"  =>  "Turkmenistan"}, 
  #     =>  {"7"    =>  ["Kazakhstan (Republic of)", "Russian Federation"]}, 
  #     =>  {"92"   =>  "Pakistan (Islamic Republic of)"}, 
  #     =>  {"93"   =>  "Afghanistan"}
  #     => ]
	def self.find (code_or_name)
	  if code_or_name.to_s.match /[^0-9]/  # non-numeric string passed
      find_by_name(code_or_name.to_s)
    else
	    find_by_code(code_or_name.to_s)
    end
  end
	
	def self.find_by_code(code)
	  ItuCodes::CODE_LIST.find_all do |record|
      record.has_code? code
    end
  end

	def self.find_by_name(name)
	  ItuCodes::CODE_LIST.find_all do |record|
      record.has_name? name
    end
  end
  
  # ie. find_by_country_abbreviation('US')
  def find_by_country_abbreviation(abbr)
    ItuCodes.find_by_name( Carmen::country_name(abbr) )
  end
  
  def self.get_country_abbreviation(code)
    Carmen::country_code( self.find_by_code(code).first.name )
  end
	
	def self.valid_code?(some_code)
    self.list.any?{ |entry| entry.has_code?(some_code.to_s) }
  end
  
  def self.north_america
    ItuCodes::CODE_LIST[1]
  end
  
  def self.north_american?(some_code)
    some_code.to_s[0,1] == '1'
  end
  
  # parse a destination code (probably with area code) to find the ITU code
  #   ex:  parse_code(1818) => 1
  def self.parse_code(some_code)
      some_code = some_code.to_s unless some_code.respond_to? :length

      # North American codes are a headache:
      # http://en.wikipedia.org/wiki/List_of_country_calling_codes      
      if self.north_american?(some_code)
        if valid_code? some_code[0,4] # NOT the US or Canada --> 4 digit country code
          sub_index = 4
        else  # US or CANADA --> 1 digit country code
          sub_index = 1
        end
      else      
        sub_index = (1..some_code.length).find do |len|
          valid_code? some_code[0,len]
        end
      end
      some_code[0,sub_index] unless sub_index.nil?
  end

  def self.parse_area_code(some_code)
    some_code = some_code.to_s
    if parse_code(some_code) and ! valid_code? some_code
      len = parse_code(some_code).length
      some_code[len..-1]
    else
      nil
    end
  end
	
	def self.compatriots?(some, other)
    some_country_code   = parse_code some
    other_country_code  = parse_code other
    
    both_valid  = valid_code?(some_country_code) and valid_code?(other_country_code)
    same        = some_country_code == other_country_code
    both_valid and same
  end
  
  def self.american?(some_code)
    parse_code(some_code) == "1"
  end
	
end
# sample usage:
# i = ItuCodes.new
# i.valid_code? 8392813   # => false
# i.valid_code? 7         # => true
# i.parse_code 1818       # => 1
# i.parse_code 4          # => nil