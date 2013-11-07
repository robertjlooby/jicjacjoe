coclass 'MockBoardDisplay'

create =: 3 : 0
  timesDisplayed =: 0
)

display =: 3 : 0
  displayLastCalledWith =: y
  timesDisplayed =: >: timesDisplayed
)

destroy =: codestroy
