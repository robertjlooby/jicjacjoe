load 'spec/spec_helper.ijs'
load 'src/console_reader.ijs'

before_each =: 3 : 0
  fileno =: 1!:21 <'temp'
  reader =: fileno conew 'ConsoleReader'
)

after_each =: 3 : 0
  1!:55 fileno
)

test_itReadsFromTheGivenInputStream =: 3 : 0
  test_text =: 'this is some test text'
  test_text (1!:2) fileno

  assert test_text -: read__reader ''
)

test_itDefaultsToReadingFromSTDIN =: 3 : 0
  reader =: '' conew 'ConsoleReader'
  assert fileno__reader -: 3
)
