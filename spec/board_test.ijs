load 'spec/spec_helper.ijs'
load 'src/board.ijs'

test_createSizeDefaultsTo3 =: 3 : 0
  B =. '' conew 'Board'
  assert 3 = size__B
)
  
test_createInitsWithSizeEmptyboard =: 3 : 0
  B =. 5 conew 'Board'
  assert 5 = size__B
  assert 5 5 $ '-' -: state__B
)

test_winnerFalseForEmptyBoard =: 3 : 0
  B =. '' conew 'Board'
  assert -. winner__B 'x'
  assert -. winner__B 'o'
)

test_winnerFalseForBoardWithTie =: 3 : 0
  B =. '' conew 'Board'
  state__B =. 3 3 $ 'xxoooxxox'
  assert -. winner__B 'x'
  assert -. winner__B 'o'
)

test_anyRowWins =: 3 : 0
  for_row. i.5 do.
    B =. 5 conew 'Board'
    state__B =. 'x' row} state__B
    assert winner__B 'x'
  end.
)

test_anyColWins =: 3 : 0
  for_col. i.5 do.
    B =. 5 conew 'Board'
    state__B =. 'x' col}"1 state__B
    assert winner__B 'x'
  end.
)

test_diagIndexes =: 3 : 0
  B =. '' conew 'Board'
  assert (0 0 ; 1 1 ; 2 2) = diagIndexes__B

  B =. 5 conew 'Board'
  assert (0 0 ; 1 1 ; 2 2 ; 3 3 ; 4 4) = diagIndexes__B
)

test_anyDiagWins =: 3 : 0
  diagIndexes =. (, > 5 # (<0 1)) < ;. 2 (2 # i. 5)
  B =. 5 conew 'Board'
  state__B =. 'x' diagIndexes__B} state__B
  assert winner__B 'x'

  B =. 5 conew 'Board'
  state__B =. |. 'x' diagIndexes__B} state__B
  assert winner__B 'x'
)

test_moveAltersBoardState =: 3 : 0
  B =. 5 conew 'Board'
  expected =. 5 5 $ '-'

  expected =. 'x' (<0 0) } expected
  0 0 move__B 'x'
  assert expected -: state__B

  expected =. 'o' (<1 1) } expected
  1 1 move__B 'o'
  assert expected -: state__B

  expected =. 'x' (<4 4) } expected
  4 4 move__B 'x'
  assert expected -: state__B
)

test_fullReturnsFalseForAnEmptyBoard =: 3 : 0
  B =. 5 conew 'Board'
  assert -. full__B ''
)

test_fullReturnsFalseForANotFullBoard =: 3 : 0
  B =. '' conew 'Board'
  state__B =. 3 3 $ 'xxoooxxo-'
  assert -. full__B ''
)

test_fullReturnsTrueForAFullBoard =: 3 : 0
  B =. '' conew 'Board'
  state__B =. 3 3 $ 'xxoooxxox'
  assert full__B ''
)
