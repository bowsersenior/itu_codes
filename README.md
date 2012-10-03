# ItuCodes [![Build Status](https://secure.travis-ci.org/bowsersenior/itu_codes.png)](http://travis-ci.org/bowsersenior/itu_codes)

Helper library for telephone country codes based on the official International Telecommunications Union specifications:

* [LIST OF MOBILE COUNTRY OR GEOGRAPHICAL AREA CODES][1]
* [LIST OF ITU-T RECOMMENDATION E.164 ASSIGNED COUNTRY CODES (POSITION ON 1 NOVEMBER 2011)][2]

## Usage:

    ItuCodes.valid_code? 8392813          # => false

    ItuCodes.valid_code? 7                # => true

    ItuCodes.parse_code 1818              # => 1

    ItuCodes.parse_code 822               # => "82"

    ItuCodes.parse_code 4                 # => nil

    ItuCodes.find("France")               # => "33"

    ItuCodes.find("995")                  # => "Georgia"

    ItuCodes.find("Erewhon")              # => nil

    ItuCodes.find("123123995")            # => nil

    # Despite the same 1st digit,
    # these are for different
    # countries ...
    ItuCodes.compatriots? 822, 811        # => false

    # ... but these are for
    # the same country ...
    ItuCodes.compatriots? 122, 111        # => true

    # =====================================================
    # = Using 2-letter ISO country codes is most reliable =
    # =====================================================
    # ... and then there's the
    # North American 'situation' ...
    ItuCodes.compatriots? 1264, 1818      # => false

    # Convert from and to ISO 2-letter country codes:
    ItuCodes.iso2itu('US')                # => "1"

    ItuCodes.itu2iso('1')
    # => ["US", "CA", "AS", "AI", "AG", "BS", "BB", "BM", "KY", "DM", "DO", "GD", "GU", "JM", "MS", "MP", "KN", "LC", "VC", "TT", "TC"]

    # Mexico
    # ISO 3361 code : MX
    # ITU code      : 52
    ItuCodes.iso2itu('MX')                # => "52"

    # Georgia
    # ISO 3361 code : GE
    # ITU code      : 995
    ItuCodes.itu2iso('995')               # => ["GE"]

[1]: http://www.itu.int/itudoc/itu-t/ob-lists/icc/e212_685.pdf
[2]: http://www.itu.int/dms_pub/itu-t/opb/sp/T-SP-E.164D-11-2011-PDF-E.pdf