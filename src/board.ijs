coclass 'Board'

create =: 3 : 0
  try. size =: 0 { y catch. size =: 3 end.
  state =: (2 # size) $ '-'
  cutIndexes =. (, > size # (<0 1))
  diagIndexes =: cutIndexes < ;. 2 (2 # i. size)
)

move =: 4 : 0
  state =: y (<x) } state
)

allRows =: 3 : 0
  state , (|: state) , (diagIndexes { state) ,: (diagIndexes { |. state)
)

rowWinner =: 3 : 0
  +./ *./"1 y = allRows ''
)

winner =: 3 : 0
  rowWinner y
)

full =: 3 : 0
  hasEmptySpot =. +./ , '-' = state
  -. hasEmptySpot
)

destroy =: codestroy
