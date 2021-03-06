coclass 'GameConsoleIO'

create =: 3 : 0
  'reader writer' =: y
)

notifyWinner =: 3 : 0
  if. y = '-' do.
    write__writer 'It was a tie.'
  else.
    write__writer 'Player ', y, ' won.'
  end.
)

promptForPlayAI =: 3 : 0
  write__writer 'Would you like to play against an AI opponent? (yes or no)'
)

promptForPlayFirst =: 3 : 0
  write__writer 'Would you like to play first? (yes or no)'
)

promptForPlayerSymbol =: 3 : 0
  write__writer 'Would you like to be Xs or Os? (X or O)'
)

promptForBoardSize =: 3 : 0
  write__writer 'What size board would you like to play on (ex. 3x3 or 4x4)? (an integer 3 or larger)'
)

promptForPlayAgain =: 3 : 0
  write__writer 'Would you like to play again? (yes or no)'
)

getYorN =: 3 : 0
  response =. read__reader ''
  # '[Yy]' rxfirst response
)

getXorO =: 3 : 0
  response =. read__reader ''
  isx =. # '[Xx]' rxfirst response
  isx { 'ox'
)

getBoardSize =: 3 : 0
  response =. read__reader ''
  size =. 4". '[[:digit:]]+' rxfirst response
  if. (size < 3) +. 0 = # size do.
    size =. 3
  end.
  size
)

destroy =: codestroy
