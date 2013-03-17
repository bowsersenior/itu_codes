# ItuCodes [![Build Status](https://secure.travis-ci.org/bowsersenior/itu_codes.png)](http://travis-ci.org/bowsersenior/itu_codes)

Helper library for telephone country codes based on the official International Telecommunications Union specifications:

* [List of ITU-T Recommendation E.164 assigned country codes][1]
* [LIST OF ITU-T RECOMMENDATION E.164 ASSIGNED COUNTRY CODES (POSITION ON 1 NOVEMBER 2011)][2]

Country code lookup based on official ISO-3166-1 specifications:
* [Country Codes - ISO 3166][3]
* [list of alpha-2 country codes in XML format][4]

## Usage:

    ItuCodes.valid_code? '8392813'
    # => false

    ItuCodes.valid_code? '7'
    # => true

    ItuCodes.parse_code '1818'
    # => 1

    ItuCodes.parse_code '822'
    # => "82"

    ItuCodes.parse_code '4'
    # => nil

    ItuCodes.find_by_name 'France'
    # => "33"

    ItuCodes.find_by_itu_code '995'
    # => "Georgia"

    ItuCodes.find_by_name 'Erewhon'
    # => nil

    ItuCodes.find_by_itu_code '123123995'
    # => nil

    # Despite the same 1st digit,
    # these are for different
    # countries ...
    ItuCodes.compatriots? '822', '811'
    # => false

    # ... but these are for
    # the same country ...
    ItuCodes.compatriots? '122', '111'
    # => true

    # =====================================================
    # = Using 2-letter ISO country codes is most reliable =
    # =====================================================
    # ... and then there's the
    # North American 'situation' ...
    ItuCodes.compatriots? '1264', '1818'
    # => false

    # Convert from and to ISO 2-letter country codes:
    ItuCodes.iso2itu('US')
    # => "1"

    # Mexico
    # ISO 3361 code : MX
    # ITU code      : 52
    ItuCodes.iso2itu('MX')
    # => "52"


[1]: http://www.itu.int/pub/T-SP-E.164D-11-2011
[2]: http://www.itu.int/dms_pub/itu-t/opb/sp/T-SP-E.164D-11-2011-PDF-E.pdf
[3]: http://www.iso.org/iso/home/standards/country_codes
[4]: http://www.iso.org/iso/home/standards/country_codes/country_names_and_code_elements_xml