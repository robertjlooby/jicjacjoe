coclass 'ConsoleWriter'

create =: 3 : 0
  fileno =: y
  if. -. # fileno do.
    fileno =: 4
  end.
  output =: (1!:2) & fileno
  ''
)

write =: 3 : 0
  output ,"1&LF y
)

destroy =: codestroy
