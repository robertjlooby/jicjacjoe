coclass 'ConsoleReader'

create =: 3 : 0
  fileno =: y
  if. -. # fileno do.
    fileno =: _
  end.
)

read =: 3 : 0
  if. fileno -: _ do.
    result =. shell 'read tttresult; echo "$tttresult"'
  else.
    result =. (1!:1) fileno
  end.
  result
)

destroy =: codestroy
