load 'spec/spec_helper.ijs'
load 'spec/mock_io.ijs'
load 'src/human_player.ijs'

before_each =: 3 : 0
  mockio =: '' conew 'MockIO'
  xplayer =: (mockio; 'x') conew 'HumanPlayer'
  oplayer =: (mockio; 'o') conew 'HumanPlayer'
)

test_playerInitializesWithIOAndSymbol =: 3 : 0
  assert io__xplayer -: mockio
  assert symbol__xplayer -: 'x'

  assert io__oplayer -: mockio
  assert symbol__oplayer -: 'o'
)

test_getMovePromptsPlayerAndReadsMove =: 3 : 0
  getMove__xplayer 3 3 $ '-'
  assert ('readMove'; 'promptForMove'; 'none') -: lastCalled__mockio
)

test_getMoveRePromptsIfValueGivenIsTooLarge =: 3 : 0
  responses__mockio =: '16'; '0'
  assert (0 0) -: getMove__xplayer 4 4 $ '-'
  assert ('readMove'; 'promptForMove'; 'notifyInvalidCell'; 'readMove'; 'promptForMove'; 'none') -: lastCalled__mockio
)

test_getMoveRePromptsIfValueGivenIsTooSmall =: 3 : 0
  responses__mockio =: '-1'; '3'
  assert (0 3) -: getMove__xplayer 4 4 $ '-'
  assert ('readMove'; 'promptForMove'; 'notifyInvalidCell'; 'readMove'; 'promptForMove'; 'none') -: lastCalled__mockio
)

test_getMoveRePromptsIfCellGivenIsFilled =: 3 : 0
  responses__mockio =: '5'; '8'
  state =. 3 3 $ '-'
  state =. 'x' (<1 2)} state
  assert (2 2) -: getMove__xplayer state
  assert ('readMove'; 'promptForMove'; 'notifyInvalidCell'; 'readMove'; 'promptForMove'; 'none') -: lastCalled__mockio
)

test_getMoveParsesOutIntegerPart =: 3 : 0
  responses__mockio =: '  ahh 5.32asdf'; '8'
  state =. 3 3 $ '-'
  assert (1 2) -: getMove__xplayer state
)
