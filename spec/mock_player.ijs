coclass 'MockPlayer'

create =: 3 : 0
  symbol =: y
  moves =: 0 0; 1 1; 2 2
)

getMove =: 3 : 0
  move =: > {. moves
  moves =: }. moves
  move
)

destroy =: codestroy
