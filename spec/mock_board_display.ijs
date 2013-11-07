coclass 'MockBoardDisplay'

create =: 3 : 0
  timesDisplayed =: 0
)

display =: 3 : 0
  timesDisplayed =: >: timesDisplayed
)

destroy =: codestroy
