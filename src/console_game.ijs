load 'src/board.ijs'
load 'src/board_console_display.ijs'
load 'src/console_reader.ijs'
load 'src/console_writer.ijs'
load 'src/game.ijs'
load 'src/human_console_io.ijs'
load 'src/human_player.ijs'

console_game =: 3 : 0
  writer =: '' conew 'ConsoleWriter'
  reader =: '' conew 'ConsoleReader' 
  humanConsoleIO =: (reader, writer) conew 'HumanConsoleIO'
  player1 =: (humanConsoleIO; 'x') conew 'HumanPlayer'
  player2 =: (humanConsoleIO; 'o') conew 'HumanPlayer'
  board =: '' conew 'Board'
  boardConsoleDisplay =: writer conew 'BoardConsoleDisplay'
  game =: (board; boardConsoleDisplay; <player1, player2) conew 'Game'

  winner =: play__game ''

  if. winner = '-' do.
    write__writer 'It was a tie.'
  else.
    write__writer 'Player ', winner, ' won.'
  end.
)

console_game ''
