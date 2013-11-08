coclass 'ConsoleReader'

create =: 3 : 0
  fileno =: y
  if. -. # fileno do.
    fileno =: 3
  end.
)

read =: 3 : 0
  (1!:1) fileno
)

getYorN =: 3 : 0
  response =. read ''
  # '[Yy]' rxfirst response
)

getXorO =: 3 : 0
  response =. read ''
  isx =. # '[Xx]' rxfirst response
  isx { 'ox'
)

getBoardSize =: 3 : 0
  response =. read ''
  size =. 4". '[[:digit:]]+' rxfirst response
  if. (size < 3) +. 0 = # size do.
    size =. 3
  end.
  size
)

destroy =: codestroy
