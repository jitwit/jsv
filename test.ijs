load 'jsv.ijs tables/csv'
coinsert 'jsv'

NB. tables/csv raw comparison:
pdsv =: (',';'""')&fixdsv

NB. 100MB csv:
eg =: '~/code/city-trees/arbres/montréal/arbres-publics.csv'
NB. csv =: rcsv eg

csv0 =: 0 : 0
"0",1,2,3,"4"
"5",6,7,8,"9"
)

csv1 =: 0 : 0
"ab,cd","efg"
"hi","j""k"
)

csv2 =: 0 : 0
a,,
b,,
)

NB. how to handle row starting with commas in ;:?
csv3 =: 0 : 0
,a,b
,,
)

csv4 =: 0 : 0
"Name","Province"
"1","2"
"",""
)

NB. https://github.com/maxogden/csv-spectrum/tree/master/csvs
csv00 =: 0 : 0
first,last,address,city,zip
John,Doe,120 any st.,"Anytown, WW",08123
)

csv01 =: 0 : 0
a,b,c
1,"",""
2,3,4
)

csv02 =: 0 : 0
a,b
1,"ha ""ha"" ha"
3,4
)

csv03 =: 0 : 0
key,val
1,"{""type"": ""Point"", ""coordinates"": [102.0, 0.5]}"
)

csv04 =: 0 : 0
a,b,c
1,2,3
"Once upon 
a time",5,6
7,8,9
)

csv05 =: 0 : 0
a,b
1,"ha 
""ha"" 
ha"
3,4
)

csv06 =: 0 : 0
a,b,c
1,2,3
)

csv07 =: 0 : 0
a,b,c
1,2,3
4,5,ʤ
)
NB. https://tools.ietf.org/html/rfc4180#section-2
cases =: 0 : 0
'bab"a' -: unq '"bab""a"'
'' -: unq '""'
(,'"') -: unq '""""'
NB. fix unq logic: '""' -: unq '""""""'
NB. fix row start with empty field: 2 3 -: $ csv csv3
'fact"s' -: cln '"fact""s"'
1 5 -: ((#@(1 0&{::)),(#@{.)) pcsv csv00
2 3 -: ((#@(1 0&{::)),(#@{.)) pcsv csv01
2 3 -: ((#@(1 0&{::)),(#@{.)) pcsv csv01
2 2 -: ((#@(1 0&{::)),(#@{.)) pcsv csv02
1 2 -: ((#@(1 0&{::)),(#@{.)) pcsv csv03
3 3 -: ((#@(1 0&{::)),(#@{.)) pcsv csv04
2 2 -: ((#@(1 0&{::)),(#@{.)) pcsv csv05
1 3 -: ((#@(1 0&{::)),(#@{.)) pcsv csv06
2 3 -: ((#@(1 0&{::)),(#@{.)) pcsv csv07
)

0!:2 cases
pcsv csv4
datatype strip 1!:1 < '../J-esquisse/Stations.csv'
