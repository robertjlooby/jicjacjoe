coclass 'HumanConsoleIO'

create =: 3 : 0
  reader =: 0{y
  writer =: 1{y
)

promptForMove =: 3 : 0
  write__writer 'Where would you like to move? (enter the cell number)'
)

notifyInvalidCell =: 3 : 0
  write__writer 'The cell you entered is not valid!'
)

readMove =: 3 : 0
  read__reader ''
)

destroy =: codestroy