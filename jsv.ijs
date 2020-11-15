coclass 'jsv'
mm =: 4 4 2 $ , ". ;. _2 ] 0 : 0
2 1  0 2  0 3  1 1 NB. limbo
0 6  0 2  0 3  1 0 NB. field
3 0  2 0  2 0  2 0 NB. quoted field, quote escapes self
2 0  0 2  0 3  2 0 NB. escaped quote or end of quoted field
)
BOM =: 239 187 191 { a.
'qchr csep rsep'=: mc =: '"';',';LF
unq =: ((#~ [: -. (2#qchr)&E.)@}.@}:) ^: ((2#qchr) -: 0 _1&{)
cln =: unq`(0&{.)@.(-:&(,csep))
ma =: a. (e.&> i. 1:)"0 _ mc
rcsv =: [: pcsv 1!:1@<@jpath
pcsv =: 3 : 0
  if. BOM -: 3 {. y do. y =. 3 }. y end.
  hd=. cln &.> (0;mm;ma) ;: (j=. y i. rsep){.y
  hd,:((#fs)$i.#hd) ([:<(cln;.0)&y)/.,."1 fs=.(2;mm;ma);:y=.(1+j)}.y
)
pcol_z_ =: pcol_jsv_
rcsv_z_ =: rcsv_jsv_
pcsv_z_ =: pcsv_jsv_
