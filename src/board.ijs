coclass 'Board'

create =: 3 : 0
  try. size      =: 0 { y catch. size      =: 3 end.
  try. dimension =: 1 { y catch. dimension =: 2 end.
  state =: (dimension # size) $ '-'
  cutIndexes =. (, > size # (<0 1))
  diagIndexes =: cutIndexes < ;. 2 (2 # i. size)
)

allRows =: 3 : 0
  if. dimension = 3 do.
    (,/ state) , (,/ |:"2 state)
  else.
    state , (|: state) , (diagIndexes { state) ,: (diagIndexes { |. state)
  end.
)

rowWinner =: 3 : 0
  +./ *./"1 y = allRows ''
)

winner =: 3 : 0
  rowWinner y
)

destroy =: codestroy
