coclass 'MockPlayer'

create =: 3 : 0
  symbol =: y
  moves =: 0 0; 1 1; 0 1; 0 2; 2 0; 1 0; 1 2; 2 2; 2 1
  timesCalledGetMove =: 0
)

getMove =: 3 : 0
  lastCalledGetMoveWith =: y
  timesCalledGetMove =: >: timesCalledGetMove
  move =: > {. moves
  moves =: }. moves
  move
)

destroy =: codestroy
