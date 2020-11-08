load 'jsv.ijs'
coinsert 'jsv'

csv0 =: 0 : 0
"0",1,2,3,"4"
"5",6,7,8,"9"
)

csv1 =: 0 : 0
"ab,cd","efg"
"hi","j""k"
)

NB. how to handle line start with commas
csv2 =: 0 : 0
a,,
b,,
)

cases =: 0 : 0
'bab"a' -: unq '"bab""a"'
'' -: unq '""'
(,'"') -: unq '""""'
'fact"s' -: cln '"fact""s"'
(i. 2 5) -: ". > pcsv csv0
(_2 ]\ 'ab,cd';'efg';'hi';'j"k') -: pcsv csv1
((;:'a b'),.2 2 $ a:) -: pcsv csv2
)

0!:2 cases

