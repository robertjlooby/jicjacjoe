load 'spec/spec_helper.ijs'
load 'src/console_reader.ijs'

before_each =: 3 : 0
  fileno =: 1!:21 <'temp'
  reader =: fileno conew 'ConsoleReader'
)

after_each =: 3 : 0
  1!:55 fileno
)

test_itReadsFromTheGivenInputStream =: 3 : 0
  test_text =: 'this is some test text'
  test_text (1!:2) fileno

  assert test_text = read__reader ''
)

test_itDefaultsToReadingFromSTDIN =: 3 : 0
  reader =: '' conew 'ConsoleReader'
  assert fileno__reader = 3
)

test_itGetsyes =: 3 : 0
  'yes' (1!:2) fileno
  
  assert getYorN__reader ''
)

test_itGetsYes =: 3 : 0
  'Y' (1!:2) fileno
  
  assert getYorN__reader ''
)

test_itGetsno =: 3 : 0
  'no' (1!:2) fileno
  
  assert -. getYorN__reader ''
)

test_itGetsNo =: 3 : 0
  'N' (1!:2) fileno
  
  assert -. getYorN__reader ''
)

test_itGetsX =: 3 : 0
  'X' (1!:2) fileno
  
  assert 'x' = getXorO__reader ''
)

test_itGetsx =: 3 : 0
  'x' (1!:2) fileno
  
  assert 'x' = getXorO__reader ''
)

test_itGetso =: 3 : 0
  'whhhhhat?' (1!:2) fileno
  
  assert 'o' = getXorO__reader ''
)

test_itGetsTheBoardSize =: 3 : 0
  '5' (1!:2) fileno
  
  assert 5 = getBoardSize__reader ''
)

test_itDefaultsToABoardSizeOf3 =: 3 : 0
  'hello world!' (1!:2) fileno
  
  assert 3 -: getBoardSize__reader ''
)

test_minBoardSizeIs3 =: 3 : 0
  'asdf2asdf' (1!:2) fileno
  
  assert 3 -: getBoardSize__reader ''
)
