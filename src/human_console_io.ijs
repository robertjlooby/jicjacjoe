coclass 'HumanConsoleIO'

create =: 3 : 0
  'reader writer' =: y
)

promptForMove =: 3 : 0
  write__writer 'Where would you like to move? (enter the cell number, ex. 0-8 for a 3x3 game)'
)

notifyInvalidCell =: 3 : 0
  write__writer 'The cell you entered is not valid!'
)

readMove =: 3 : 0
  read__reader ''
)

destroy =: codestroy
