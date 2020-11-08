load 'jsv.ijs tables/csv' NB. to compare with existing J library for now
coinsert 'jsv'

NB. tables/csv raw comparison:
pdsv =: (',';'""')&fixdsv

NB. 100MB csv:
NB. eg =: 1!:1 < jpath '~/code/city-trees/arbres/montréal/arbres-publics.csv'
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
(i. 2 5) -: ". > csv csv0
(_2 ]\ 'ab,cd';'efg';'hi';'j"k') -: csv csv1
((;:'a b'),.2 2 $ a:) -: csv csv2
2 5 -: $ csv csv00
3 3 -: $ csv csv01
3 2 -: $ csv csv02
2 2 -: $ csv csv03
4 3 -: $ csv csv04
3 2 -: $ csv csv05
2 3 -: $ csv csv06
3 3 -: $ csv csv07
)

0!:2 cases
