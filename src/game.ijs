coclass 'Game'

create =: 3 : 0
  'board boardDisplay players' =: y
)

takeTurn =: 3 : 0
  display__boardDisplay state__board
  currentPlayer =. 0{players
  move =. getMove__currentPlayer state__board
  move move__board symbol__currentPlayer
  players =: |. players
  if. winner__board symbol__currentPlayer do.
    result =. symbol__currentPlayer
  elseif. full__board '' do.
    result =. '-'
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
