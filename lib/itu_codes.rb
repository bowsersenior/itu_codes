# to-do: deal with headache codes:
# 1 --> Non-US need to be separated by area code
# 7 --> Kazakhstan!
require 'enumerator'

# TODO: add ability to search for common names (i.e. 'USA' or 'United States of America' for 'United States')
class OneItuCode < Object
  attr_reader :code, :name, :subcodes, :all_codes
  
  # subcodes should be an array of hashes like so:
  # subcodes = [ { :code =>	'1684', :name =>	'American Samoa'} , { :code =>	'1264' , :name =>	"Anguilla"}]
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
	  { "0"     =>	"Reserved"},
	  
	  { "1"     =>	"United States"},
    
    # from http://www.cnac.ca/co_codes/co_code_status_map.htm
	  { "1"   	=>	"Canada" },
	  { "1250"	=>	"Canada" },
    { "1204"	=>	"Canada" }, 
    { "1226"	=>	"Canada" },
    { "1250"	=>	"Canada" },
    { "1289"	=>	"Canada" },
    { "1306"	=>	"Canada" },
    { "1343"	=>	"Canada" },
    { "1403"	=>	"Canada" },
    { "1416"	=>	"Canada" },
    { "1418"	=>	"Canada" },
    { "1438"	=>	"Canada" },
    { "1450"	=>	"Canada" },
    { "1506"	=>	"Canada" },
    { "1514"	=>	"Canada" },
    { "1519"	=>	"Canada" },
    { "1581"	=>	"Canada" },
    { "1587"	=>	"Canada" },
    { "1604"	=>	"Canada" },
    { "1613"	=>	"Canada" },
    { "1647"	=>	"Canada" },
    { "1705"	=>	"Canada" },
    { "1709"	=>	"Canada" },
    { "1778"	=>	"Canada" },
    { "1780"	=>	"Canada" },
    { "1807"	=>	"Canada" },
    { "1819"	=>	"Canada" },
    { "1867"	=>	"Canada" },
    { "1902"	=>	"Canada" },
    { "1905"	=>	"Canada" },

	  { "1"     =>	 "American Samoa" },
	  { "1684"  =>	 "American Samoa" },

	  { "1"     =>	"Anguilla" },	  
	  { "1264"  =>	"Anguilla" },	  

	  { "1"     =>  "Antigua and Barbuda" },
	  { "1268"  =>	"Antigua and Barbuda" },

	  { "1"     =>	"Bahamas" },
	  { "1242"  =>	"Bahamas" },

	  { "1"     =>	"Barbados" },
	  { "1246"  =>	"Barbados" },

	  { "1"     =>	"Bermuda" },
	  { "1441"  =>	"Bermuda" },

	  { "1"     =>	"British Virgin Islands" },
	  { "1284"  =>	"British Virgin Islands" },

	  { "1"     =>	"Cayman Islands" },
	  { "1345"  =>	"Cayman Islands" },
	  
	  { "1"     =>	"Dominica" },
	  { "1767"  =>	"Dominica" },

	  { "1"     =>	"Dominican Republic" },
	  { "1809"  =>	"Dominican Republic" },
	  { "1829"  =>	"Dominican Republic" },

	  { "1"     =>	"Grenada" },
	  { "1473"  =>	"Grenada" },

	  { "1"     =>	"Guam" },
	  { "1671"  =>	"Guam" },

	  { "1"     =>	"Jamaica" },
	  { "1876"  =>	"Jamaica" },

	  { "1"     =>	"Montserrat" },
	  { "1664"  =>	"Montserrat" },

	  { "1"     =>	"Northern Mariana Islands" },
	  { "1670"  =>	"Northern Mariana Islands" },

	  { "1"     =>	"Saint Kitts and Nevis" },
	  { "1869"  =>	"Saint Kitts and Nevis" },

	  { "1"     =>	"Saint Lucia" },
	  { "1758"  =>	"Saint Lucia" },

	  { "1"     =>	"Saint Vincent and the Grenadines" },
	  { "1784"  =>	"Saint Vincent and the Grenadines" },

	  { "1"     =>	"Trinidad and Tobago" },
	  { "1868"  =>	"Trinidad and Tobago" },

	  { "1"     =>	"Turks and Caicos Islands" },
	  { "1649"  =>	"Turks and Caicos Islands" },

	  { "1"     =>	"United States Virgin Islands" },
	  { "1340"  =>	"United States Virgin Islands" },
    
		{"20" 		=>			"Egypt"},
		{"210" 		=>			"Spare code"},
		{"211" 		=>			"Spare code"},
		{"212" 		=>			"Morocco"},
		{"213" 		=>			"Algeria"},
		{"214" 		=>			"Spare code"},
		{"215" 		=>			"Spare code"},
		{"216" 		=>			"Tunisia"},
		{"217" 		=>			"Spare code"},
		{"218" 		=>			"Libyan Arab Jamahiriya"},
		{"219" 		=>			"Spare code"},
		{"220" 		=>			"Gambia"},
		{"221" 		=>			"Senegal"},
		{"222" 		=>			"Mauritania"},
		{"223" 		=>			"Mali"},
		{"224" 		=>			"Guinea"},
		{"225" 		=>			"Cote D'ivoire"},
		{"226" 		=>			"Burkina Faso"},
		{"227" 		=>			"Niger"},
		{"228" 		=>			"Togo"},
		{"229" 		=>			"Benin"},
		{"230" 		=>			"Mauritius"},
		{"231" 		=>			"Liberia"},
		{"232" 		=>			"Sierra Leone"},
		{"233" 		=>			"Ghana"},
		{"234" 		=>			"Nigeria"},
		{"235" 		=>			"Chad"},
		{"236" 		=>			"Central African Republic"},
		{"237" 		=>			"Cameroon"},
		{"238" 		=>			"Cape Verde"},
		{"239" 		=>			"Sao Tome and Principe"},
		{"240" 		=>			"Equatorial Guinea"},
		{"241" 		=>			"Gabon"},
		{"242" 		=>			"Congo"},
		{"243" 		=>			"Congo, the Democratic Republic of the"},
		{"244" 		=>			"Angola"},
		{"245" 		=>			"Guinea-Bissau"},
		{"246" 		=>			"Diego Garcia"},
		{"247" 		=>			"Ascension"},
		{"248" 		=>			"Seychelles"},
		{"249" 		=>			"Sudan"},
		{"250" 		=>			"Rwanda"},
		{"251" 		=>			"Ethiopia"},
		{"252" 		=>			"Somalia"},
		{"253" 		=>			"Djibouti"},
		{"254" 		=>			"Kenya"},
		{"255" 		=>			"Tanzania, United Republic of"},
		{"256" 		=>			"Uganda"},
		{"257" 		=>			"Burundi"},
		{"258" 		=>			"Mozambique"},
		{"259" 		=>			"Spare code"},
		{"260" 		=>			"Zambia"},
		{"261" 		=>			"Madagascar"},
		{"262" 		=>			"Reunion"},
		{"263" 		=>			"Zimbabwe"},
		{"264" 		=>			"Namibia"},
		{"265" 		=>			"Malawi"},
		{"266" 		=>			"Lesotho"},
		{"267" 		=>			"Botswana"},
		{"268" 		=>			"Swaziland"},
		{"269" 		=>			"Comoros"},
		{"269" 		=>			"Mayotte"},
		{"27" 		=>			"South Africa"},
		{"280" 		=>			"Spare code"},
		{"281" 		=>			"Spare code"},
		{"282" 		=>			"Spare code"},
		{"283" 		=>			"Spare code"},
		{"284" 		=>			"Spare code"},
		{"285" 		=>			"Spare code"},
		{"286" 		=>			"Spare code"},
		{"287" 		=>			"Spare code"},
		{"288" 		=>			"Spare code"},
		{"289" 		=>			"Spare code"},
		{"290" 		=>			"Saint Helena"},
		{"291" 		=>			"Eritrea"},
		{"292" 		=>			"Spare code"},
		{"293" 		=>			"Spare code"},
		{"294" 		=>			"Spare code"},
		{"295" 		=>			"Spare code"},
		{"296" 		=>			"Spare code"},
		{"297" 		=>			"Aruba"},
		{"298" 		=>			"Faroe Islands"},
		{"299" 		=>			"Greenland"},
		{"30" 		=>			"Greece"},
		{"31" 		=>			"Netherlands"},
		{"32" 		=>			"Belgium"},
		{"33" 		=>			"France"},
		{"34" 		=>			"Spain"},
		{"350" 		=>			"Gibraltar"},
		{"351" 		=>			"Portugal"},
		{"352" 		=>			"Luxembourg"},
		{"353" 		=>			"Ireland"},
		{"354" 		=>			"Iceland"},
		{"355" 		=>			"Albania"},
		{"356" 		=>			"Malta"},
		{"357" 		=>			"Cyprus"},
		{"358" 		=>			"Finland"},
		{"359" 		=>			"Bulgaria"},
		{"36" 		=>			"Hungary"},
		{"370" 		=>			"Lithuania"},
		{"371" 		=>			"Latvia"},
		{"372" 		=>			"Estonia"},
		{"373" 		=>			"Moldova, Republic of"},
		{"374" 		=>			"Armenia"},
		{"375" 		=>			"Belarus"},
		{"376" 		=>			"Andorra"},
		{"377" 		=>			"Monaco"},
		{"378" 		=>			"San Marino"},
		{"379" 		=>			"Holy See (Vatican City State},"},
		{"380" 		=>			"Ukraine"},
		{"381" 		=>			"Serbia and Montenegro"},
		{"382" 		=>			"Spare code"},
		{"383" 		=>			"Spare code"},
		{"384" 		=>			"Spare code"},
		{"385" 		=>			"Croatia"},
		{"386" 		=>			"Slovenia"},
		{"387" 		=>			"Bosnia and Herzegovina"},
		{"388" 		=>			"Group of countries, shared code"},
		{"389" 		=>			"Macedonia, the Former Yugoslav Republic of"},
		{"39" 		=>			"Italy"},
		{"40" 		=>			"Romania"},
		{"41" 		=>			"Switzerland"},
		{"420" 		=>			"Czech Republic"},
		{"421" 		=>			"Slovakia"},
		{"422" 		=>			"Spare code"},
		{"423" 		=>			"Liechtenstein"},
		{"424" 		=>			"Spare code"},
		{"425" 		=>			"Spare code"},
		{"426" 		=>			"Spare code"},
		{"427" 		=>			"Spare code"},
		{"428" 		=>			"Spare code"},
		{"429" 		=>			"Spare code"},
		{"43" 		=>			"Austria"},
		{"44" 		=>			"United Kingdom"},
		{"45" 		=>			"Denmark"},
		{"46" 		=>			"Sweden"},
		{"47" 		=>			"Norway"},
		{"48" 		=>			"Poland"},
		{"49" 		=>			"Germany"},
		{"500" 		=>			"Falkland Islands"},
		{"501" 		=>			"Belize"},
		{"502" 		=>			"Guatemala"},
		{"503" 		=>			"El Salvador"},
		{"504" 		=>			"Honduras"},
		{"505" 		=>			"Nicaragua"},
		{"506" 		=>			"Costa Rica"},
		{"507" 		=>			"Panama"},
		{"508" 		=>			"Saint Pierre and Miquelon"},
		{"509" 		=>			"Haiti"},
		{"51" 		=>			"Peru"},
		{"52" 		=>			"Mexico"},
		{"53" 		=>			"Cuba"},
		{"54" 		=>			"Argentina"},
		{"55" 		=>			"Brazil"},
		{"56" 		=>			"Chile"},
		{"57" 		=>			"Colombia"},
		{"58" 		=>			"Venezuela"},
		{"590" 		=>			"Guadeloupe"},
		{"591" 		=>			"Bolivia"},
		{"592" 		=>			"Guyana"},
		{"593" 		=>			"Ecuador"},
		{"594" 		=>			"French Guiana"},
		{"595" 		=>			"Paraguay"},
		{"596" 		=>			"Martinique"},
		{"597" 		=>			"Suriname"},
		{"598" 		=>			"Uruguay"},
		{"599" 		=>			"Netherlands Antilles"},
		{"60" 		=>			"Malaysia"},
		{"61" 		=>			"Australia"},
		{"62" 		=>			"Indonesia"},
		{"63" 		=>			"Philippines"},
		{"64" 		=>			"New Zealand"},
		{"65" 		=>			"Singapore"},
		{"66" 		=>			"Thailand"},
		{"670" 		=>			"Timor-Leste"},
		{"671" 		=>			"Spare code"},
		{"672" 		=>			"Australian External Territories"},
		{"673" 		=>			"Brunei Darussalam"},
		{"674" 		=>			"Nauru"},
		{"675" 		=>			"Papua New Guinea"},
		{"676" 		=>			"Tonga"},
		{"677" 		=>			"Solomon Islands"},
		{"678" 		=>			"Vanuatu"},
		{"679" 		=>			"Fiji"},
		{"680" 		=>			"Palau"},
		{"681" 		=>			"Wallis and Futuna"},
		{"682" 		=>			"Cook Islands"},
		{"683" 		=>			"Niue"},
		{"684" 		=>			"Spare code"},
		{"685" 		=>			"Samoa"},
		{"686" 		=>			"Kiribati"},
		{"687" 		=>			"New Caledonia"},
		{"688" 		=>			"Tuvalu"},
		{"689" 		=>			"French Polynesia"},
		{"690" 		=>			"Tokelau"},
		{"691" 		=>			"Micronesia, Federated States of"},
		{"692" 		=>			"Marshall Islands"},
		{"693" 		=>			"Spare code"},
		{"694" 		=>			"Spare code"},
		{"695" 		=>			"Spare code"},
		{"696" 		=>			"Spare code"},
		{"697" 		=>			"Spare code"},
		{"698" 		=>			"Spare code"},
		{"699" 		=>			"Spare code"},

		{"7" 		  =>			"Russian Federation"},
		{"7" 		  =>			"Kazakhstan"},
		
		{"800" 		=>			"International Freephone Service"},
		{"801" 		=>			"Spare code"},
		{"802" 		=>			"Spare code"},
		{"803" 		=>			"Spare code"},
		{"804" 		=>			"Spare code"},
		{"805" 		=>			"Spare code"},
		{"806" 		=>			"Spare code"},
		{"807" 		=>			"Spare code"},
		{"808" 		=>			"International Shared Cost Service"},
		{"809" 		=>			"Spare code"},
		{"81" 		=>			"Japan"},
		{"82" 		=>			"Korea, Republic of"},
		{"830" 		=>			"Spare code"},
		{"831" 		=>			"Spare code"},
		{"832" 		=>			"Spare code"},
		{"833" 		=>			"Spare code"},
		{"834" 		=>			"Spare code"},
		{"835" 		=>			"Spare code"},
		{"836" 		=>			"Spare code"},
		{"837" 		=>			"Spare code"},
		{"838" 		=>			"Spare code"},
		{"839" 		=>			"Spare code"},
		{"84" 		=>			"Viet Nam"},
		{"850" 		=>			"Korea, Democratic People's Republic of"},
		{"851" 		=>			"Spare code"},
		{"852" 		=>			"Hong Kong"},
		{"853" 		=>			"Macao"},
		{"854" 		=>			"Spare code"},
		{"855" 		=>			"Cambodia"},
		{"856" 		=>			"Lao People's Democratic Republic"},
		{"857" 		=>			"Spare code"},
		{"858" 		=>			"Spare code"},
		{"859" 		=>			"Spare code"},
		{"86" 		=>			"China"},
		{"870" 		=>			"Inmarsat SNAC"},
		{"871" 		=>			"Inmarsat"},
		{"872" 		=>			"Inmarsat"},
		{"873" 		=>			"Inmarsat"},
		{"874" 		=>			"Inmarsat"},
		{"875" 		=>			"Reserved - Maritime Mobile Service Applications"},
		{"876" 		=>			"Reserved - Maritime Mobile Service Applications"},
		{"877" 		=>			"Reserved - Maritime Mobile Service Applications"},
		{"878" 		=>			"Universal Personal Telecommunication Service"},
		{"879" 		=>			"Reserved for national non-commercial purposes"},
		{"880" 		=>			"Bangladesh"},
		{"881" 		=>			"International Mobile, shared code"},
		{"882" 		=>			"International Networks, shared code"},
		{"883" 		=>			"Spare code"},
		{"884" 		=>			"Spare code"},
		{"885" 		=>			"Spare code"},
		{"886" 		=>			"Reserved"},
		{"887" 		=>			"Spare code"},
		{"888" 		=>			"Reserved for future global service"},
		{"889" 		=>			"Spare code"},
		{"890" 		=>			"Spare code"},
		{"891" 		=>			"Spare code"},
		{"892" 		=>			"Spare code"},
		{"893" 		=>			"Spare code"},
		{"894" 		=>			"Spare code"},
		{"895" 		=>			"Spare code"},
		{"896" 		=>			"Spare code"},
		{"897" 		=>			"Spare code"},
		{"898" 		=>			"Spare code"},
		{"899" 		=>			"Spare code"},
		{"90" 		=>			"Turkey"},
		{"91" 		=>			"India"},
		{"92" 		=>			"Pakistan"},
		{"93" 		=>			"Afghanistan"},
		{"94" 		=>			"Sri Lanka"},
		{"95" 		=>			"Myanmar"},
		{"960" 		=>			"Maldives"},
		{"961" 		=>			"Lebanon"},
		{"962" 		=>			"Jordan"},
		{"963" 		=>			"Syrian Arab Republic"},
		{"964" 		=>			"Iraq"},
		{"965" 		=>			"Kuwait"},
		{"966" 		=>			"Saudi Arabia"},
		{"967" 		=>			"Yemen"},
		{"968" 		=>			"Oman"},
		{"969" 		=>			"Reserved - reservation currently under investigation"},
		{"970" 		=>			"Reserved"},
		{"971" 		=>			"United Arab Emirates"},
		{"972" 		=>			"Israel"},
		{"973" 		=>			"Bahrain"},
		{"974" 		=>			"Qatar"},
		{"975" 		=>			"Bhutan"},
		{"976" 		=>			"Mongolia"},
		{"977" 		=>			"Nepal"},
		{"978" 		=>			"Spare code"},
		{"979" 		=>			"International Premium Rate Service"},
		{"98" 		=>			"Iran, Islamic Republic of"},
		{"990" 		=>			"Spare code"},
		{"991" 		=>			"Trial of a proposed new international telecommunication public correspondence"},
		{"992" 		=>			"Tajikistan"},
		{"993" 		=>			"Turkmenistan"},
		{"994" 		=>			"Azerbaijan"},
		{"995" 		=>			"Georgia"}
	]

  def self.list
    ItuCodes::CODE_LIST
	end
	
	def self.lookup(code)
	  cleaned = clean(code)
	  list.find_all{ |hsh| hsh.keys.first == cleaned }.map do |k| 
	    k.values.first 
	  end.uniq
  end
	
	def self.find (code_or_name)
	  if code_or_name.to_s.match /[^0-9]/  # non-numeric string passed
      find_by_name(code_or_name)
    else
      cleaned = self.clean(code_or_name)
	    find_by_itu_code(cleaned)
    end
  end
	
	def self.find_by_itu_code(code)
	  if american?(code) and code.length > 1
	    returner = 'United States'
    else
  	  returner = ItuCodes::CODE_LIST.find_all do |record|
        record.has_key? code
      end.map { |k| k.values.first }.uniq
    end
    returner.size <= 1 ? returner.shift : returner
  end

	def self.find_by_name(name)
	  returner = list.find_all do |record|
      record.has_value? name
    end.map{ |k| k.keys.first }.uniq
    returner.size <= 1 ? returner.shift : returner
  end
  
  # ie. find_by_country_iso_code('US')
  def self.find_by_country_iso_code(iso_code)
    ItuCodes.find_by_name( Carmen::country_name(iso_code) )
  end
  
  # this is tricky for North American destinations: '1' can be the US, Canada or another country
  def self.get_country_iso_code(itu_code)
    Carmen::country_code( ItuCodes.find_by_code(itu_code).first.name ) rescue nil
  end
	
	# returns true for any valid ITU code
	# valid_code?(1)    => true
	# valid_code?(1818) => false
	def self.valid_code?(some_code)
	  if north_american?(some_code)
	    some_code.length == 1
    else
	    self.list.any? { |hsh| hsh.has_key?(some_code) }
    end
  end
  
  def self.north_america
    find_by_itu_code '1'
  end
  
  def self.north_american?(some_code)
    some_code.to_s[0,1] == '1'
  end
  
  # parse a destination code (probably with area code) to find the ITU code
  #   ex:  parse_code(1818) =>	1
  def self.parse_code(some_code)
    some_code = clean(some_code)
    sub_index = (1..some_code.length).find do |len|
      valid_code? some_code[0,len]
    end
    some_code[0,sub_index] unless sub_index.nil?
  end
	
	def self.compatriots?(some, other)
	  both_valid = ! ( parse_code(some).nil? or parse_code(other).nil? )
    both_valid and ( parse_code(some) == parse_code(other) ) rescue nil
  end
  
  def self.american?(some_code)
    # for non-US North American codes, parse_code will return a 4 digit code
    # for US, '1' will be returned
    some_code = some_code.to_s    
    countries = lookup(some_code[0,4])
    north_american?(some_code) and (countries.include?('United States') or countries.empty?)
  end
	
	# converts input to string, then strips any non-numeric characters
	def self.clean(input)
	  input.to_s.gsub(/[^0-9]/, '')
  end
end