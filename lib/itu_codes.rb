# to-do: deal with headache codes:
# 1 --> Non-US need to be separated by area code
# 7 --> Kazakhstan!
require 'enumerator'
require 'carmen'

# TODO: add ability to search for common names (i.e. 'USA' or 'United States of America' for 'United States')

module ItuCodes
  include Carmen

  # TODO: move the base data into a fixture file to speed up loading
  CODE_LIST = [
    { "0"     =>  "Reserved"},
    
    { "1"     =>  "United States"},
    { "1201"  =>  "United States" },
    { "1202"  =>  "United States" },
    { "1203"  =>  "United States" },
    { "1205"  =>  "United States" },
    { "1206"  =>  "United States" },
    { "1207"  =>  "United States" },
    { "1208"  =>  "United States" },
    { "1209"  =>  "United States" },
    { "1210"  =>  "United States" },
    { "1212"  =>  "United States" },
    { "1213"  =>  "United States" },
    { "1214"  =>  "United States" },
    { "1215"  =>  "United States" },
    { "1216"  =>  "United States" },
    { "1217"  =>  "United States" },
    { "1218"  =>  "United States" },
    { "1219"  =>  "United States" },
    { "1220"  =>  "United States" },
    { "1224"  =>  "United States" },
    { "1225"  =>  "United States" },
    { "1227"  =>  "United States" },
    { "1228"  =>  "United States" },
    { "1229"  =>  "United States" },
    { "1231"  =>  "United States" },
    { "1234"  =>  "United States" },
    { "1239"  =>  "United States" },
    { "1240"  =>  "United States" },
    { "1248"  =>  "United States" },
    { "1251"  =>  "United States" },
    { "1252"  =>  "United States" },
    { "1253"  =>  "United States" },
    { "1254"  =>  "United States" },
    { "1256"  =>  "United States" },
    { "1260"  =>  "United States" },
    { "1262"  =>  "United States" },
    { "1267"  =>  "United States" },
    { "1269"  =>  "United States" },
    { "1270"  =>  "United States" },
    { "1272"  =>  "United States" },
    { "1274"  =>  "United States" },
    { "1276"  =>  "United States" },
    { "1281"  =>  "United States" },
    { "1283"  =>  "United States" },
    { "1301"  =>  "United States" },
    { "1302"  =>  "United States" },
    { "1303"  =>  "United States" },
    { "1304"  =>  "United States" },
    { "1305"  =>  "United States" },
    { "1307"  =>  "United States" },
    { "1308"  =>  "United States" },
    { "1309"  =>  "United States" },
    { "1310"  =>  "United States" },
    { "1312"  =>  "United States" },
    { "1313"  =>  "United States" },
    { "1314"  =>  "United States" },
    { "1315"  =>  "United States" },
    { "1316"  =>  "United States" },
    { "1317"  =>  "United States" },
    { "1318"  =>  "United States" },
    { "1319"  =>  "United States" },
    { "1320"  =>  "United States" },
    { "1321"  =>  "United States" },
    { "1323"  =>  "United States" },
    { "1325"  =>  "United States" },
    { "1327"  =>  "United States" },
    { "1330"  =>  "United States" },
    { "1331"  =>  "United States" },
    { "1334"  =>  "United States" },
    { "1336"  =>  "United States" },
    { "1337"  =>  "United States" },
    { "1339"  =>  "United States" },
    { "1341"  =>  "United States" },
    { "1347"  =>  "United States" },
    { "1351"  =>  "United States" },
    { "1352"  =>  "United States" },
    { "1353"  =>  "United States" },
    { "1360"  =>  "United States" },
    { "1361"  =>  "United States" },
    { "1364"  =>  "United States" },
    { "1369"  =>  "United States" },
    { "1380"  =>  "United States" },
    { "1385"  =>  "United States" },
    { "1386"  =>  "United States" },
    { "1401"  =>  "United States" },
    { "1402"  =>  "United States" },
    { "1404"  =>  "United States" },
    { "1405"  =>  "United States" },
    { "1406"  =>  "United States" },
    { "1407"  =>  "United States" },
    { "1408"  =>  "United States" },
    { "1409"  =>  "United States" },
    { "1410"  =>  "United States" },
    { "1412"  =>  "United States" },
    { "1413"  =>  "United States" },
    { "1414"  =>  "United States" },
    { "1415"  =>  "United States" },
    { "1417"  =>  "United States" },
    { "1419"  =>  "United States" },
    { "1423"  =>  "United States" },
    { "1424"  =>  "United States" },
    { "1425"  =>  "United States" },
    { "1430"  =>  "United States" },
    { "1432"  =>  "United States" },
    { "1434"  =>  "United States" },
    { "1435"  =>  "United States" },
    { "1440"  =>  "United States" },
    { "1442"  =>  "United States" },
    { "1443"  =>  "United States" },
    { "1447"  =>  "United States" },
    { "1458"  =>  "United States" },
    { "1464"  =>  "United States" },
    { "1469"  =>  "United States" },
    { "1470"  =>  "United States" },
    { "1475"  =>  "United States" },
    { "1478"  =>  "United States" },
    { "1479"  =>  "United States" },
    { "1480"  =>  "United States" },
    { "1484"  =>  "United States" },
    { "1501"  =>  "United States" },
    { "1502"  =>  "United States" },
    { "1503"  =>  "United States" },
    { "1504"  =>  "United States" },
    { "1505"  =>  "United States" },
    { "1507"  =>  "United States" },
    { "1508"  =>  "United States" },
    { "1509"  =>  "United States" },
    { "1510"  =>  "United States" },
    { "1512"  =>  "United States" },
    { "1513"  =>  "United States" },
    { "1515"  =>  "United States" },
    { "1516"  =>  "United States" },
    { "1517"  =>  "United States" },
    { "1518"  =>  "United States" },
    { "1520"  =>  "United States" },
    { "1530"  =>  "United States" },
    { "1531"  =>  "United States" },
    { "1534"  =>  "United States" },
    { "1539"  =>  "United States" },
    { "1540"  =>  "United States" },
    { "1541"  =>  "United States" },
    { "1551"  =>  "United States" },
    { "1557"  =>  "United States" },
    { "1559"  =>  "United States" },
    { "1561"  =>  "United States" },
    { "1562"  =>  "United States" },
    { "1563"  =>  "United States" },
    { "1564"  =>  "United States" },
    { "1567"  =>  "United States" },
    { "1570"  =>  "United States" },
    { "1571"  =>  "United States" },
    { "1573"  =>  "United States" },
    { "1574"  =>  "United States" },
    { "1575"  =>  "United States" },
    { "1580"  =>  "United States" },
    { "1582"  =>  "United States" },
    { "1585"  =>  "United States" },
    { "1586"  =>  "United States" },
    { "1601"  =>  "United States" },
    { "1602"  =>  "United States" },
    { "1603"  =>  "United States" },
    { "1605"  =>  "United States" },
    { "1606"  =>  "United States" },
    { "1607"  =>  "United States" },
    { "1608"  =>  "United States" },
    { "1609"  =>  "United States" },
    { "1610"  =>  "United States" },
    { "1612"  =>  "United States" },
    { "1614"  =>  "United States" },
    { "1615"  =>  "United States" },
    { "1616"  =>  "United States" },
    { "1617"  =>  "United States" },
    { "1618"  =>  "United States" },
    { "1619"  =>  "United States" },
    { "1620"  =>  "United States" },
    { "1623"  =>  "United States" },
    { "1626"  =>  "United States" },
    { "1627"  =>  "United States" },
    { "1628"  =>  "United States" },
    { "1630"  =>  "United States" },
    { "1631"  =>  "United States" },
    { "1636"  =>  "United States" },
    { "1641"  =>  "United States" },
    { "1646"  =>  "United States" },
    { "1650"  =>  "United States" },
    { "1651"  =>  "United States" },
    { "1657"  =>  "United States" },
    { "1659"  =>  "United States" },
    { "1660"  =>  "United States" },
    { "1661"  =>  "United States" },
    { "1662"  =>  "United States" },
    { "1667"  =>  "United States" },
    { "1669"  =>  "United States" },
    { "1671"  =>  "United States" },
    { "1678"  =>  "United States" },
    { "1679"  =>  "United States" },
    { "1681"  =>  "United States" },
    { "1682"  =>  "United States" },
    { "1689"  =>  "United States" },
    { "1701"  =>  "United States" },
    { "1702"  =>  "United States" },
    { "1703"  =>  "United States" },
    { "1704"  =>  "United States" },
    { "1706"  =>  "United States" },
    { "1707"  =>  "United States" },
    { "1708"  =>  "United States" },
    { "1710"  =>  "United States" },
    { "1712"  =>  "United States" },
    { "1713"  =>  "United States" },
    { "1714"  =>  "United States" },
    { "1715"  =>  "United States" },
    { "1716"  =>  "United States" },
    { "1717"  =>  "United States" },
    { "1718"  =>  "United States" },
    { "1719"  =>  "United States" },
    { "1720"  =>  "United States" },
    { "1724"  =>  "United States" },
    { "1727"  =>  "United States" },
    { "1730"  =>  "United States" },
    { "1731"  =>  "United States" },
    { "1732"  =>  "United States" },
    { "1734"  =>  "United States" },
    { "1737"  =>  "United States" },
    { "1740"  =>  "United States" },
    { "1747"  =>  "United States" },
    { "1754"  =>  "United States" },
    { "1757"  =>  "United States" },
    { "1760"  =>  "United States" },
    { "1762"  =>  "United States" },
    { "1763"  =>  "United States" },
    { "1764"  =>  "United States" },
    { "1765"  =>  "United States" },
    { "1769"  =>  "United States" },
    { "1770"  =>  "United States" },
    { "1772"  =>  "United States" },
    { "1773"  =>  "United States" },
    { "1774"  =>  "United States" },
    { "1775"  =>  "United States" },
    { "1779"  =>  "United States" },
    { "1781"  =>  "United States" },
    { "1785"  =>  "United States" },
    { "1786"  =>  "United States" },
    { "1801"  =>  "United States" },
    { "1802"  =>  "United States" },
    { "1803"  =>  "United States" },
    { "1804"  =>  "United States" },
    { "1805"  =>  "United States" },
    { "1806"  =>  "United States" },
    { "1808"  =>  "United States" },
    { "1810"  =>  "United States" },
    { "1812"  =>  "United States" },
    { "1813"  =>  "United States" },
    { "1814"  =>  "United States" },
    { "1815"  =>  "United States" },
    { "1816"  =>  "United States" },
    { "1817"  =>  "United States" },
    { "1818"  =>  "United States" },
    { "1828"  =>  "United States" },
    { "1830"  =>  "United States" },
    { "1831"  =>  "United States" },
    { "1832"  =>  "United States" },
    { "1835"  =>  "United States" },
    { "1843"  =>  "United States" },
    { "1845"  =>  "United States" },
    { "1847"  =>  "United States" },
    { "1848"  =>  "United States" },
    { "1850"  =>  "United States" },
    { "1856"  =>  "United States" },
    { "1857"  =>  "United States" },
    { "1858"  =>  "United States" },
    { "1859"  =>  "United States" },
    { "1860"  =>  "United States" },
    { "1862"  =>  "United States" },
    { "1863"  =>  "United States" },
    { "1864"  =>  "United States" },
    { "1865"  =>  "United States" },
    { "1870"  =>  "United States" },
    { "1872"  =>  "United States" },
    { "1878"  =>  "United States" },
    { "1901"  =>  "United States" },
    { "1903"  =>  "United States" },
    { "1904"  =>  "United States" },
    { "1906"  =>  "United States" },
    { "1907"  =>  "United States" },
    { "1908"  =>  "United States" },
    { "1909"  =>  "United States" },
    { "1910"  =>  "United States" },
    { "1912"  =>  "United States" },
    { "1913"  =>  "United States" },
    { "1914"  =>  "United States" },
    { "1915"  =>  "United States" },
    { "1916"  =>  "United States" },
    { "1917"  =>  "United States" },
    { "1918"  =>  "United States" },
    { "1919"  =>  "United States" },
    { "1920"  =>  "United States" },
    { "1925"  =>  "United States" },
    { "1928"  =>  "United States" },
    { "1929"  =>  "United States" },
    { "1931"  =>  "United States" },
    { "1935"  =>  "United States" },
    { "1936"  =>  "United States" },
    { "1937"  =>  "United States" },
    { "1938"  =>  "United States" },
    { "1940"  =>  "United States" },
    { "1941"  =>  "United States" },
    { "1943"  =>  "United States" },
    { "1947"  =>  "United States" },
    { "1949"  =>  "United States" },
    { "1951"  =>  "United States" },
    { "1952"  =>  "United States" },
    { "1954"  =>  "United States" },
    { "1956"  =>  "United States" },
    { "1959"  =>  "United States" },
    { "1970"  =>  "United States" },
    { "1971"  =>  "United States" },
    { "1972"  =>  "United States" },
    { "1973"  =>  "United States" },
    { "1975"  =>  "United States" },
    { "1978"  =>  "United States" },
    { "1979"  =>  "United States" },
    { "1980"  =>  "United States" },
    { "1984"  =>  "United States" },
    { "1985"  =>  "United States" },
    { "1989"  =>  "United States" },

    # from http://www.cnac.ca/co_codes/co_code_status_map.htm
    { "1"     =>   "Canada" },
    { "1204"  =>   "Canada" },
    { "1226"  =>   "Canada" },
    { "1236"  =>   "Canada" },
    { "1249"  =>   "Canada" },
    { "1250"  =>   "Canada" },
    { "1289"  =>   "Canada" },
    { "1306"  =>   "Canada" },
    { "1343"  =>   "Canada" },
    { "1365"  =>   "Canada" },
    { "1403"  =>   "Canada" },
    { "1416"  =>   "Canada" },
    { "1418"  =>   "Canada" },
    { "1431"  =>   "Canada" },
    { "1437"  =>   "Canada" },
    { "1438"  =>   "Canada" },
    { "1450"  =>   "Canada" },
    { "1506"  =>   "Canada" },
    { "1514"  =>   "Canada" },
    { "1519"  =>   "Canada" },
    { "1579"  =>   "Canada" },
    { "1581"  =>   "Canada" },
    { "1587"  =>   "Canada" },
    { "1604"  =>   "Canada" },
    { "1613"  =>   "Canada" },
    { "1639"  =>   "Canada" },
    { "1647"  =>   "Canada" },
    { "1705"  =>   "Canada" },
    { "1709"  =>   "Canada" },
    { "1778"  =>   "Canada" },
    { "1780"  =>   "Canada" },
    { "1807"  =>   "Canada" },
    { "1819"  =>   "Canada" },
    { "1867"  =>   "Canada" },
    { "1873"  =>   "Canada" },
    { "1902"  =>   "Canada" },
    { "1905"  =>   "Canada" },

    { "1"     =>   "American Samoa" },
    { "1684"  =>   "American Samoa" },

    { "1"     =>  "Anguilla" },   
    { "1264"  =>  "Anguilla" },   

    { "1"     =>  "Antigua and Barbuda" },
    { "1268"  =>  "Antigua and Barbuda" },

    { "1"     =>  "Bahamas" },
    { "1242"  =>  "Bahamas" },

    { "1"     =>  "Barbados" },
    { "1246"  =>  "Barbados" },

    { "1"     =>  "Bermuda" },
    { "1441"  =>  "Bermuda" },

    { "1"     =>  "Virgin Islands, British" },
    { "1284"  =>  "Virgin Islands, British" },

    { "1"     =>  "Cayman Islands" },
    { "1345"  =>  "Cayman Islands" },
    
    { "1"     =>  "Dominica" },
    { "1767"  =>  "Dominica" },

    { "1"     =>  "Dominican Republic" },
    { "1809"  =>  "Dominican Republic" },
    { "1829"  =>  "Dominican Republic" },
    { "1849"  =>  "Dominican Republic" },

    { "1"     =>  "Grenada" },
    { "1473"  =>  "Grenada" },

    { "1"     =>  "Guam" },
    { "1671"  =>  "Guam" },

    { "1"     =>  "Jamaica" },
    { "1876"  =>  "Jamaica" },

    { "1"     =>  "Montserrat" },
    { "1664"  =>  "Montserrat" },

    { "1"     =>  "Northern Mariana Islands" },
    { "1670"  =>  "Northern Mariana Islands" },

    { "1"     =>   "Puerto Rico" },
    { "1787"   =>  "Puerto Rico" },
    { "1939"   =>  "Puerto Rico" },

    { "1"     =>  "Saint Kitts and Nevis" },
    { "1869"  =>  "Saint Kitts and Nevis" },

    { "1"     =>  "Saint Lucia" },
    { "1758"  =>  "Saint Lucia" },

    { "1"     =>  "Saint Vincent and the Grenadines" },
    { "1784"  =>  "Saint Vincent and the Grenadines" },

    { "1"     =>  "Trinidad and Tobago" },
    { "1868"  =>  "Trinidad and Tobago" },

    { "1"     =>  "Turks and Caicos Islands" },
    { "1649"  =>  "Turks and Caicos Islands" },

    { "1"     =>  "Virgin Islands, U.S." },
    { "1340"  =>  "Virgin Islands, U.S." },
    
    {"20"     =>      "Egypt"},
    {"210"    =>      "Spare code"},
    {"211"    =>      "Spare code"},
    {"212"    =>      "Morocco"},
    {"213"    =>      "Algeria"},
    {"214"    =>      "Spare code"},
    {"215"    =>      "Spare code"},
    {"216"    =>      "Tunisia"},
    {"217"    =>      "Spare code"},
    {"218"    =>      "Libyan Arab Jamahiriya"},
    {"219"    =>      "Spare code"},
    {"220"    =>      "Gambia"},
    {"221"    =>      "Senegal"},
    {"222"    =>      "Mauritania"},
    {"223"    =>      "Mali"},
    {"224"    =>      "Guinea"},
    {"225"    =>      "Cote D'ivoire"},
    {"226"    =>      "Burkina Faso"},
    {"227"    =>      "Niger"},
    {"228"    =>      "Togo"},
    {"229"    =>      "Benin"},
    {"230"    =>      "Mauritius"},
    {"231"    =>      "Liberia"},
    {"232"    =>      "Sierra Leone"},
    {"233"    =>      "Ghana"},
    {"234"    =>      "Nigeria"},
    {"235"    =>      "Chad"},
    {"236"    =>      "Central African Republic"},
    {"237"    =>      "Cameroon"},
    {"238"    =>      "Cape Verde"},
    {"239"    =>      "Sao Tome and Principe"},
    {"240"    =>      "Equatorial Guinea"},
    {"241"    =>      "Gabon"},
    {"242"    =>      "Congo"},
    {"243"    =>      "Congo, the Democratic Republic of the"},
    {"244"    =>      "Angola"},
    {"245"    =>      "Guinea-Bissau"},
    {"246"    =>      "Diego Garcia"},
    {"247"    =>      "Ascension Island"},
    {"248"    =>      "Seychelles"},
    {"249"    =>      "Sudan"},
    {"250"    =>      "Rwanda"},
    {"251"    =>      "Ethiopia"},
    {"252"    =>      "Somalia"},
    {"253"    =>      "Djibouti"},
    {"254"    =>      "Kenya"},
    {"255"    =>      "Tanzania, United Republic of"},
    {"256"    =>      "Uganda"},
    {"257"    =>      "Burundi"},
    {"258"    =>      "Mozambique"},
    {"259"    =>      "Spare code"},
    {"260"    =>      "Zambia"},
    {"261"    =>      "Madagascar"},
    {"262"    =>      "Reunion"},
    {"263"    =>      "Zimbabwe"},
    {"264"    =>      "Namibia"},
    {"265"    =>      "Malawi"},
    {"266"    =>      "Lesotho"},
    {"267"    =>      "Botswana"},
    {"268"    =>      "Swaziland"},
    {"269"    =>      "Comoros"},
    {"269"    =>      "Mayotte"},
    {"27"     =>      "South Africa"},
    {"280"    =>      "Spare code"},
    {"281"    =>      "Spare code"},
    {"282"    =>      "Spare code"},
    {"283"    =>      "Spare code"},
    {"284"    =>      "Spare code"},
    {"285"    =>      "Spare code"},
    {"286"    =>      "Spare code"},
    {"287"    =>      "Spare code"},
    {"288"    =>      "Spare code"},
    {"289"    =>      "Spare code"},
    {"290"    =>      "Saint Helena"},
    {"291"    =>      "Eritrea"},
    {"292"    =>      "Spare code"},
    {"293"    =>      "Spare code"},
    {"294"    =>      "Spare code"},
    {"295"    =>      "Spare code"},
    {"296"    =>      "Spare code"},
    {"297"    =>      "Aruba"},
    {"298"    =>      "Faroe Islands"},
    {"299"    =>      "Greenland"},
    {"30"     =>      "Greece"},
    {"31"     =>      "Netherlands"},
    {"32"     =>      "Belgium"},
    {"33"     =>      "France"},
    {"34"     =>      "Spain"},
    {"350"    =>      "Gibraltar"},
    {"351"    =>      "Portugal"},
    {"352"    =>      "Luxembourg"},
    {"353"    =>      "Ireland"},
    {"354"    =>      "Iceland"},
    {"355"    =>      "Albania"},
    {"356"    =>      "Malta"},
    {"357"    =>      "Cyprus"},
    {"358"    =>      "Finland"},
    {"359"    =>      "Bulgaria"},
    {"36"     =>      "Hungary"},
    {"370"    =>      "Lithuania"},
    {"371"    =>      "Latvia"},
    {"372"    =>      "Estonia"},
    {"373"    =>      "Moldova, Republic of"},
    {"374"    =>      "Armenia"},
    {"375"    =>      "Belarus"},
    {"376"    =>      "Andorra"},
    {"377"    =>      "Monaco"},
    {"378"    =>      "San Marino"},
    {"379"    =>      "Holy See (Vatican City State)"},
    {"380"    =>      "Ukraine"},
    {"381"    =>      "Serbia and Montenegro"},
    {"382"    =>      "Spare code"},
    {"383"    =>      "Spare code"},
    {"384"    =>      "Spare code"},
    {"385"    =>      "Croatia"},
    {"386"    =>      "Slovenia"},
    {"387"    =>      "Bosnia and Herzegovina"},
    {"388"    =>      "Group of countries, shared code"},
    {"389"    =>      "Macedonia, the Former Yugoslav Republic of"},
    {"39"     =>      "Italy"},
    {"40"     =>      "Romania"},
    {"41"     =>      "Switzerland"},
    {"420"    =>      "Czech Republic"},
    {"421"    =>      "Slovakia"},
    {"422"    =>      "Spare code"},
    {"423"    =>      "Liechtenstein"},
    {"424"    =>      "Spare code"},
    {"425"    =>      "Spare code"},
    {"426"    =>      "Spare code"},
    {"427"    =>      "Spare code"},
    {"428"    =>      "Spare code"},
    {"429"    =>      "Spare code"},
    {"43"     =>      "Austria"},
    {"44"     =>      "United Kingdom"},
    {"45"     =>      "Denmark"},
    {"46"     =>      "Sweden"},
    {"47"     =>      "Norway"},
    {"48"     =>      "Poland"},
    {"49"     =>      "Germany"},
    {"500"    =>      "Falkland Islands"},
    {"501"    =>      "Belize"},
    {"502"    =>      "Guatemala"},
    {"503"    =>      "El Salvador"},
    {"504"    =>      "Honduras"},
    {"505"    =>      "Nicaragua"},
    {"506"    =>      "Costa Rica"},
    {"507"    =>      "Panama"},
    {"508"    =>      "Saint Pierre and Miquelon"},
    {"509"    =>      "Haiti"},
    {"51"     =>      "Peru"},
    {"52"     =>      "Mexico"},
    {"53"     =>      "Cuba"},
    {"54"     =>      "Argentina"},
    {"55"     =>      "Brazil"},
    {"56"     =>      "Chile"},
    {"57"     =>      "Colombia"},
    {"58"     =>      "Venezuela"},
    {"590"    =>      "Guadeloupe"},
    {"591"    =>      "Bolivia"},
    {"592"    =>      "Guyana"},
    {"593"    =>      "Ecuador"},
    {"594"    =>      "French Guiana"},
    {"595"    =>      "Paraguay"},
    {"596"    =>      "Martinique"},
    {"597"    =>      "Suriname"},
    {"598"    =>      "Uruguay"},
    {"599"    =>      "Netherlands Antilles"},
    {"60"     =>      "Malaysia"},
    {"61"     =>      "Australia"},
    {"62"     =>      "Indonesia"},
    {"63"     =>      "Philippines"},
    {"64"     =>      "New Zealand"},
    {"65"     =>      "Singapore"},
    {"66"     =>      "Thailand"},
    {"670"    =>      "Timor-Leste"},
    {"671"    =>      "Spare code"},
    {"672"    =>      "Australian External Territories"},
    {"673"    =>      "Brunei Darussalam"},
    {"674"    =>      "Nauru"},
    {"675"    =>      "Papua New Guinea"},
    {"676"    =>      "Tonga"},
    {"677"    =>      "Solomon Islands"},
    {"678"    =>      "Vanuatu"},
    {"679"    =>      "Fiji"},
    {"680"    =>      "Palau"},
    {"681"    =>      "Wallis and Futuna"},
    {"682"    =>      "Cook Islands"},
    {"683"    =>      "Niue"},
    {"684"    =>      "Spare code"},
    {"685"    =>      "Samoa"},
    {"686"    =>      "Kiribati"},
    {"687"    =>      "New Caledonia"},
    {"688"    =>      "Tuvalu"},
    {"689"    =>      "French Polynesia"},
    {"690"    =>      "Tokelau"},
    {"691"    =>      "Micronesia, Federated States of"},
    {"692"    =>      "Marshall Islands"},
    {"693"    =>      "Spare code"},
    {"694"    =>      "Spare code"},
    {"695"    =>      "Spare code"},
    {"696"    =>      "Spare code"},
    {"697"    =>      "Spare code"},
    {"698"    =>      "Spare code"},
    {"699"    =>      "Spare code"},

    {"7"      =>      "Russian Federation"},
    {"7"      =>      "Kazakhstan"},
    
    {"800"    =>      "International Freephone Service"},
    {"801"    =>      "Spare code"},
    {"802"    =>      "Spare code"},
    {"803"    =>      "Spare code"},
    {"804"    =>      "Spare code"},
    {"805"    =>      "Spare code"},
    {"806"    =>      "Spare code"},
    {"807"    =>      "Spare code"},
    {"808"    =>      "International Shared Cost Service"},
    {"809"    =>      "Spare code"},
    {"81"     =>      "Japan"},
    {"82"     =>      "Korea, Republic of"},
    {"830"    =>      "Spare code"},
    {"831"    =>      "Spare code"},
    {"832"    =>      "Spare code"},
    {"833"    =>      "Spare code"},
    {"834"    =>      "Spare code"},
    {"835"    =>      "Spare code"},
    {"836"    =>      "Spare code"},
    {"837"    =>      "Spare code"},
    {"838"    =>      "Spare code"},
    {"839"    =>      "Spare code"},
    {"84"     =>      "Viet Nam"},
    {"850"    =>      "Korea, Democratic People's Republic of"},
    {"851"    =>      "Spare code"},
    {"852"    =>      "Hong Kong"},
    {"853"    =>      "Macao"},
    {"854"    =>      "Spare code"},
    {"855"    =>      "Cambodia"},
    {"856"    =>      "Lao People's Democratic Republic"},
    {"857"    =>      "Spare code"},
    {"858"    =>      "Spare code"},
    {"859"    =>      "Spare code"},
    {"86"     =>      "China"},
    {"870"    =>      "Inmarsat SNAC"},
    {"871"    =>      "Inmarsat"},
    {"872"    =>      "Inmarsat"},
    {"873"    =>      "Inmarsat"},
    {"874"    =>      "Inmarsat"},
    {"875"    =>      "Reserved - Maritime Mobile Service Applications"},
    {"876"    =>      "Reserved - Maritime Mobile Service Applications"},
    {"877"    =>      "Reserved - Maritime Mobile Service Applications"},
    {"878"    =>      "Universal Personal Telecommunication Service"},
    {"879"    =>      "Reserved for national non-commercial purposes"},
    {"880"    =>      "Bangladesh"},
    {"881"    =>      "International Mobile, shared code"},
    {"882"    =>      "International Networks, shared code"},
    {"883"    =>      "Spare code"},
    {"884"    =>      "Spare code"},
    {"885"    =>      "Spare code"},
    {"886"    =>      "Reserved"},
    {"887"    =>      "Spare code"},
    {"888"    =>      "Reserved for future global service"},
    {"889"    =>      "Spare code"},
    {"890"    =>      "Spare code"},
    {"891"    =>      "Spare code"},
    {"892"    =>      "Spare code"},
    {"893"    =>      "Spare code"},
    {"894"    =>      "Spare code"},
    {"895"    =>      "Spare code"},
    {"896"    =>      "Spare code"},
    {"897"    =>      "Spare code"},
    {"898"    =>      "Spare code"},
    {"899"    =>      "Spare code"},
    {"90"     =>      "Turkey"},
    {"91"     =>      "India"},
    {"92"     =>      "Pakistan"},
    {"93"     =>      "Afghanistan"},
    {"94"     =>      "Sri Lanka"},
    {"95"     =>      "Myanmar"},
    {"960"    =>      "Maldives"},
    {"961"    =>      "Lebanon"},
    {"962"    =>      "Jordan"},
    {"963"    =>      "Syrian Arab Republic"},
    {"964"    =>      "Iraq"},
    {"965"    =>      "Kuwait"},
    {"966"    =>      "Saudi Arabia"},
    {"967"    =>      "Yemen"},
    {"968"    =>      "Oman"},
    {"969"    =>      "Reserved - reservation currently under investigation"},
    {"970"    =>      "Reserved"},
    {"971"    =>      "United Arab Emirates"},
    {"972"    =>      "Israel"},
    {"973"    =>      "Bahrain"},
    {"974"    =>      "Qatar"},
    {"975"    =>      "Bhutan"},
    {"976"    =>      "Mongolia"},
    {"977"    =>      "Nepal"},
    {"978"    =>      "Spare code"},
    {"979"    =>      "International Premium Rate Service"},
    {"98"     =>      "Iran, Islamic Republic of"},
    {"990"    =>      "Spare code"},
    {"991"    =>      "Trial of a proposed new international telecommunication public correspondence"},
    {"992"    =>      "Tajikistan"},
    {"993"    =>      "Turkmenistan"},
    {"994"    =>      "Azerbaijan"},
    {"995"    =>      "Georgia"}
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
  def self.iso2itu(iso_code)
    [ItuCodes.find_by_name( Carmen::country_name(iso_code) )].flatten.reject do |c|   
      north_american?(c) and c.length > 1
    end.shift rescue nil
  end
  
  # this is tricky for North American destinations: '1' can be the US, Canada or another country
  def self.itu2iso(itu_code)
    ItuCodes.lookup(itu_code).map do |country|
      Carmen::country_code( country ) rescue nil
    end.compact
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
  #   ex:  parse_code(1818) =>  1
  def self.parse_code(some_code)
    some_code = clean(some_code)
    sub_index = (1..some_code.length).find do |len|
      valid_code? some_code[0,len]
    end
    some_code[0,sub_index] unless sub_index.nil?
  end
  
  # parse a destination code (probably with area code) to find the number without the ITU code
  #   ex:  parse_number(18184443322) => 8184443322
  def self.parse_number(some_code)
    some_code = clean(some_code)
    sub_index = (1..some_code.length).find do |len|
      valid_code? some_code[0,len]
    end
    some_code[sub_index,some_code.length - sub_index] unless sub_index.nil?
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
  
  def self.us?(some_code)
    some_code = some_code.to_s
    countries = lookup(some_code[0,4])
    north_american?(some_code) and (countries.include?('United States'))
  end

  def self.canadian?(some_code)
    some_code = some_code.to_s
    countries = lookup(some_code[0,4])
    north_american?(some_code) and (countries.include?('Canada'))
  end

  # converts input to string, then strips any non-numeric characters
  def self.clean(input)
    input.to_s.gsub(/[^0-9]/, '')
  end
end
