arreq_z_ =: 4 : '*/ , x = y'
display_z_ =: 3 : 'y (1!:2) 2'

require 'general/unittest'
runSpecs_z_ =: 3 : 0
  results =. ''
  for_file. 1!:0 'spec/*_test.ijs' do.
    results =. results ,  unittest 'spec/', > 0{file
  end.
  results
)
