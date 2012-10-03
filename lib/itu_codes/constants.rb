module ItuCodes
  module Constants

    ASSIGNED_COUNTRY_CODES = {
      "0"     =>  "Reserved",

      "1"     =>  [ "United States",
                      "Canada",
                      "American Samoa",
                      "Anguilla" ,
                      "Antigua and Barbuda" ,
                      "Bahamas" ,
                      "Barbados" ,
                      "Bermuda" ,
                      "Virgin Islands, British" ,
                      "Cayman Islands" ,
                      "Dominica" ,
                      "Dominican Republic" ,
                      "Grenada" ,
                      "Guam" ,
                      "Jamaica" ,
                      "Montserrat" ,
                      "Northern Mariana Islands" ,
                      "Puerto Rico" ,
                      "Saint Kitts and Nevis" ,
                      "Saint Lucia" ,
                      "Saint Vincent and the Grenadines" ,
                      "Trinidad and Tobago" ,
                      "Turks and Caicos Islands" ,
                      "Virgin Islands, U.S."
                     ],

      "20"     =>      "Egypt",
      "210"    =>      "Spare code",
      "211"    =>      "Spare code",
      "212"    =>      "Morocco",
      "213"    =>      "Algeria",
      "214"    =>      "Spare code",
      "215"    =>      "Spare code",
      "216"    =>      "Tunisia",
      "217"    =>      "Spare code",
      "218"    =>      "Libyan Arab Jamahiriya",
      "219"    =>      "Spare code",
      "220"    =>      "Gambia",
      "221"    =>      "Senegal",
      "222"    =>      "Mauritania",
      "223"    =>      "Mali",
      "224"    =>      "Guinea",
      "225"    =>      "Cote D'ivoire",
      "226"    =>      "Burkina Faso",
      "227"    =>      "Niger",
      "228"    =>      "Togo",
      "229"    =>      "Benin",
      "230"    =>      "Mauritius",
      "231"    =>      "Liberia",
      "232"    =>      "Sierra Leone",
      "233"    =>      "Ghana",
      "234"    =>      "Nigeria",
      "235"    =>      "Chad",
      "236"    =>      "Central African Republic",
      "237"    =>      "Cameroon",
      "238"    =>      "Cape Verde",
      "239"    =>      "Sao Tome and Principe",
      "240"    =>      "Equatorial Guinea",
      "241"    =>      "Gabon",
      "242"    =>      "Congo",
      "243"    =>      "Congo, the Democratic Republic of the",
      "244"    =>      "Angola",
      "245"    =>      "Guinea-Bissau",
      "246"    =>      "Diego Garcia",
      "247"    =>      "Ascension Island",
      "248"    =>      "Seychelles",
      "249"    =>      "Sudan",
      "250"    =>      "Rwanda",
      "251"    =>      "Ethiopia",
      "252"    =>      "Somalia",
      "253"    =>      "Djibouti",
      "254"    =>      "Kenya",
      "255"    =>      "Tanzania, United Republic of",
      "256"    =>      "Uganda",
      "257"    =>      "Burundi",
      "258"    =>      "Mozambique",
      "259"    =>      "Spare code",
      "260"    =>      "Zambia",
      "261"    =>      "Madagascar",
      "262"    =>      "Reunion",
      "263"    =>      "Zimbabwe",
      "264"    =>      "Namibia",
      "265"    =>      "Malawi",
      "266"    =>      "Lesotho",
      "267"    =>      "Botswana",
      "268"    =>      "Swaziland",
      "269"    =>      "Comoros",
      "269"    =>      "Mayotte",
      "27"     =>      "South Africa",
      "280"    =>      "Spare code",
      "281"    =>      "Spare code",
      "282"    =>      "Spare code",
      "283"    =>      "Spare code",
      "284"    =>      "Spare code",
      "285"    =>      "Spare code",
      "286"    =>      "Spare code",
      "287"    =>      "Spare code",
      "288"    =>      "Spare code",
      "289"    =>      "Spare code",
      "290"    =>      "Saint Helena",
      "291"    =>      "Eritrea",
      "292"    =>      "Spare code",
      "293"    =>      "Spare code",
      "294"    =>      "Spare code",
      "295"    =>      "Spare code",
      "296"    =>      "Spare code",
      "297"    =>      "Aruba",
      "298"    =>      "Faroe Islands",
      "299"    =>      "Greenland",
      "30"     =>      "Greece",
      "31"     =>      "Netherlands",
      "32"     =>      "Belgium",
      "33"     =>      "France",
      "34"     =>      "Spain",
      "350"    =>      "Gibraltar",
      "351"    =>      "Portugal",
      "352"    =>      "Luxembourg",
      "353"    =>      "Ireland",
      "354"    =>      "Iceland",
      "355"    =>      "Albania",
      "356"    =>      "Malta",
      "357"    =>      "Cyprus",
      "358"    =>      "Finland",
      "359"    =>      "Bulgaria",
      "36"     =>      "Hungary",
      "370"    =>      "Lithuania",
      "371"    =>      "Latvia",
      "372"    =>      "Estonia",
      "373"    =>      "Moldova, Republic of",
      "374"    =>      "Armenia",
      "375"    =>      "Belarus",
      "376"    =>      "Andorra",
      "377"    =>      "Monaco",
      "378"    =>      "San Marino",
      "379"    =>      "Holy See (Vatican City State)",
      "380"    =>      "Ukraine",
      "381"    =>      "Serbia and Montenegro",
      "382"    =>      "Spare code",
      "383"    =>      "Spare code",
      "384"    =>      "Spare code",
      "385"    =>      "Croatia",
      "386"    =>      "Slovenia",
      "387"    =>      "Bosnia and Herzegovina",
      "388"    =>      "Group of countries, shared code",
      "389"    =>      "Macedonia, the Former Yugoslav Republic of",
      "39"     =>      "Italy",
      "40"     =>      "Romania",
      "41"     =>      "Switzerland",
      "420"    =>      "Czech Republic",
      "421"    =>      "Slovakia",
      "422"    =>      "Spare code",
      "423"    =>      "Liechtenstein",
      "424"    =>      "Spare code",
      "425"    =>      "Spare code",
      "426"    =>      "Spare code",
      "427"    =>      "Spare code",
      "428"    =>      "Spare code",
      "429"    =>      "Spare code",
      "43"     =>      "Austria",
      "44"     =>      "United Kingdom",
      "45"     =>      "Denmark",
      "46"     =>      "Sweden",
      "47"     =>      "Norway",
      "48"     =>      "Poland",
      "49"     =>      "Germany",
      "500"    =>      "Falkland Islands",
      "501"    =>      "Belize",
      "502"    =>      "Guatemala",
      "503"    =>      "El Salvador",
      "504"    =>      "Honduras",
      "505"    =>      "Nicaragua",
      "506"    =>      "Costa Rica",
      "507"    =>      "Panama",
      "508"    =>      "Saint Pierre and Miquelon",
      "509"    =>      "Haiti",
      "51"     =>      "Peru",
      "52"     =>      "Mexico",
      "53"     =>      "Cuba",
      "54"     =>      "Argentina",
      "55"     =>      "Brazil",
      "56"     =>      "Chile",
      "57"     =>      "Colombia",
      "58"     =>      "Venezuela",
      "590"    =>      "Guadeloupe",
      "591"    =>      "Bolivia",
      "592"    =>      "Guyana",
      "593"    =>      "Ecuador",
      "594"    =>      "French Guiana",
      "595"    =>      "Paraguay",
      "596"    =>      "Martinique",
      "597"    =>      "Suriname",
      "598"    =>      "Uruguay",
      "599"    =>      "Netherlands Antilles",
      "60"     =>      "Malaysia",
      "61"     =>      "Australia",
      "62"     =>      "Indonesia",
      "63"     =>      "Philippines",
      "64"     =>      "New Zealand",
      "65"     =>      "Singapore",
      "66"     =>      "Thailand",
      "670"    =>      "Timor-Leste",
      "671"    =>      "Spare code",
      "672"    =>      "Australian External Territories",
      "673"    =>      "Brunei Darussalam",
      "674"    =>      "Nauru",
      "675"    =>      "Papua New Guinea",
      "676"    =>      "Tonga",
      "677"    =>      "Solomon Islands",
      "678"    =>      "Vanuatu",
      "679"    =>      "Fiji",
      "680"    =>      "Palau",
      "681"    =>      "Wallis and Futuna",
      "682"    =>      "Cook Islands",
      "683"    =>      "Niue",
      "684"    =>      "Spare code",
      "685"    =>      "Samoa",
      "686"    =>      "Kiribati",
      "687"    =>      "New Caledonia",
      "688"    =>      "Tuvalu",
      "689"    =>      "French Polynesia",
      "690"    =>      "Tokelau",
      "691"    =>      "Micronesia, Federated States of",
      "692"    =>      "Marshall Islands",
      "693"    =>      "Spare code",
      "694"    =>      "Spare code",
      "695"    =>      "Spare code",
      "696"    =>      "Spare code",
      "697"    =>      "Spare code",
      "698"    =>      "Spare code",
      "699"    =>      "Spare code",

      "7"      =>      [ "Russian Federation", "Kazakhstan" ],
      "76"     =>      "Kazakhstan",
      "77"     =>      "Kazakhstan",

      "800"    =>      "International Freephone Service",
      "801"    =>      "Spare code",
      "802"    =>      "Spare code",
      "803"    =>      "Spare code",
      "804"    =>      "Spare code",
      "805"    =>      "Spare code",
      "806"    =>      "Spare code",
      "807"    =>      "Spare code",
      "808"    =>      "International Shared Cost Service",
      "809"    =>      "Spare code",
      "81"     =>      "Japan",
      "82"     =>      "Korea, Republic of",
      "830"    =>      "Spare code",
      "831"    =>      "Spare code",
      "832"    =>      "Spare code",
      "833"    =>      "Spare code",
      "834"    =>      "Spare code",
      "835"    =>      "Spare code",
      "836"    =>      "Spare code",
      "837"    =>      "Spare code",
      "838"    =>      "Spare code",
      "839"    =>      "Spare code",
      "84"     =>      "Viet Nam",
      "850"    =>      "Korea, Democratic People's Republic of",
      "851"    =>      "Spare code",
      "852"    =>      "Hong Kong",
      "853"    =>      "Macao",
      "854"    =>      "Spare code",
      "855"    =>      "Cambodia",
      "856"    =>      "Lao People's Democratic Republic",
      "857"    =>      "Spare code",
      "858"    =>      "Spare code",
      "859"    =>      "Spare code",
      "86"     =>      "China",
      "870"    =>      "Inmarsat SNAC",
      "871"    =>      "Inmarsat",
      "872"    =>      "Inmarsat",
      "873"    =>      "Inmarsat",
      "874"    =>      "Inmarsat",
      "875"    =>      "Reserved - Maritime Mobile Service Applications",
      "876"    =>      "Reserved - Maritime Mobile Service Applications",
      "877"    =>      "Reserved - Maritime Mobile Service Applications",
      "878"    =>      "Universal Personal Telecommunication Service",
      "879"    =>      "Reserved for national non-commercial purposes",
      "880"    =>      "Bangladesh",
      "881"    =>      "International Mobile, shared code",
      "882"    =>      "International Networks, shared code",
      "883"    =>      "Spare code",
      "884"    =>      "Spare code",
      "885"    =>      "Spare code",
      "886"    =>      "Reserved",
      "887"    =>      "Spare code",
      "888"    =>      "Reserved for future global service",
      "889"    =>      "Spare code",
      "890"    =>      "Spare code",
      "891"    =>      "Spare code",
      "892"    =>      "Spare code",
      "893"    =>      "Spare code",
      "894"    =>      "Spare code",
      "895"    =>      "Spare code",
      "896"    =>      "Spare code",
      "897"    =>      "Spare code",
      "898"    =>      "Spare code",
      "899"    =>      "Spare code",
      "90"     =>      "Turkey",
      "91"     =>      "India",
      "92"     =>      "Pakistan",
      "93"     =>      "Afghanistan",
      "94"     =>      "Sri Lanka",
      "95"     =>      "Myanmar",
      "960"    =>      "Maldives",
      "961"    =>      "Lebanon",
      "962"    =>      "Jordan",
      "963"    =>      "Syrian Arab Republic",
      "964"    =>      "Iraq",
      "965"    =>      "Kuwait",
      "966"    =>      "Saudi Arabia",
      "967"    =>      "Yemen",
      "968"    =>      "Oman",
      "969"    =>      "Reserved - reservation currently under investigation",
      "970"    =>      "Reserved",
      "971"    =>      "United Arab Emirates",
      "972"    =>      "Israel",
      "973"    =>      "Bahrain",
      "974"    =>      "Qatar",
      "975"    =>      "Bhutan",
      "976"    =>      "Mongolia",
      "977"    =>      "Nepal",
      "978"    =>      "Spare code",
      "979"    =>      "International Premium Rate Service",
      "98"     =>      "Iran, Islamic Republic of",
      "990"    =>      "Spare code",
      "991"    =>      "Trial of a proposed new international telecommunication public correspondence",
      "992"    =>      "Tajikistan",
      "993"    =>      "Turkmenistan",
      "994"    =>      "Azerbaijan",
      "995"    =>      "Georgia"
    }

    NORTH_AMERICAN_AREA_CODES = {
      "United States" => %w(
        1201
        1202
        1203
        1205
        1206
        1207
        1208
        1209
        1210
        1212
        1213
        1214
        1215
        1216
        1217
        1218
        1219
        1220
        1224
        1225
        1227
        1228
        1229
        1231
        1234
        1239
        1240
        1248
        1251
        1252
        1253
        1254
        1256
        1260
        1262
        1267
        1269
        1270
        1272
        1274
        1276
        1281
        1283
        1301
        1302
        1303
        1304
        1305
        1307
        1308
        1309
        1310
        1312
        1313
        1314
        1315
        1316
        1317
        1318
        1319
        1320
        1321
        1323
        1325
        1327
        1330
        1331
        1334
        1336
        1337
        1339
        1341
        1347
        1351
        1352
        1353
        1360
        1361
        1364
        1369
        1380
        1385
        1386
        1401
        1402
        1404
        1405
        1406
        1407
        1408
        1409
        1410
        1412
        1413
        1414
        1415
        1417
        1419
        1423
        1424
        1425
        1430
        1432
        1434
        1435
        1440
        1442
        1443
        1447
        1458
        1464
        1469
        1470
        1475
        1478
        1479
        1480
        1484
        1501
        1502
        1503
        1504
        1505
        1507
        1508
        1509
        1510
        1512
        1513
        1515
        1516
        1517
        1518
        1520
        1530
        1531
        1534
        1539
        1540
        1541
        1551
        1557
        1559
        1561
        1562
        1563
        1564
        1567
        1570
        1571
        1573
        1574
        1575
        1580
        1582
        1585
        1586
        1601
        1602
        1603
        1605
        1606
        1607
        1608
        1609
        1610
        1612
        1614
        1615
        1616
        1617
        1618
        1619
        1620
        1623
        1626
        1627
        1628
        1630
        1631
        1636
        1641
        1646
        1650
        1651
        1657
        1659
        1660
        1661
        1662
        1667
        1669
        1678
        1679
        1681
        1682
        1689
        1701
        1702
        1703
        1704
        1706
        1707
        1708
        1710
        1712
        1713
        1714
        1715
        1716
        1717
        1718
        1719
        1720
        1724
        1727
        1730
        1731
        1732
        1734
        1737
        1740
        1747
        1754
        1757
        1760
        1762
        1763
        1764
        1765
        1769
        1770
        1772
        1773
        1774
        1775
        1779
        1781
        1785
        1786
        1801
        1802
        1803
        1804
        1805
        1806
        1808
        1810
        1812
        1813
        1814
        1815
        1816
        1817
        1818
        1828
        1830
        1831
        1832
        1835
        1843
        1845
        1847
        1848
        1850
        1856
        1857
        1858
        1859
        1860
        1862
        1863
        1864
        1865
        1870
        1872
        1878
        1901
        1903
        1904
        1906
        1907
        1908
        1909
        1910
        1912
        1913
        1914
        1915
        1916
        1917
        1918
        1919
        1920
        1925
        1928
        1929
        1931
        1935
        1936
        1937
        1938
        1940
        1941
        1943
        1947
        1949
        1951
        1952
        1954
        1956
        1959
        1970
        1971
        1972
        1973
        1975
        1978
        1979
        1980
        1984
        1985
        1989
      ),

      # from http://www.cnac.ca/co_codes/co_code_status_map.htm
      "Canada"  => %w(
        1204
        1226
        1236
        1249
        1250
        1289
        1306
        1343
        1365
        1403
        1416
        1418
        1431
        1437
        1438
        1450
        1506
        1514
        1519
        1579
        1581
        1587
        1604
        1613
        1639
        1647
        1705
        1709
        1778
        1780
        1807
        1819
        1867
        1873
        1902
        1905
      ),

      "American Samoa"                   => "1684",
      "Anguilla"                         => "1264",
      "Antigua and Barbuda"              => "1268",
      "Bahamas"                          => "1242",
      "Barbados"                         => "1246",
      "Bermuda"                          => "1441",
      "Virgin Islands, British"          => "1284",
      "Cayman Islands"                   => "1345",
      "Dominica"                         => "1767",
      "Dominican Republic"               => %w(
        1809
        1829
        1849
      ),
      "Grenada"                          => "1473",
      "Guam"                             => "1671",
      "Jamaica"                          => "1876",
      "Montserrat"                       => "1664",
      "Northern Mariana Islands"         => "1670",
      "Puerto Rico"                      => %w(
        1787
        1939
      ),
      "Saint Kitts and Nevis"            => "1869",
      "Saint Lucia"                      => "1758",
      "Saint Vincent and the Grenadines" => "1784",
      "Trinidad and Tobago"              => "1868",
      "Turks and Caicos Islands"         => "1649",
      "Virgin Islands, U.S."             => "1340"
    }
  end
end
