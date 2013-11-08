load 'src/ai_player.ijs'
load 'src/board.ijs'
load 'src/board_console_display.ijs'
load 'src/console_reader.ijs'
load 'src/console_writer.ijs'
load 'src/game.ijs'
load 'src/game_console_io.ijs'
load 'src/human_console_io.ijs'
load 'src/human_player.ijs'

console_game =: 3 : 0
  writer =: '' conew 'ConsoleWriter'
  reader =: '' conew 'ConsoleReader' 
  gameConsoleIO =: (reader, writer) conew 'GameConsoleIO'
  humanConsoleIO =: (reader, writer) conew 'HumanConsoleIO'
  boardConsoleDisplay =: writer conew 'BoardConsoleDisplay'

  promptForPlayerSymbol__gameConsoleIO ''
  symbol =: getXorO__gameConsoleIO ''
  if. symbol = 'x' do.
    oppSymbol =. 'o'
  else.
    oppSymbol =. 'x'
  end.
  player1 =: (humanConsoleIO; symbol) conew 'HumanPlayer'

  promptForAI__gameConsoleIO ''
  if. getYorN__gameConsoleIO '' do.
    player2 =: (('' conew 'Board'); oppSymbol; symbol) conew 'AIPlayer'
  else.
    player2 =: (humanConsoleIO; oppSymbol) conew 'HumanPlayer'
  end.
  players =: player1, player2

  promptForPlayFirst__gameConsoleIO ''
  if. -. getYorN__gameConsoleIO ''  do.
    players =: |. players
  end.

  promptForBoardSize__gameConsoleIO ''
  boardSize =: getBoardSize__gameConsoleIO ''
  board =: boardSize conew 'Board'

  game =: (board; boardConsoleDisplay; <players) conew 'Game'

  winner =: play__game ''

  if. winner = '-' do.
    write__writer 'It was a tie.'
  else.
    write__writer 'Player ', winner, ' won.'
  end.

  promptForPlayAgain__gameConsoleIO ''
  if. getYorN__gameConsoleIO '' do.
    console_game ''
  end.
)

console_game ''
