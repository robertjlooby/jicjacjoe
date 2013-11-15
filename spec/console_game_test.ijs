load 'spec/spec_helper.ijs'
load 'src/console_game.ijs'

test_itInitializesAHumanVsHumanGame =: 3 : 0
  boardSize =. 3
  symbol    =. 'x'
  oppSymbol =. 'o'
  playAI    =. 0
  playFirst =. 1

  game =. (playAI; symbol; oppSymbol; playFirst; boardSize) conew 'ConsoleGame'
  player1 =. 0{players__game
  player2 =. 1{players__game
  
  assert 'x' -: symbol__player1
  assert 'o' -: symbol__player2
  assert 1 -: #io__player1
  assert 1 -: #io__player2
  assert 3 -: size__board__game
  destroy__game ''
)

test_itInitializesAHumanVsAIGame =: 3 : 0
  boardSize =. 4
  symbol    =. 'x'
  oppSymbol =. 'o'
  playAI    =. 1
  playFirst =. 0

  game =. (playAI; symbol; oppSymbol; playFirst; boardSize) conew 'ConsoleGame'
  player1 =. 0{players__game
  player2 =. 1{players__game
  
  assert 'o' -: symbol__player1
  assert 'x' -: symbol__player2
  assert 1 -: #board__player1
  assert 1 -: #io__player2
  assert 4 -: size__board__game
  destroy__game ''
)
