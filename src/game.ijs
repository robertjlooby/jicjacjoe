coclass 'Game'

create =: 3 : 0
  board =: > 0{y
  boardDisplay =: > 1{y
  players =: > 2{y
)

takeTurn =: 3 : 0
  display__boardDisplay ''
  currentPlayer =. 0{players
  move =. getMove__currentPlayer state__board
  move move__board symbol__currentPlayer
  players =: |. players
  if. full__board '' do.
    result =. '-'
  elseif. winner__board symbol__currentPlayer do.
    result =. symbol__currentPlayer
  elseif. 1 do.
    result =. 0
  end.
  result
)

play =: 3 : 0
  whilst. 0 = result do.
    result =. takeTurn ''
  end.
)

destroy =: codestroy
