load 'spec/spec_helper.ijs'
load 'src/game.ijs'
load 'src/board.ijs'
load 'spec/mock_player.ijs'

before_each =: 3 : 0
  board =: 3 conew 'Board'
  player1 =: 'x' conew 'MockPlayer'
  player2 =: 'o' conew 'MockPlayer'
  players =: player1, player2
  game =: (board; <players) conew 'Game'
)

test_initializesWithBoardAndPlayers =: 3 : 0
  assert board = board__game
  assert players = players__game
  assert player1 = 0{players__game
  assert player2 = 1{players__game
)
