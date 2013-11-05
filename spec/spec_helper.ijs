arreq_z_ =: 4 : '*/ , x = y'
display_z_ =: 3 : 'y (1!:2) 2'

require 'general/unittest'
runSpec =: 3 : 0
  unittest 'spec/', y
)
runSpecs_z_ =: 3 : 0
  if. # y do.
    files =. < y, '_test.ijs'
  else.
    files =. 1!:0 'spec/*_test.ijs'
  end.

  results =. ''
  for_file. files  do.
    results =. results , runSpec > 0{file
  end.
  results
)
