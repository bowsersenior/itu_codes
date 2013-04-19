# ItuCodes [![Build Status](https://secure.travis-ci.org/bowsersenior/itu_codes.png)](http://travis-ci.org/bowsersenior/itu_codes)

Helper library for telephone country codes based on the official International Telecommunications Union specifications:

* [List of ITU-T Recommendation E.164 assigned country codes][1]
* [LIST OF ITU-T RECOMMENDATION E.164 ASSIGNED COUNTRY CODES (POSITION ON 1 NOVEMBER 2011)][2]

Country code lookup based on official ISO-3166-1 specifications:
* [Country Codes - ISO 3166][3]
* [list of alpha-2 country codes in XML format][4]

The main goal of this library is to closely match the latest official specifications from the [ITU][5], [ISO][6], [NANPA][7] and other governing bodies relating to calling codes. If you find any discrepancies in the data, please let me know!

Some complicating factors when dealing with calling codes:
* In North America, 25 countries and territories follow the [North American Numbering Plan][7] and share the ITU code '1'.
* Russia and Kazakhstan share the ITU code '7'.
* The ITU does not use ISO 3166 alpha-2 codes to specify countries or regions in its documents.
* In general, each ITU code corresponds to exactly one ISO 3166 code. However, there are exceptions. For examples, the Australian External Territories have a single ITU code of '672', but have 4 distinct ISO 3166 codes (CC, CX, HM, NF).


## Usage:

```ruby

# The following methods are provided:

# ItuCodes.country_for(full_or_partial_number)
# ItuCodes.find_by_itu_code(code)
# ItuCodes.find_by_name(country_name)
# ItuCodes.valid_code?(exact_itu_code)
# ItuCodes.parse_code(full_or_partial_number)
# ItuCodes.parse_number(full_or_partial_number)
# ItuCodes.iso2itu(iso_2_letter_country_code)
# ItuCodes.itu2iso(exact_itu_code)
# ItuCodes.compatriots?(full_or_partial_number1, full_or_partial_number2)
# ItuCodes.north_american_area_code_for

# Examples

# Any full or partial number will work
ItuCodes.country_for('33')
# => "France"

# Country names are returned EXACTLY as specified in ITU E.164 document
ItuCodes.country_for('18184442222')
# => "United States of America"

ItuCodes.country_for('7')
# => [ "Kazakhstan (Republic of)", "Russian Federation" ]

ItuCodes.find_by_itu_code '995'
# => "Georgia"

ItuCodes.find_by_itu_code '123123995'
# => nil

# Name should match EXACTLY as specified in ITU E.164 document
# ItuCodes.iso2itu accepts 2 letter ISO 3166 codes
ItuCodes.find_by_name 'France'
# => "33"

ItuCodes.find_by_name 'Erewhon'
# => nil

ItuCodes.valid_code? '8392813'
# => false

ItuCodes.valid_code? '7'
# => true

ItuCodes.parse_code '18185558888'
# => 1

# non-numeric characters are ignored
ItuCodes.parse_code '1 (818) 555-8888'
# => "1"

ItuCodes.parse_code '822'
# => "82"

ItuCodes.parse_code '4'
# => nil


ItuCodes.parse_number '18185558888'
# => "8185558888"

# non-numeric characters are ignored
ItuCodes.parse_number '1 (818) 555-8888'
# => "8185558888"

# Convert from and to ISO 2-letter country codes:
ItuCodes.iso2itu('US')
# => "1"

# Convert from and to ISO 2-letter country codes:
ItuCodes.itu2iso('1')
# => ["AS", "AI", "AG", "BS", "BB", "BM", "VG", "CA", "KY", "DM", "DO", "GD", "GU", "JM", "MS", "MP", "PR", "KN", "LC", "VC", "SX", "TT", "TC", "US", "VI"]

# Mexico
# ISO 3361 code : MX
# ITU code      : 52
ItuCodes.iso2itu('MX')
# => "52"

ItuCodes.itu2iso('52')
# => "MX"

# Despite the same 1st digit,
# these are for different
# countries ...
ItuCodes.compatriots? '822', '811'
# => false

# ... but these are for
# the same country ...
ItuCodes.compatriots? '1984', '1985'
# => true

# ... and then there's the
# North American 'situation' ...
ItuCodes.compatriots? '1264', '1818'
# => false

# parse the area code for North American numbers:
ItuCodes.north_american_area_code_for '18185551234'
# => '1818'

# returns nil if the passed number is not North American
ItuCodes.north_american_area_code_for '332233'
# => nil
```

[1]: http://www.itu.int/pub/T-SP-E.164D-11-2011
[2]: http://www.itu.int/dms_pub/itu-t/opb/sp/T-SP-E.164D-11-2011-PDF-E.pdf
[3]: http://www.iso.org/iso/home/standards/country_codes
[4]: http://www.iso.org/iso/home/standards/country_codes/country_names_and_code_elements_xml
[5]: http://www.itu.int
[6]: http://www.iso.org
[7]: http://www.nanpa.com