coclass 'jsv'

'qchr csep rsep'=: mc =: '"';',';LF
ma =: a. (e.&> i. 1:)"0 _ mc
mm =: 4 4 2 $ , ". ;. _2 ] 0 : 0
2 1  0 2  0 3  1 1 NB. limbo
0 6  0 2  0 3  1 0 NB. field
3 0  2 0  2 0  2 0 NB. quoted field, quote escapes self
2 0  0 2  0 3  2 0 NB. escaped quote or end of quoted field
)

unq =: ((#~ [: -. (2#qchr)&E.)@}.@}:) ^: ((2#qchr) -: 0 _1&{)
cln =: unq`{{''}}@.(-:&(,csep))
pcsv =: {{ hd=. cln &.> (0;mm;ma) ;: (j=. y i. rsep){.y
            hd,:((#f)$i.#hd) ([:<(cln;.0)&y)/.,."1 f=.(2;mm;ma);:y=.(1+j)}.y }}
rcsv =: [: pcsv (1!:1)@<@jpath

rcsv_z_ =: rcsv_jsv_
pcsv_z =: pcsv_jsv_
