coclass 'AIPlayer'

create =: 3 : 0
  board     =: > 0{y
  symbol    =: > 1{y
  oppSymbol =: > 2{y
)

evaluateScore =: 3 : 0
  state__board =: y
  if. winner__board symbol do.
    score =. 1
  elseif. winner__board oppSymbol do.
    score =. -1
  elseif. full__board '' do.
    score =. 0
  elseif. 1 do.
    score =. '-'
  end.
  score
)

getMove =: 3 : 0
  move =. symbol minimax y
  > (0 1) { move
)

minimax =: 4 : 0
  if. symbol = x do.
    move =. x getMaxMove y
  else.
    move =. x getMinMove y
  end.
  move
)

getNextScore =: 4 : 0
  score =. evaluateScore y
  if. score = '-' do.
    score =. > 2 { x minimax y
  end.
  score
)

getMaxMove =: 4 : 0
  maxScore =. _2
  for_cel. emptyCells y do.
    row =. <. cel % 3
    col =. 3 | cel
    nextScore =. oppSymbol getNextScore symbol (<row, col) } y
    if. maxScore < nextScore do.
      maxScore =. nextScore
      maxRow   =. row
      maxCol   =. col
    end.
  end.
  (maxRow; maxCol; maxScore)
)

getMinMove =: 4 : 0
  minScore =. 2
  for_cel. emptyCells y do.
    row =. <. cel % 3
    col =. 3 | cel
    nextScore =. symbol getNextScore oppSymbol (<row, col) } y
    if. minScore > nextScore do.
      minScore =. nextScore
      minRow   =. row
      minCol   =. col
    end.
  end.
  (minRow; minCol; minScore)
)

emptyCells =: 3 : 0
  I. , '-' = y
)

destroy =: codestroy
