load 'spec/spec_helper.ijs'
load 'src/board.ijs'
load 'src/ai_player.ijs'

before_each =: 3 : 0
  board   =: '' conew 'Board'
  board4   =: 4 conew 'Board'
  xplayer =: (board; 'x'; 'o') conew 'AIPlayer'
  oplayer =: (board; 'o'; 'x') conew 'AIPlayer'
  xplayer4 =: (board4; 'x'; 'o') conew 'AIPlayer'
)

after_each =: 3 : 0
  destroy__board ''
  destroy__board4 ''
  destroy__xplayer ''
  destroy__oplayer ''
  destroy__xplayer4 ''
)

test_playerInitsWithBoardAndSymAndOppSym =: 3 : 0
  assert board__xplayer -: board
  assert board__oplayer -: board

  assert symbol__xplayer -: 'x'
  assert symbol__oplayer -: 'o'

  assert oppSymbol__xplayer -: 'o'
  assert oppSymbol__oplayer -: 'x'
)

test_evaluateScoreIs1ForWin =: 3 : 0
  assert 1 -: evaluateScore__xplayer 3 3 $ 'x'
  assert 1 -: evaluateScore__oplayer 3 3 $ 'o'
)

test_evaluateScoreIsNeg1ForLoss =: 3 : 0
  assert _1 -: evaluateScore__xplayer 3 3 $ 'o'
  assert _1 -: evaluateScore__oplayer 3 3 $ 'x'
)

test_evaluateScoreIs0ForTie =: 3 : 0
  assert 0 -: evaluateScore__xplayer 3 3 $ 'xxoooxxxo'
  assert 0 -: evaluateScore__oplayer 3 3 $ 'xxoooxxxo'
)

test_evaluateScoreIsDashForUnfinishedGame =: 3 : 0
  assert '-' -: evaluateScore__xplayer 3 3 $ '-'
  assert '-' -: evaluateScore__oplayer 3 3 $ '-'
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
  assert 3 3 -: getMove__xplayer4 4 4 $ 'xxooooxxxxoooox-'
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

test_shouldStartWithNoCachedMoves =: 3 : 0
  assert _ -: 0 { cachedMovesOutcome__xplayer
  assert (3 ^ 9) -: # cachedMovesOutcome__xplayer

  assert _ -: 0 { cachedMovesRow__xplayer
  assert (3 ^ 9) -: # cachedMovesRow__xplayer

  assert _ -: 0 { cachedMovesCol__xplayer
  assert (3 ^ 9) -: # cachedMovesCol__xplayer
)

test_shouldCacheMovesBeforeMakingThem =: 3 : 0
  assert _ -: 0 { cachedMovesOutcome__oplayer
  assert _ -: 0 { cachedMovesRow__oplayer
  assert _ -: 0 { cachedMovesCol__oplayer

  assert 0 0 -: getMove__oplayer 3 3 $ '-'

  assert 0 -: 0 { cachedMovesOutcome__oplayer
  assert 0 -: 0 { cachedMovesRow__oplayer
  assert 0 -: 0 { cachedMovesCol__oplayer
)

test_shouldExamineTheWholeGame =: 3 : 0
  key1 =. hashCodeFor__board 3 3 $ 'xxoooxx-o'
  key2 =. hashCodeFor__board 3 3 $ 'xxoooxxo-'

  assert _ -: key1 { cachedMovesOutcome__xplayer
  assert _ -: key2 { cachedMovesOutcome__xplayer
  assert 0 0 -: getMove__xplayer 3 3 $ '-'
  assert 0 -: key1 { cachedMovesOutcome__xplayer
  assert 2 -: key1 { cachedMovesRow__xplayer
  assert 1 -: key1 { cachedMovesCol__xplayer
  assert 0 -: key2 { cachedMovesOutcome__xplayer
  assert 2 -: key2 { cachedMovesRow__xplayer
  assert 2 -: key2 { cachedMovesCol__xplayer
)

test_shouldUseTheCachedResult =: 3 : 0
  timeToExecute =. 6!:2
  originalTime         =. timeToExecute 'getMove__xplayer 3 3 $ ''-'''
  newTime              =. timeToExecute 'getMove__xplayer 3 3 $ ''-'''
  newTimeForCachedMove =. timeToExecute 'getMove__xplayer 3 3 $ ''xo-------'''
  assert originalTime > 100 * newTime
  assert originalTime > 100 * newTimeForCachedMove
)
