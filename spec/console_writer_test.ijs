load 'spec/spec_helper.ijs'
load 'src/console_writer.ijs'

before_each =: 3 : 0
  fileno =: 1!:21 <'temp'
  writer =: fileno conew 'ConsoleWriter'
  defaultWriter =: '' conew 'ConsoleWriter'
)

after_each =: 3 : 0
  destroy__writer ''
  destroy__defaultWriter ''
)

after_each =: 3 : 0
  1!:55 fileno
)

test_itWritesToTheGivenOutputStreamWithLFs =: 3 : 0
  test_text =. 'this is some test text'
  write__writer test_text
  assert (1!:1 fileno) -: test_text, LF
)

test_itDefaultsToWritingToSTDOUT =: 3 : 0
  assert fileno__defaultWriter -: 4
)
