n =: (1 1 1 1 0 1 1 1 1) # ,/ (<:i.3) ,."(0 1) <:i.3
pos =: |."1 ,/ (i.size) ,."(0 1) i.size
size =: 10
sleep =: 6!:3@(][ ([:wd'msgs'"_)^:IFQT)
t =: (size,size)$?((*:size)$2)

NB. Get the value at (x,y) in t
at =: 4 :0
  if. (0<:x)*(0<:y)*(10>x)*(10>y) do. x{y{t
  else. 0 end.
)

NB. Count neighbours
cn =: 4 :'+/ (x + {."1 n) at"(0 0) (y + {:"1 n)'

NB. Apply rule to cell (x,y)
r =: 4 :0
  v =. x at y
  n =. x cn y
  if. (1=v)*(1=<.-:n) do. 1
  elseif. (1=v) do. 0
  elseif. (3=n) do. 1
  else. 0 end.
)

NB. Apply rule to all cells
next =: 3 :0
  res =. ,/ ({."1 pos) r"(0 0) ({:"1 pos)
  (size,size) $ res
)
NB. Format nicely
pad =: 3 :''' '',y,'' '''
hash =: 3 :'(size,size)$<"1 pad"0 ,t{'' #'''

seen =: 0$0
loop =: 3 :0
  echo 100$LF
  echo hash 0
  seen =: seen, #. , t
  t =: next"_ t
  if. (#seen) > seen i. #. , t do. 0
  else.
  sleep 0.5
  loop 0 end.
)

loop 0
