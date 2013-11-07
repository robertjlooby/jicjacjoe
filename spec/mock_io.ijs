coclass 'MockIO'

create =: 3 : 0
  lastCalled =: 'none'
  responses =: '0'; '1'; '2'
)

promptForMove =: 3 : 0
  lastCalled =: 'promptForMove'; lastCalled
)

notifyInvalidCell =: 3 : 0
  lastCalled =: 'notifyInvalidCell'; lastCalled
)

readMove =: 3 : 0
  lastCalled =: 'readMove'; lastCalled
  response =. > {. responses
  responses =: }. responses
  response
)

destroy =: codestroy
