coclass 'AIPlayer'

create =: 3 : 0
  'board symbol oppSymbol' =: y
  initializeCaches size__board
)

initializeCaches =: 3 : 0
  cachedMovesRow =: initializeSparseArray y
  cachedMovesCol =: initializeSparseArray y
  cachedMovesOutcome =: initializeSparseArray y
)

initializeSparseArray =: 3 : 0
  1$. (3 ^ *: y); 0; _
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

isCached =: 3 : 0
  -. _ = y { cachedMovesOutcome
)

getCachedMove =: 3 : 0
    (y { cachedMovesRow); (y { cachedMovesCol); (y { cachedMovesOutcome)
)

putCachedMove =: 4 : 0
  'row col outcome' =. y
  cachedMovesRow =: row x } cachedMovesRow
  cachedMovesCol =: col x } cachedMovesCol
  cachedMovesOutcome =: outcome x } cachedMovesOutcome
)

getMove =: 3 : 0
  size =: # y
  move =. (symbol; _1; 1) minimax y
  > }: move
)

minimax =: 4 : 0
  'moveSymbol alpha beta' =. x
  key =. hashCodeFor__board y

  if. isCached key do.
    getCachedMove key
    return.
  elseif. symbol = moveSymbol do.
    move =. (alpha; beta) getMaxMove y
  elseif. 1 do.
    move =. (alpha; beta) getMinMove y
  end.

  key putCachedMove move
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
