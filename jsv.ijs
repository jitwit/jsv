coclass 'jsv'

rsep =: LF
csep =: ','
qchr =: '"'

NB. mealy machine for parsing csvs
SA =: a. (e.&> i. 1:)"0 _ SC =: qchr;csep;rsep
SM =: 4 4 2 $ , ". ;. _2 ] 0 : 0
2 1  0 2  0 3  1 1 NB. neutral
0 6  0 2  0 3  1 0 NB. tok, error to see quote
3 0  2 0  2 0  2 0 NB. qtok, quote escapes self
2 0  0 2  0 3  2 0 NB. escq
)

row =: (0;SM;SA)&;:
unq =: (#~ [: -. (2#qchr)&E.)@}.@}: ^: ((2#qchr) -: 0 _1&{)
cln =: unq`''@.(-:&(,csep)) NB. clean field (empty fields parsed as commas)

hdcsv =: row @: ({.~ i.&rsep) NB. get header without parsing the thing
pcsv =: row;._2 NB. doesn't handle when row sep is between quotes
rcsv =: [: ([: cln &.> row);._2 (1!:1)@<@jpath

hdcsv_z_ =: hdcsv_jsv_
pcsv_z_ =: pcsv_jsv_
rcsv_z_ =: rcsv_jsv_
