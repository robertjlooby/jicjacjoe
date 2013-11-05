load 'src/board.ijs'

arreq =: 4 : '*/ , x = y'
display =: 3 : 'y (1!:2) 2'

test_createSizeDefaultsTo3 =: 3 : 0
  B =. '' conew 'Board'
  assert 3 = size__B
)

test_createDimDefaultsTo2 =: 3 : 0
  B =. '' conew 'Board'
  assert 2 = dimension__B
)
  
test_createInitsWithSizeDimEmptyboard =: 3 : 0
  B =. 5 3 conew 'Board'
  assert 5 = size__B
  assert 3 = dimension__B
  assert 5 5 5 $ '-' arreq state__B
)

test_winnerFalseForEmptyBoard =: 3 : 0
  B =. '' conew 'Board'
  assert -. winner__B 'x'
)

test_anyRowWins =: 3 : 0
  for_row. i.5 do.
    B =. 5 2 conew 'Board'
    state__B =. 'x' row} state__B
    assert winner__B 'x'
  end.
)

test_anyColWins =: 3 : 0
  for_col. i.5 do.
    B =. 5 2 conew 'Board'
    state__B =. 'x' col}"1 state__B
    assert winner__B 'x'
  end.
)

test_diagIndexes =: 3 : 0
  B =. '' conew 'Board'
  assert (0 0 ; 1 1 ; 2 2) = diagIndexes__B

  B =. 5 3 conew 'Board'
  assert (0 0 ; 1 1 ; 2 2 ; 3 3 ; 4 4) = diagIndexes__B
)
  

test_anyDiagWins =: 3 : 0
  diagIndexes =. (, > 5 # (<0 1)) < ;. 2 (2 # i. 5)
  B =. 5 2 conew 'Board'
  state__B =. 'x' diagIndexes__B} state__B
  assert winner__B 'x'

  B =. 5 2 conew 'Board'
  state__B =. |. 'x' diagIndexes__B} state__B
  assert winner__B 'x'
)

test_anyRowWithinPlaneWins3D =: 3 : 0
  for_plane. i.5 do.
    for_row. i.5 do.
      B =. 5 3 conew 'Board'
      state__B =. 'o' (< plane , row)} state__B
      assert winner__B 'o'
    end.
  end.
)

test_anyColWithinPlaneWins3D =: 3 : 0
  for_plane. i.5 do.
    for_col. i.5 do.
      B =. 5 3 conew 'Board'
      state__B =. |:"2 'o' (< plane , col)} state__B
      assert winner__B 'o'
    end.
  end.
)

test_anyDiagWithinPlaneWins3D =: 3 : 0
  for_plane. i.5 do.
    B =. 5 3 conew 'Board'
    state__B =. 'x' (;/ plane ,. >diagIndexes__B)} state__B
    display state__B
    assert winner__B 'x'

    B =. 5 3 conew 'Board'
    state__B =. |. 'x' (;/ plane ,. >diagIndexes__B)} state__B
    assert winner__B 'x'
  end.
)
