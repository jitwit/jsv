coclass 'jsv'
NB. https://en.wikipedia.org/wiki/Byte_order_mark
bomnoun =: 0 : 0
239 187 191      NB. utf-8
254 255          NB. utf-16 be
255 254          NB. utf-16 le
0 0 254 255      NB. utf-32 be
255 254 0 0      NB. utf-32 le
43 47 118        NB. utf-7
247 100 76       NB. utf-1
221 115 102 115  NB. utf-ebcdic
14 254 255       NB. scsu
251 238 40       NB. bocu-1
132 49 149 51    NB. gb-1830
)
bom =: (#~ ([: *./ 0 ~: >)"0) (0&".) &.> ;: bomnoun
matchbom =: {{ (y {.~ #x) -: u: x=.>x }}"0 _
NB. 7 u: to keep literal if possible
stripbom =: {{if. #bm=.I.bom matchbom y do. 7 u: y}.~#bm{::bom else. y end.}}
NB. how to deal with input that is unicode? seems to give domain error...
'qchr csep rsep'=: '"';',';LF NB. char classes
ma =: a. (e.&> i. 1:)"0 _ qchr;csep;rsep NB. alphabet -> char class
mm =: 4 4 2 $ , ". ;. _2 ] 0 : 0
2 1  0 2  0 3  1 1 NB. limbo
0 6  0 2  0 3  1 0 NB. field
3 0  2 0  2 0  2 0 NB. quoted field, quote escapes self
2 0  0 2  0 3  2 0 NB. escaped quote or end of quoted field
)
unq =: ((#~ [: -. (2#qchr)&E.)@}.@}:) ^: ((2#qchr) -: 0 _1&{)
cln =: unq`(0&{.)@.(-:&(,csep))
create =: 3 : 0
  if. #y do.
    assert. (1 1 -: #&>y) *. 2=#y
    'csep qchr' =: y
    NB. recalculate alphabet -> char class
    ma =: a. (e.&> i. 1:)"0 _ qchr;csep;rsep
  end.
)
import =: 3 : 0
 table =: pcsv y
 for_c. {. y do.
   d =. (1,c_index) {:: y
   ". (>c),' =: d'
 end.
)
rcsv =: [: pcsv 1!:1@<@jpath
pcsv =: 3 : 0
  hd=. cln &.> (0;mm;ma) ;: (j=. y i. rsep){.y =. stripbom y
  hd,:((#fs)$i.#hd) ([:<(cln;.0)&y)/.,."1 fs=.(2;mm;ma);:y=.(1+j)}.y
)
rcsv_z_ =: rcsv_jsv_ NB. read from file
pcsv_z_ =: pcsv_jsv_ NB. read from bytes
