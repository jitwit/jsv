coclass 'jsv'

NB. mealy machine for csvs
'qchr csep rsep'=: mc =: '"';',';LF
ma =: a. (e.&> i. 1:)"0 _ mc
mm =: 4 4 2 $ , ". ;. _2 ] 0 : 0
2 1  0 2  0 3  1 1 NB. limbo
0 6  0 2  0 3  1 0 NB. field
3 0  2 0  2 0  2 0 NB. quoted field, quote escapes self
2 0  0 2  0 3  2 0 NB. escaped quote or end of quoted field
)
row =: (0;mm;ma)&;:
reshp =: ,$~$,1:

unq =: ((#~ [: -. (2#qchr)&E.)@}.@}:) ^: ((2#qchr) -: 0 _1&{)
cln =: unq`{{''}}@.(-:&(,csep)) NB. clean field (empty fields parsed as commas)
rsinq =: [: +./ (LF&=) *. [: (+. ~:/\) ('"'&=) NB. rsep between quoted field?

header =: row @: ({.~ i.&rsep)
NB. still assumes header doesn't have rsep in quotes...
csv =: {{((#f)$i.#header y)([:<(];.0)&y)/.,."1 f=.(2;mm;ma);:y}}
rcsv =: [: csv (1!:1)@<@jpath
csvo =: (([:cln &.> row);._2)`(-@#@header ([: cln&.>])\ row)@.rsinq

rowsz_z_ =: rowsz_jsv_
header_z_ =: header_jsv_
rcsv_z_ =: rcsv_jsv_
csv_z_ =: csv_jsv_
