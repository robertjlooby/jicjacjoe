arreq_z_ =: 4 : '*/ , x = y'
display_z_ =: 3 : 'y (1!:2) 2'

require 'general/unittest'
run_tests_z_ =: 3 : 0
  for_file. 1!:0 'spec/*_test.ijs' do.
    unittest 'spec/', > 0{file
  end.
)
