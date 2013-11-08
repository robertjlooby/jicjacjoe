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

destroy =: codestroy
