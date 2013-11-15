load 'spec/spec_helper.ijs'
load 'spec/mock_io.ijs'
load 'src/play_ttt.ijs'

before_each =: 3 : 0
  mockIO =: '' conew 'MockIO'
)

after_each =: 3 : 0
  destroy__mockIO ''
)

test_initializeIO =: 3 : 0
  'reader writer consoleIO' =. initializeIO_ttt_ ''
  assert _ -: fileno__reader
  assert 4 -: fileno__writer
  assert reader -: reader__consoleIO
  assert writer -: writer__consoleIO
  destroy__reader ''
  destroy__writer ''
  destroy__consoleIO ''
)

test_initializeSymbols =: 3 : 0
  responses__mockIO =: 'x'; 'o'

  'sym oppSym' =. initializeSymbols_ttt_ mockIO
  assert sym -: 'x'
  assert oppSym -: 'o'

  'sym oppSym' =. initializeSymbols_ttt_ mockIO
  assert sym -: 'o'
  assert oppSym -: 'x'

  assert ('getXorO'; 'promptForPlayerSymbol'; 'getXorO'; 'promptForPlayerSymbol'; 'none') -: lastCalled__mockIO
)

test_initializePlayAI =: 3 : 0
  responses__mockIO =: 1; 0

  playAI =. initializePlayAI_ttt_ mockIO
  assert playAI -: 1

  playAI =. initializePlayAI_ttt_ mockIO
  assert playAI -: 0

  assert ('getYorN'; 'promptForPlayAI'; 'getYorN'; 'promptForPlayAI'; 'none') -: lastCalled__mockIO
)

test_initializePlayFirst =: 3 : 0
  responses__mockIO =: 1; 0

  playFirst =. initializePlayFirst_ttt_ mockIO
  assert playFirst -: 1

  playFirst =. initializePlayFirst_ttt_ mockIO
  assert playFirst -: 0

  assert ('getYorN'; 'promptForPlayFirst'; 'getYorN'; 'promptForPlayFirst'; 'none') -: lastCalled__mockIO
)

test_initializeBoardSize =: 3 : 0
  responses__mockIO =: 3; 4

  boardSize =. initializeBoardSize_ttt_ mockIO
  assert boardSize -: 3

  assert ('getBoardSize'; 'promptForBoardSize'; 'none') -: lastCalled__mockIO
)

test_initializePlayAgain =: 3 : 0
  responses__mockIO =: 1; 0

  playAgain =. initializePlayAgain_ttt_ mockIO
  assert playAgain -: 1

  playAgain =. initializePlayAgain_ttt_ mockIO
  assert playAgain -: 0

  assert ('getYorN'; 'promptForPlayAgain'; 'getYorN'; 'promptForPlayAgain'; 'none') -: lastCalled__mockIO
)
