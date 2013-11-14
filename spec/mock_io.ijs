coclass 'MockIO'

create =: 3 : 0
  lastCalled =: 'none'
  responses =: '0'; '1'; '2'
)

nextResponse =: 3 : 0
  response =. > {. responses
  responses =: }. responses
  response
)

pushCalled =: 3 : 0
  lastCalled =: y; lastCalled
)

getBoardSize =: 3 : 0
  pushCalled 'getBoardSize'
  nextResponse ''
)

getXorO =: 3 : 0
  pushCalled 'getXorO'
  nextResponse ''
)

getYorN =: 3 : 0
  pushCalled 'getYorN'
  nextResponse ''
)

notifyInvalidCell =: 3 : 0
  pushCalled 'notifyInvalidCell'
)

notifyWinner =: 3 : 0
  pushCalled 'notifyWinner'
)

promptForAI =: 3 : 0
  pushCalled 'promptForAI'
)

promptForBoardSize =: 3 : 0
  pushCalled 'promptForBoardSize'
)

promptForMove =: 3 : 0
  pushCalled 'promptForMove'
)

promptForPlayAgain =: 3 : 0
  pushCalled 'promptForPlayAgain'
)

promptForPlayFirst =: 3 : 0
  pushCalled 'promptForPlayFirst'
)

readMove =: 3 : 0
  pushCalled 'readMove'
  nextResponse ''
)

destroy =: codestroy
