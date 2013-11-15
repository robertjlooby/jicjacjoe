load 'src/console_game.ijs'
load 'src/console_reader.ijs'
load 'src/console_writer.ijs'
load 'src/game_console_io.ijs'

cocurrent 'ttt'

initializeIO =: 3 : 0
  reader =: '' conew 'ConsoleReader' 
  writer =: '' conew 'ConsoleWriter'
  gameConsoleIO =: (reader; <writer) conew 'GameConsoleIO'
  reader; writer; <gameConsoleIO
)

initializeSymbols =: 3 : 0
  promptForPlayerSymbol__y ''
  symbol =. getXorO__y ''
  if. symbol = 'x' do.
    oppSymbol =. 'o'
  else.
    oppSymbol =. 'x'
  end.

  symbol; oppSymbol
)

initializePlayAI =: 3 : 0
  promptForPlayAI__y ''
  getYorN__y ''
)

initializePlayFirst =: 3 : 0
  promptForPlayFirst__y ''
  getYorN__y ''
)

initializeBoardSize =: 3 : 0
  promptForBoardSize__y ''
  getBoardSize__y ''
)

initializePlayAgain =: 3 : 0
  promptForPlayAgain__y ''
  getYorN__y ''
)

playTTT_z_ =: 3 : 0
  'reader writer consoleIO' =. initializeIO_ttt_ ''

  'sym oppSym' =. initializeSymbols_ttt_ consoleIO

  playAI =. initializePlayAI_ttt_ consoleIO

  playFirst =. initializePlayFirst_ttt_ consoleIO

  boardSize =. initializeBoardSize_ttt_ consoleIO

  game =. (playAI; sym; oppSym; playFirst; boardSize) conew 'ConsoleGame'

  winner =. play__game ''

  notifyWinner__consoleIO winner

  playAgain =. initializePlayAgain_ttt_ consoleIO

  destroy__reader ''
  destroy__writer ''
  destroy__consoleIO ''
  destroy__game ''

  if. playAgain do.
    playTTT ''
  end.
)
