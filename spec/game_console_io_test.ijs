load 'spec/spec_helper.ijs'
load 'spec/mock_reader.ijs'
load 'spec/mock_writer.ijs'
load 'src/game_console_io.ijs'

before_all =: 3 : 0
  reader =: '' conew 'MockReader'
  writer =: '' conew 'MockWriter'
  io =: (reader, writer) conew 'GameConsoleIO'
)

after_all =: 3 : 0
  destroy__reader ''
  destroy__writer ''
  destroy__io ''
)

test_initializesWithReaderAndWriter =: 3 : 0
  assert reader__io -: reader
  assert writer__io -: writer
)

test_notifyWinner =: 3 : 0
  notifyWinner__io '-'
  assert 'a tie' matches lastwritten__writer

  notifyWinner__io 'x'
  assert 'x won' matches lastwritten__writer

  notifyWinner__io 'o'
  assert 'o won' matches lastwritten__writer
)

test_promptForPlayAI =: 3 : 0
  promptForPlayAI__io ''
  assert 'AI.*opponent' matches lastwritten__writer
)

test_promptForPlayFirst =: 3 : 0
  promptForPlayFirst__io ''
  assert 'play first' matches lastwritten__writer
)

test_promptForPlayerSymbol =: 3 : 0
  promptForPlayerSymbol__io ''
  assert '[Xx].*or.*[Oo]' matches lastwritten__writer
)

test_promptForBoardSize =: 3 : 0
  promptForBoardSize__io ''
  assert 'size board' matches lastwritten__writer
)

test_promptForPlayAgain =: 3 : 0
  promptForPlayAgain__io ''
  assert 'play again' matches lastwritten__writer
)

test_itGetsyes =: 3 : 0
  nextLine__reader =: 'yes'
  
  assert getYorN__io ''
)

test_itGetsYes =: 3 : 0
  nextLine__reader =: 'Yes'
  
  assert getYorN__io ''
)

test_itGetsno =: 3 : 0
  nextLine__reader =: 'no'
  
  assert -. getYorN__io ''
)

test_itGetsNo =: 3 : 0
  nextLine__reader =: 'No'
  
  assert -. getYorN__io ''
)

test_itGetsX =: 3 : 0
  nextLine__reader =: 'X', LF
  
  assert 'x' -: getXorO__io ''
)

test_itGetsx =: 3 : 0
  nextLine__reader =: 'x', LF
  
  assert 'x' -: getXorO__io ''
)

test_itGetso =: 3 : 0
  nextLine__reader =: 'whhhhhat?'
  
  assert 'o' -: getXorO__io ''
)

test_itGetsTheBoardSize =: 3 : 0
  nextLine__reader =: '5', LF
  
  assert 5 -: getBoardSize__io ''
)

test_itDefaultsToABoardSizeOf3 =: 3 : 0
  nextLine__reader =: 'hello world'
  
  assert 3 -: getBoardSize__io ''
)

test_minBoardSizeIs3 =: 3 : 0
  nextLine__reader =: 'asdf2asdf'
  
  assert 3 -: getBoardSize__io ''
)
