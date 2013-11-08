load 'spec/spec_helper.ijs'
load 'spec/mock_player.ijs'
load 'spec/mock_board_display.ijs'
load 'src/game.ijs'
load 'src/board.ijs'

before_each =: 3 : 0
  board =: 3 conew 'Board'
  boardDisplay =: '' conew 'MockBoardDisplay'

  player1 =: 'x' conew 'MockPlayer'
  player2 =: 'o' conew 'MockPlayer'
  moves          =: 0 0; 1 1; 0 1; 0 2; 2 0; 1 0; 1 2; 2 2; 2 1
  moves__player1 =: 0 0;      0 1;      2 0;      1 2;      2 1
  moves__player2 =:      1 1;      0 2;      1 0;      2 2
  players =: player1, player2

  game =: (board; boardDisplay; <players) conew 'Game'
)

test_initializesWithBoardBoardIOAndPlayers =: 3 : 0
  assert board = board__game
  assert boardDisplay = boardDisplay__game
  assert players = players__game
  assert player1 = 0{players__game
  assert player2 = 1{players__game
)

test_takeTurnUpdatesCurrentPlayer =: 3 : 0
  for_i. i. 9 do.
    assert player1 = (2 | i){players__game
    assert player2 = (-. 2 | i){players__game

    takeTurn__game ''
  end.
)

test_shouldGetMoveFromCorrectPlayerEachTurn =: 3 : 0
  for_i. i.9 do.
    assert (<. (1 + i) % 2) = timesCalledGetMove__player1
    assert (<. i % 2)       = timesCalledGetMove__player2

    takeTurn__game ''
  end.
)

test_shouldPassTheBoardStateToThePlayer =: 3 : 0
  for. i.9 do.
    boardState =. state__board
    currentPlayer =. 0{players__game
    takeTurn__game ''
    assert boardState -: lastCalledGetMoveWith__currentPlayer
  end.
)

test_shouldDisplayTheBoardEachTurn =: 3 : 0
  for_i. i.9 do.
    assert i = timesDisplayed__boardDisplay
    takeTurn__game ''
  end.
) 

test_shouldPassTheBoardStateToTheDisplay =: 3 : 0
  for. i.9 do.
    boardState =. state__board
    takeTurn__game ''
    assert boardState -: displayLastCalledWith__boardDisplay
  end.
)

test_shouldUpdateTheBoardWithMovesEachTurn =: 3 : 0
  for_i. i.9 do.
    currentPlayer =. 0{players

    assert '-' = (< i { moves) { state__board
    takeTurn__game ''
    assert symbol__currentPlayer = (< i { moves) { state__board
  end.
)

test_shouldReturnFalseForAGameThatIsNotOver =: 3 : 0
  for. i.8 do.
    assert -. takeTurn__game ''
  end.
)

test_shouldReturnDashForTieGame =: 3 : 0
  state__board =: 3 3 $ 'xxoooxx-o'
  moves__player1 =: <2 1
  result =. takeTurn__game ''
  assert '-' = result
)

test_shouldReturnxForPlayerXWin =: 3 : 0
  state__board =: 3 3 $ 'xx-oo----'
  moves__player1 =: <0 2
  result =. takeTurn__game ''
  assert 'x' = result
)

test_shouldReturnoForPlayerOWin =: 3 : 0
  state__board =: 3 3 $ 'xx-oo----'
  moves__player2 =: <1 2
  players__game =: |. players__game
  result =. takeTurn__game ''
  assert 'o' = result
)

test_shouldReturnxForPlayerXWinOnLastMove =: 3 : 0
  state__board =: 3 3 $ 'xx-ooxoxo'
  moves__player1 =: <0 2
  result =. takeTurn__game ''
  assert 'x' = result
)

test_shouldTake9TurnsOnA3x3Board =: 3 : 0
  play__game ''
  assert 5 = timesCalledGetMove__player1
  assert 4 = timesCalledGetMove__player2
)

test_shouldOnlyPlayUntilGameEnds =: 3 : 0
  state__board =: 3 3 $ 'xx-oo----'
  moves__player1 =: <0 2
  play__game ''
  assert 1 = timesCalledGetMove__player1
  assert 0 = timesCalledGetMove__player2
)

test_shouldReturnxForPlayerXWinGame =: 3 : 0
  state__board =: 3 3 $ 'xx-oo----'
  moves__player1 =: <0 2
  result =. play__game ''
  assert 'x' = result
)

test_shouldReturnoForPlayerOWinGame =: 3 : 0
  state__board =: 3 3 $ 'xx-oo----'
  moves__player2 =: <1 2
  players__game =: |. players__game
  result =. play__game ''
  assert 'o' = result
)

test_shouldReturnDashForTie =: 3 : 0
  state__board =: 3 3 $ 'xxoooxx-o'
  moves__player1 =: <2 1
  result =. play__game ''
  assert '-' = result
)
