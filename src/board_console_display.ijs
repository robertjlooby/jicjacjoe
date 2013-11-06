coclass 'BoardConsoleDisplay'

create =: 3 : 0
  writer =: y

  vdiv =: 3 1 $ '|'
  hdiv =: 1 3 $ '-'
  cdiv =: '+'
  ecel =: 3 3 $ ' '
  xcel =: 3 3 $ '\ / X / \'
  ocel =: 3 3 $ '/-\| |\-/'
)

alt =: ,.

celFor =: 3 : 0"0
  if.     y = 'x' do. xcel
  elseif. y = 'o' do. ocel
  elseif. 1       do. ecel
  end.
)

rowFor =: 3 : 0"1
  row =. 3 0 $ ''
  for_cel. celFor y do.
    row =. row ,. vdiv ,. cel
  end.
  }."1 row
)

boardFor =: 3 : 0
  size =. 0{ $ y

  horizontalDiv =. hdiv
  for. i. <: size do.
    horizontalDiv =. horizontalDiv ,. cdiv ,. hdiv
  end.
    
  width =. <: size * 4
  board =. (0, width) $ ''
  for_row. rowFor y do.
    board =. board , horizontalDiv, row
  end.
  }. board
)

display =: 3 : 0
  write__writer boardFor y
)

destroy =: codestroy
