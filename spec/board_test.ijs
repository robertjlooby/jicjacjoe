load 'spec/spec_helper.ijs'
load 'src/board.ijs'

before_each =: 3 : 0
  defaultBoard =: '' conew 'Board'
  board5 =: 5 conew 'Board'
  board4 =: 4 conew 'Board'
)

after_each =: 3 : 0
  destroy__defaultBoard ''
  destroy__board5 ''
  destroy__board4 ''
)

test_createSizeDefaultsTo3 =: 3 : 0
  assert 3 -: size__defaultBoard
)
  
test_createInitsWithSizeEmptyboard =: 3 : 0
  assert 5 -: size__board5
  assert (5 5 $ '-') -: state__board5
)

test_winnerFalseForEmptyBoard =: 3 : 0
  assert -. winner__defaultBoard 'x'
  assert -. winner__defaultBoard 'o'
)

test_winnerFalseForBoardWithTie =: 3 : 0
  state__defaultBoard =. 3 3 $ 'xxoooxxox'
  assert -. winner__defaultBoard 'x'
  assert -. winner__defaultBoard 'o'
)

test_anyRowWins =: 3 : 0
  for_row. i.5 do.
    state__board5 =. 'x' row} state__board5
    assert winner__board5 'x'
  end.
)

test_anyColWins =: 3 : 0
  for_col. i.5 do.
    state__board5 =. 'x' col}"1 state__board5
    assert winner__board5 'x'
  end.
)

test_anyDiagWins =: 3 : 0
  diagIndexes =. 0 0; 1 1; 2 2; 3 3; 4 4
  state__board5 =. 'x' diagIndexes} state__board5
  assert winner__board5 'x'

  state__board4 =. |. 'o' (}: diagIndexes) } state__board4
  assert winner__board4 'o'
)

test_moveAltersBoardState =: 3 : 0
  expected =. 5 5 $ '-'

  expected =. 'x' (<0 0) } expected
  0 0 move__board5 'x'
  assert expected -: state__board5

  expected =. 'o' (<1 1) } expected
  1 1 move__board5 'o'
  assert expected -: state__board5

  expected =. 'x' (<4 4) } expected
  4 4 move__board5 'x'
  assert expected -: state__board5
)

test_fullReturnsFalseForAnEmptyBoard =: 3 : 0
  assert -. full__board5 ''
)

test_fullReturnsFalseForANotFullBoard =: 3 : 0
  state__defaultBoard =. 3 3 $ 'xxoooxxo-'
  assert -. full__defaultBoard ''
)

test_fullReturnsTrueForAFullBoard =: 3 : 0
  state__defaultBoard =. 3 3 $ 'xxoooxxox'
  assert full__defaultBoard ''
)

test_resetsSizeWhenAskedForWinner =: 3 : 0
  state__defaultBoard =. 4 4 $ '---x--x--x--x---'
  assert winner__defaultBoard 'x'
  assert 4 -: size__defaultBoard
)

test_resetsSizeWhenAskedForFull =: 3 : 0
  state__defaultBoard =. 4 4 $ 'xxxoxxooxooooxxx'
  assert full__defaultBoard ''
  assert 4 -: size__defaultBoard
)

test_itComputesTheHashCodeOfAGivenState =: 3 : 0
  assert 0 -: hashCodeFor__defaultBoard 3 3 $ '-'
  assert 1 -: hashCodeFor__defaultBoard 3 3 $ 'x--------'
  assert 2 -: hashCodeFor__defaultBoard 3 3 $ 'o--------'
  assert 6563 -: hashCodeFor__defaultBoard 3 3 $ 'o-------x'
  assert (<: 3 ^ 9) -: hashCodeFor__defaultBoard 3 3 $ 'o'
  assert (<: 3 ^ 16) -: hashCodeFor__defaultBoard 4 4 $ 'o'
)
