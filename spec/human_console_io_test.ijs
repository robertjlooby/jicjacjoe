load 'spec/spec_helper.ijs'
load 'spec/mock_reader.ijs'
load 'spec/mock_writer.ijs'
load 'src/human_console_io.ijs'

before_all =: 3 : 0
  reader =: '' conew 'MockReader'
  writer =: '' conew 'MockWriter'
  io =: (reader, writer) conew 'HumanConsoleIO'
)

test_initializesWithReaderAndWriter =: 3 : 0
  assert reader__io -: reader
  assert writer__io -: writer
)

test_promptForMove =: 3 : 0
  promptForMove__io ''
  assert '[Ww]here.*move.*\?' matches lastwritten__writer
)

test_notifyInvalidCell =: 3 : 0
  notifyInvalidCell__io ''
  assert 'not.*valid' matches lastwritten__writer
)

test_readMove =: 3 : 0
  nextLine__reader =: '4'
  assert '4' -: readMove__io ''
)
