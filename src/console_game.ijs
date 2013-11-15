load 'src/ai_player.ijs'
load 'src/board.ijs'
load 'src/board_console_display.ijs'
load 'src/console_reader.ijs'
load 'src/console_writer.ijs'
load 'src/game.ijs'
load 'src/game_console_io.ijs'
load 'src/human_console_io.ijs'
load 'src/human_player.ijs'

coclass 'ConsoleGame'

create =: 3 : 0
  'playAI symbol oppSymbol playFirst boardSize' =: y
  writer =: '' conew 'ConsoleWriter'
  reader =: '' conew 'ConsoleReader' 
  gameConsoleIO =: (reader; <writer) conew 'GameConsoleIO'
  humanConsoleIO =: (reader; <writer) conew 'HumanConsoleIO'
  boardConsoleDisplay =: writer conew 'BoardConsoleDisplay'
  board =: boardSize conew 'Board'
  players =: initializePlayers humanConsoleIO

  game =: (board; boardConsoleDisplay; <players) conew 'Game'
)

initializePlayers =: 3 : 0
  player1 =: (y; symbol) conew 'HumanPlayer'
  if. playAI do.
    aiBoard =: boardSize conew 'Board'
    player2 =: (aiBoard; oppSymbol; symbol) conew 'AIPlayer'
  else.
    player2 =: (y; oppSymbol) conew 'HumanPlayer'
  end.
  players =. player1, player2
  if. -. playFirst do.
    players =. |. players
  end.
  players
)

play =: 3 : 0
  play__game ''
)

destroy =: 3 : 0
  destroy__humanConsoleIO ''
  destroy__boardConsoleDisplay ''
  destroy__writer ''
  destroy__reader ''
  destroy__gameConsoleIO ''
  destroy__player1 ''
  destroy__player2 ''
  destroy__board ''
  destroy__game ''
  if. playAI do.
    destroy__aiBoard ''
  end.
  codestroy ''
)
