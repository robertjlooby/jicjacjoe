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
  move =. (symbol; _1; 1) minimax y
  > (0 1) { move
)

minimax =: 4 : 0
  'moveSymbol alpha beta' =. x
  if. symbol = moveSymbol do.
    move =. (alpha; beta) getMaxMove y
  else.
    move =. (alpha; beta) getMinMove y
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
  'alpha beta' =. x
  nextRow =. _1
  nextCol =. _1
  for_cel. emptyCells y do.
    row =. <. cel % 3
    col =. 3 | cel
    nextScore =. (oppSymbol; alpha; beta) getNextScore symbol (<row, col) } y
    if. (nextScore > beta) +. (nextScore = beta) do.
      (row; col; nextScore)
      return.
    end.
    if. nextRow = _1 *. ((nextScore < alpha) +. nextScore = alpha) do.
      nextRow   =. row
      nextCol   =. col
    end.
    if. nextScore > alpha do.
      alpha =. nextScore
      nextRow   =. row
      nextCol   =. col
    end.
  end.
  (nextRow; nextCol; alpha)
)

getMinMove =: 4 : 0
  'alpha beta' =. x
  nextRow =. _1
  nextCol =. _1
  for_cel. emptyCells y do.
    row =. <. cel % 3
    col =. 3 | cel
    nextScore =. (symbol; alpha; beta) getNextScore oppSymbol (<row, col) } y
    if. (nextScore < alpha) +. (nextScore = alpha) do.
      (row; col; nextScore)
      return.
    end.
    if. nextRow = _1 *. ((nextScore > beta) +. nextScore = beta) do.
      nextRow   =. row
      nextCol   =. col
    end.
    if. nextScore < beta do.
      beta =. nextScore
      nextRow   =. row
      nextCol   =. col
    end.
  end.
  (nextRow; nextCol; beta)
)

emptyCells =: 3 : 0
  I. , '-' = y
)

destroy =: codestroy
