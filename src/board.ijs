coclass 'Board'

create =: 3 : 0
  try. size =: 0 { y catch. size =: 3 end.
  state =: (2 # size) $ '-'
)

move =: 4 : 0
  state =: y (<x) } state
)

diagonalOf =: 3 : 0
  obliques =. </. y
  > (<: size) { obliques
)

diagonalRows =: 3 : 0
  (diagonalOf state) ,: (diagonalOf |. state)
)

allRows =: 3 : 0
  state , (|: state) , diagonalRows ''
)

rowWinner =: 3 : 0
  +./ *./"1 y = allRows ''
)

winner =: 3 : 0
  size =: # state
  rowWinner y
)

full =: 3 : 0
  size =: # state
  hasEmptySpot =. +./ , '-' = state
  -. hasEmptySpot
)

hashCodeFor =: 3 : 0
  count =. # , y
  values =. 3 ^ i. count
  xvalue =. +/ values * 'x' = , y
  ovalue =. +/ values * 2 * 'o' = , y
  xvalue + ovalue
)

destroy =: codestroy
