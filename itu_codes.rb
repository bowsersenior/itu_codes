# to-do: deal with headache codes:
# 1 --> Non-US need to be separated by area code
# 7 --> Kazakhstan!
require 'enumerator'

class ItuCodes < Object
	@@CODE_LIST = {
		"0" => "Reserved",
		"1" => {
  		"1"    => "United States of America",		  
		  "1684" => "American Samoa",
  		"1264" => "Anguilla",
  		"1268" => "Antigua and Barbuda",
  		"1242" => "Bahamas (Commonwealth of the)",
  		"1246" => "Barbados",
  		"1441" => "Bermuda",
  		"1284" => "British Virgin Islands",
      "1204" => "Canada", # from http://www.cnac.ca/co_codes/co_code_status_map.htm
      "1226" => "Canada",
      "1250" => "Canada",
      "1289" => "Canada",
      "1306" => "Canada",
      "1343" => "Canada",
      "1403" => "Canada",
      "1416" => "Canada",
      "1418" => "Canada",
      "1438" => "Canada",
      "1450" => "Canada",
      "1506" => "Canada",
      "1514" => "Canada",
      "1519" => "Canada",
      "1581" => "Canada",
      "1587" => "Canada",
      "1604" => "Canada",
      "1613" => "Canada",
      "1647" => "Canada",
      "1705" => "Canada",
      "1709" => "Canada",
      "1778" => "Canada",
      "1780" => "Canada",
      "1807" => "Canada",
      "1819" => "Canada",
      "1867" => "Canada",
      "1902" => "Canada",
      "1905" => "Canada",
  		"1345" => "Cayman Islands",
  		"1767" => "Dominica (Commonwealth of)",
  		"1809" => "Dominican Republic",
  		"1829" => "Dominican Republic",
  		"1473" => "Grenada",
  		"1671" => "Guam",
  		"1876" => "Jamaica",
  		"1664" => "Montserrat",
  		"1670" => "Northern Mariana Islands (Commonwealth of the)",
  		"1869" => "Saint Kitts and Nevis",
  		"1758" => "Saint Lucia",
  		"1784" => "Saint Vincent and the Grenadines",
  		"1868" => "Trinidad and Tobago",
  		"1649" => "Turks and Caicos Islands",
  		"1340" => "United States Virgin Islands"
  	},
		"20" => "Egypt (Arab Republic of)",
		"210" => "Spare code",
		"211" => "Spare code",
		"212" => "Morocco (Kingdom of)",
		"213" => "Algeria (People's Democratic Republic of)",
		"214" => "Spare code",
		"215" => "Spare code",
		"216" => "Tunisia",
		"217" => "Spare code",
		"218" => "Libya (Socialist People's Libyan Arab Jamahiriya)",
		"219" => "Spare code",
		"220" => "Gambia (Republic of the)",
		"221" => "Senegal (Republic of)",
		"222" => "Mauritania (Islamic Republic of)",
		"223" => "Mali (Republic of)",
		"224" => "Guinea (Republic of)",
		"225" => "Côte d'Ivoire (Republic of)",
		"226" => "Burkina Faso",
		"227" => "Niger (Republic of the)",
		"228" => "Togolese Republic",
		"229" => "Benin (Republic of)",
		"230" => "Mauritius (Republic of)",
		"231" => "Liberia (Republic of)",
		"232" => "Sierra Leone",
		"233" => "Ghana",
		"234" => "Nigeria (Federal Republic of)",
		"235" => "Chad (Republic of)",
		"236" => "Central African Republic",
		"237" => "Cameroon (Republic of)",
		"238" => "Cape Verde (Republic of)",
		"239" => "Sao Tome and Principe (Democratic Republic of)",
		"240" => "Equatorial Guinea (Republic of)",
		"241" => "Gabonese Republic",
		"242" => "Congo (Republic of the)",
		"243" => "Democratic Republic of the Congo",
		"244" => "Angola (Republic of)",
		"245" => "Guinea-Bissau (Republic of)",
		"246" => "Diego Garcia",
		"247" => "Ascension",
		"248" => "Seychelles (Republic of)",
		"249" => "Sudan (Republic of the)",
		"250" => "Rwanda (Republic of)",
		"251" => "Ethiopia (Federal Democratic Republic of)",
		"252" => "Somali Democratic Republic",
		"253" => "Djibouti (Republic of)",
		"254" => "Kenya (Republic of)",
		"255" => "Tanzania (United Republic of)",
		"256" => "Uganda (Republic of)",
		"257" => "Burundi (Republic of)",
		"258" => "Mozambique (Republic of)",
		"259" => "Spare code",
		"260" => "Zambia (Republic of)",
		"261" => "Madagascar (Republic of)",
		"262" => "Reunion (French Department of)",
		"263" => "Zimbabwe (Republic of)",
		"264" => "Namibia (Republic of)",
		"265" => "Malawi",
		"266" => "Lesotho (Kingdom of)",
		"267" => "Botswana (Republic of)",
		"268" => "Swaziland (Kingdom of)",
		"269" => "Comoros (Union of the)",
		"269" => "Mayotte",
		"27" => "South Africa (Republic of)",
		"280" => "Spare code",
		"281" => "Spare code",
		"282" => "Spare code",
		"283" => "Spare code",
		"284" => "Spare code",
		"285" => "Spare code",
		"286" => "Spare code",
		"287" => "Spare code",
		"288" => "Spare code",
		"289" => "Spare code",
		"290" => "Saint Helena",
		"291" => "Eritrea",
		"292" => "Spare code",
		"293" => "Spare code",
		"294" => "Spare code",
		"295" => "Spare code",
		"296" => "Spare code",
		"297" => "Aruba",
		"298" => "Faroe Islands",
		"299" => "Greenland (Denmark)",
		"30" => "Greece",
		"31" => "Netherlands (Kingdom of the)",
		"32" => "Belgium",
		"33" => "France",
		"34" => "Spain",
		"350" => "Gibraltar",
		"351" => "Portugal",
		"352" => "Luxembourg",
		"353" => "Ireland",
		"354" => "Iceland",
		"355" => "Albania (Republic of)",
		"356" => "Malta",
		"357" => "Cyprus (Republic of)",
		"358" => "Finland",
		"359" => "Bulgaria (Republic of)",
		"36" => "Hungary (Republic of)",
		"370" => "Lithuania (Republic of)",
		"371" => "Latvia (Republic of)",
		"372" => "Estonia (Republic of)",
		"373" => "Moldova (Republic of)",
		"374" => "Armenia (Republic of)",
		"375" => "Belarus (Republic of)",
		"376" => "Andorra (Principality of)",
		"377" => "Monaco (Principality of)",
		"378" => "San Marino (Republic of)",
		"379" => "Vatican City State",
		"380" => "Ukraine",
		"381" => "Serbia and Montenegro",
		"382" => "Spare code",
		"383" => "Spare code",
		"384" => "Spare code",
		"385" => "Croatia (Republic of)",
		"386" => "Slovenia (Republic of)",
		"387" => "Bosnia and Herzegovina",
		"388" => "Group of countries, shared code",
		"389" => "The Former Yugoslav Republic of Macedonia",
		"39" => "Italy",
		"39" => "Vatican City State",
		"40" => "Romania",
		"41" => "Switzerland (Confederation of)",
		"420" => "Czech Republic",
		"421" => "Slovak Republic",
		"422" => "Spare code",
		"423" => "Liechtenstein (Principality of)",
		"424" => "Spare code",
		"425" => "Spare code",
		"426" => "Spare code",
		"427" => "Spare code",
		"428" => "Spare code",
		"429" => "Spare code",
		"43" => "Austria",
		"44" => "United Kingdom of Great Britain and Northern Ireland",
		"45" => "Denmark",
		"46" => "Sweden",
		"47" => "Norway",
		"48" => "Poland (Republic of)",
		"49" => "Germany (Federal Republic of)",
		"500" => "Falkland Islands (Malvinas)",
		"501" => "Belize",
		"502" => "Guatemala (Republic of)",
		"503" => "El Salvador (Republic of)",
		"504" => "Honduras (Republic of)",
		"505" => "Nicaragua",
		"506" => "Costa Rica",
		"507" => "Panama (Republic of)",
		"508" => "Saint Pierre and Miquelon (Collectivité territoriale de la République française)",
		"509" => "Haiti (Republic of)",
		"51" => "Peru",
		"52" => "Mexico",
		"53" => "Cuba",
		"54" => "Argentine Republic",
		"55" => "Brazil (Federative Republic of)",
		"56" => "Chile",
		"57" => "Colombia (Republic of)",
		"58" => "Venezuela (Bolivarian Republic of)",
		"590" => "Guadeloupe (French Department of)",
		"591" => "Bolivia (Republic of)",
		"592" => "Guyana",
		"593" => "Ecuador",
		"594" => "French Guiana (French Department of)",
		"595" => "Paraguay (Republic of)",
		"596" => "Martinique (French Department of)",
		"597" => "Suriname (Republic of)",
		"598" => "Uruguay (Eastern Republic of)",
		"599" => "Netherlands Antilles",
		"60" => "Malaysia",
		"61" => "Australia",
		"62" => "Indonesia (Republic of)",
		"63" => "Philippines (Republic of the)",
		"64" => "New Zealand",
		"65" => "Singapore (Republic of)",
		"66" => "Thailand",
		"670" => "Democratic Republic of Timor-Leste",
		"671" => "Spare code",
		"672" => "Australian External Territories",
		"673" => "Brunei Darussalam",
		"674" => "Nauru (Republic of)",
		"675" => "Papua New Guinea",
		"676" => "Tonga (Kingdom of)",
		"677" => "Solomon Islands",
		"678" => "Vanuatu (Republic of)",
		"679" => "Fiji (Republic of)",
		"680" => "Palau (Republic of)",
		"681" => "Wallis and Futuna (Territoire français d'outre-mer)",
		"682" => "Cook Islands",
		"683" => "Niue",
		"684" => "Spare code",
		"685" => "Samoa (Independent State of)",
		"686" => "Kiribati (Republic of)",
		"687" => "New Caledonia (Territoire français d'outre-mer)",
		"688" => "Tuvalu",
		"689" => "French Polynesia (Territoire français d'outre-mer)",
		"690" => "Tokelau",
		"691" => "Micronesia (Federated States of)",
		"692" => "Marshall Islands (Republic of the)",
		"693" => "Spare code",
		"694" => "Spare code",
		"695" => "Spare code",
		"696" => "Spare code",
		"697" => "Spare code",
		"698" => "Spare code",
		"699" => "Spare code",
		"7" => [
		  "Kazakhstan (Republic of)",
	    "Russian Federation"
	  ],
		"800" => "International Freephone Service",
		"801" => "Spare code",
		"802" => "Spare code",
		"803" => "Spare code",
		"804" => "Spare code",
		"805" => "Spare code",
		"806" => "Spare code",
		"807" => "Spare code",
		"808" => "International Shared Cost Service (ISCS)",
		"809" => "Spare code",
		"81" => "Japan",
		"82" => "Korea (Republic of)",
		"830" => "Spare code",
		"831" => "Spare code",
		"832" => "Spare code",
		"833" => "Spare code",
		"834" => "Spare code",
		"835" => "Spare code",
		"836" => "Spare code",
		"837" => "Spare code",
		"838" => "Spare code",
		"839" => "Spare code",
		"84" => "Viet Nam (Socialist Republic of)",
		"850" => "Democratic People's Republic of Korea",
		"851" => "Spare code",
		"852" => "Hong Kong, China",
		"853" => "Macao, China",
		"854" => "Spare code",
		"855" => "Cambodia (Kingdom of)",
		"856" => "Lao People's Democratic Republic",
		"857" => "Spare code",
		"858" => "Spare code",
		"859" => "Spare code",
		"86" => "China (People's Republic of)",
		"870" => "Inmarsat SNAC",
		"871" => "Inmarsat (Atlantic Ocean-East)",
		"872" => "Inmarsat (Pacific Ocean)",
		"873" => "Inmarsat (Indian Ocean)",
		"874" => "Inmarsat (Atlantic Ocean-West)",
		"875" => "Reserved - Maritime Mobile Service Applications",
		"876" => "Reserved - Maritime Mobile Service Applications",
		"877" => "Reserved - Maritime Mobile Service Applications",
		"878" => "Universal Personal Telecommunication Service (UPT)",
		"879" => "Reserved for national non-commercial purposes",
		"880" => "Bangladesh (People's Republic of)",
		"881" => "International Mobile, shared code",
		"882" => "International Networks, shared code",
		"883" => "Spare code",
		"884" => "Spare code",
		"885" => "Spare code",
		"886" => "Reserved",
		"887" => "Spare code",
		"888" => "Reserved for future global service",
		"889" => "Spare code",
		"890" => "Spare code",
		"891" => "Spare code",
		"892" => "Spare code",
		"893" => "Spare code",
		"894" => "Spare code",
		"895" => "Spare code",
		"896" => "Spare code",
		"897" => "Spare code",
		"898" => "Spare code",
		"899" => "Spare code",
		"90" => "Turkey",
		"91" => "India (Republic of)",
		"92" => "Pakistan (Islamic Republic of)",
		"93" => "Afghanistan",
		"94" => "Sri Lanka (Democratic Socialist Republic of)",
		"95" => "Myanmar (Union of)",
		"960" => "Maldives (Republic of)",
		"961" => "Lebanon",
		"962" => "Jordan (Hashemite Kingdom of)",
		"963" => "Syrian Arab Republic",
		"964" => "Iraq (Republic of)",
		"965" => "Kuwait (State of)",
		"966" => "Saudi Arabia (Kingdom of)",
		"967" => "Yemen (Republic of)",
		"968" => "Oman (Sultanate of)",
		"969" => "Reserved - reservation currently under investigation",
		"970" => "Reserved",
		"971" => "United Arab Emirates",
		"972" => "Israel (State of)",
		"973" => "Bahrain (Kingdom of)",
		"974" => "Qatar (State of)",
		"975" => "Bhutan (Kingdom of)",
		"976" => "Mongolia",
		"977" => "Nepal",
		"978" => "Spare code",
		"979" => "International Premium Rate Service (IPRS)",
		"98" => "Iran (Islamic Republic of)",
		"990" => "Spare code",
		"991" => "Trial of a proposed new international telecommunication public correspondence",
		"992" => "Tajikistan (Republic of)",
		"993" => "Turkmenistan",
		"994" => "Azerbaijani Republic",
		"995" => "Georgia"
	}

  def self.list
    @@CODE_LIST
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
      find_by_name(code_or_name)
    else
	    find_by_code(code_or_name)
    end
  end
	
	def self.find_by_code(code)
	  @@CODE_LIST.find_all { |k,v| k == code.to_s }.map do |pair|
	    Hash[*pair]
    end
  end

	def self.find_by_name(name)
	  @@CODE_LIST.find_all { |k,v| v.to_s.downcase.include? name.downcase }.map do |pair|
	    Hash[*pair]
    end
  end
	
	def self.valid_code?(some_code)
    some_code = some_code.to_s unless some_code.respond_to? :length
    if some_code[0,1] == "1" and some_code.length >= 4
      @@CODE_LIST['1'].key? some_code
    else
      @@CODE_LIST.key? some_code
    end
  end
  
  # parse a destination code (probably with area code) to find the ITU code
  #   ex:  parse_code(1818) => 1
  def self.parse_code(some_code)
      some_code = some_code.to_s unless some_code.respond_to? :length

      # North American codes are a headache:
      # http://en.wikipedia.org/wiki/List_of_country_calling_codes      
      if some_code[0,1] == "1" and some_code.length >= 4
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
    some_code = some_code.to_s unless some_code.respond_to? :length
    if parse_code(some_code) and ! valid_code? some_code
      len = parse_code(some_code).length
      some_code[len..-1]
    else
      nil
    end
  end
	
	def self.compatriots?(some, other)
    returner = false
    
    some_country_code = parse_code some
    other_country_code = parse_code other
    
    if valid_code? some_country_code and valid_code? other_country_code
      returner = some_country_code == other_country_code
    else
      returner = nil
    end
    
    returner	  
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