coclass 'AIPlayer'

create =: 3 : 0
  'board symbol oppSymbol' =: y
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
  size =: {. $ y
  move =. (symbol; _1; 1) minimax y
  > }: move
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
    score =. > {: x minimax y
  end.
  score
)

getMaxMove =: 4 : 0
  'alpha beta' =. x
  nextRow =. ] nextCol =. _1
  for_cel. emptyCells y do.
    row =. <. cel % size
    col =. size | cel
    nextScore =. (oppSymbol; alpha; beta) getNextScore symbol (<row, col) } y
    if. nextScore >: beta do.
      (row; col; nextScore)
      return.
    end.
    if. (nextRow = _1) *. nextScore <: alpha do.
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
  nextRow =. ] nextCol =. _1
  for_cel. emptyCells y do.
    row =. <. cel % size
    col =. size | cel
    nextScore =. (symbol; alpha; beta) getNextScore oppSymbol (<row, col) } y
    if. nextScore <: alpha do.
      (row; col; nextScore)
      return.
    end.
    if. (nextRow = _1) *. nextScore >: beta do.
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
