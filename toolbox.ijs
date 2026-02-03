is_ascending =: 3 :'*/(_,~}.t)>t'
fib =: 3 :'{:"1+/\@|.^:(i.y) 0 1'
tot =: 3 :'y * */ (1 - 1 % ~. q: y)'
capitalize =: 3 :0
a =. 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', a.
sel =. 26 > a i."(1 0) y
idx =. (a i."(1 0) y) + sel * 26
idx { a
)

NB. Find all lexicographical permutations of a string
NB. Called with "string {~ lex layer^:(<:n) i.n"
permute =: 3 :0
if. (/:y)-:i.#y do. y {~ lex layer^:(<:#y) i.#y
else. permute (/:y){y end.
)

lex =: 3 :0
func =. 3 :'(#y)=# ~. y'
(func"1 y) # y
)

layer =: 3 :0
r =. 1-~#$y 
,/y (,"(r,0))/i.>:>./,y
)

NB. Fill to table
tablefill_num =: 3 :0
best =. >.%:#y
padded =. y,(((#y) -~ *:best)$_)
(best, best) $ padded
)

tablefill =: 3 :0
best =. >.%:#y
padded =. y,(((#y) -~ *:best)$a:)
(best, best) $ padded
)

justify =: 4 :0
needed =. x - #y
((<.needed%2)$' '),y,((<.(>:needed)%2)$' ')
)

totable =: 4 :0
headings =. x
data =. y
ml =. >./ #"1 headings
