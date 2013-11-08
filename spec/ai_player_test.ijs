load 'spec/spec_helper.ijs'
load 'src/board.ijs'
load 'src/ai_player.ijs'

before_each =: 3 : 0
  board   =: '' conew 'Board'
  xplayer =: (board; 'x'; 'o') conew 'AIPlayer'
  oplayer =: (board; 'o'; 'x') conew 'AIPlayer'
)

test_playerInitsWithBoardAndSymAndOppSym =: 3 : 0
  assert board__xplayer = board
  assert board__oplayer = board

  assert symbol__xplayer = 'x'
  assert symbol__oplayer = 'o'

  assert oppSymbol__xplayer = 'o'
  assert oppSymbol__oplayer = 'x'
)

test_evaluateScoreIs1ForWin =: 3 : 0
  assert 1 = evaluateScore__xplayer 3 3 $ 'x'
  assert 1 = evaluateScore__oplayer 3 3 $ 'o'
)

test_evaluateScoreIsNeg1ForLoss =: 3 : 0
  assert _1 = evaluateScore__xplayer 3 3 $ 'o'
  assert _1 = evaluateScore__oplayer 3 3 $ 'x'
)

test_evaluateScoreIs0ForTie =: 3 : 0
  assert 0 = evaluateScore__xplayer 3 3 $ 'xxoooxxxo'
  assert 0 = evaluateScore__oplayer 3 3 $ 'xxoooxxxo'
)

test_evaluateScoreIsDashForUnfinishedGame =: 3 : 0
  assert '-' = evaluateScore__xplayer 3 3 $ '-'
  assert '-' = evaluateScore__oplayer 3 3 $ '-'
)

test_shouldChooseCornerCellWhenBoardEmpty =: 3 : 0
  move =. getMove__xplayer 3 3 $ '-'
  assert (< move) { 3 3 $ 1 0 1 0 0 0 1 0 1
)

test_shouldChooseCell4WhenOnlyCell0Taken =: 3 : 0
  assert 1 1 -: getMove__oplayer 3 3 $ 'x--------'
)

test_shouldChooseLastCellWhenOnlyCellLeft =: 3 : 0
  assert 0 0 -: getMove__xplayer 3 3 $ '-oxxoooxx'
  assert 2 0 -: getMove__xplayer 3 3 $ 'xoxoox-xo'
  assert 2 2 -: getMove__xplayer 3 3 $ 'xxoooxxo-'
  assert 0 2 -: getMove__xplayer 3 3 $ 'ox-xooxox'
  assert 1 2 -: getMove__xplayer 3 3 $ 'oxoox-xox'
  assert 0 1 -: getMove__xplayer 3 3 $ 'o-xxxooox'
)

test_shouldChooseWinningMove =: 3 : 0
  assert 2 2 -: getMove__xplayer 3 3 $ 'x-oxxoo--'
  assert 0 2 -: getMove__xplayer 3 3 $ 'oo--x-xxo'
  assert 2 0 -: getMove__xplayer 3 3 $ 'oxx-x--oo'
  assert 1 0 -: getMove__xplayer 3 3 $ 'xoo-x-x-o'
  assert 0 2 -: getMove__oplayer 3 3 $ 'x-----oxo'
)

test_shouldChooseMoveToForceTie =: 3 : 0
  assert 2 1 -: getMove__xplayer 3 3 $ 'xox-x-o-o'
  assert 2 0 -: getMove__xplayer 3 3 $ 'xxo-o----'
  assert -. 0 1 -: getMove__xplayer 3 3 $ '--x-o-ox-'
  assert 2 0 -: getMove__oplayer 3 3 $ 'x--xoo--x'
  assert 0 1 -: getMove__oplayer 3 3 $ 'x---o---x'
  assert 2 0 -: getMove__oplayer 3 3 $ 'oox-x--xo'
)

test_shouldReturnAllCellsForEmptyBoard =: 3 : 0
  assert (i.9) -: emptyCells__xplayer 3 3 $ '-'
)

test_shouldReturnOnlyTheEmptyCells =: 3 : 0
  assert 0 1 2 -: emptyCells__xplayer 3 3 $ '---xxooox'
  assert 3 5 7 -: emptyCells__xplayer 3 3 $ 'xox-x-o-o'
  assert (1 $ 8) -: emptyCells__xplayer 3 3 $ 'xxoooxxo-'
  assert '' -: emptyCells__xplayer 3 3 $ 'xxoooxxox'
)
