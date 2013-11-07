coclass 'HumanPlayer'

create =: 3 : 0
  io =: >0{y
  symbol =: >1{y
)

getMove =: 3 : 0
  size =. {. $ y
  maxMove =. <: *: size
  promptForMove__io ''
  move =. ". readMove__io ''
  if. (move > maxMove) +. (move < 0) do.
    notifyInvalidCell__io ''
    move =. getMove y
  else.
    move =. (<. move % size), size | move
    if. -. '-' = (< move){ y do.
      notifyInvalidCell__io ''
      move =. getMove y
    end.
  end.
  move
)

destroy =: codestroy