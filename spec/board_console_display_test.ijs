load 'spec/spec_helper.ijs'
load 'spec/mock_writer.ijs'
load 'src/board_console_display.ijs'

before_all =: 3 : 0
  mockwriter =: '' conew 'MockWriter'
  BCD =: mockwriter conew 'BoardConsoleDisplay'

  ex =: xcel__BCD
  oh =: ocel__BCD
  em =: ecel__BCD
  vd =: vdiv__BCD
  hd =: hdiv__BCD
  cd =: cdiv__BCD
  emptyRow  =: em,. vd,. em,. vd,. em
  rowDiv    =: hd,. cd,. hd,. cd,. hd
  emptyRow4 =: em,. vd,. em,. vd,. em,. vd,. em
  rowDiv4   =: hd,. cd,. hd,. cd,. hd,. cd,. hd
  
  emptyBoard  =: emptyRow , rowDiv , emptyRow , rowDiv , emptyRow
  emptyBoard4 =: emptyRow4 , rowDiv4 , emptyRow4 , rowDiv4 , emptyRow4, rowDiv4, emptyRow4
)

test_celForX =: 3 : 0
  assert xcel__BCD -: celFor__BCD 'x'
)

test_celForO =: 3 : 0
  assert ocel__BCD -: celFor__BCD 'o'
)

test_celForEmpty =: 3 : 0
  assert ecel__BCD -: celFor__BCD ' '
  assert ecel__BCD -: celFor__BCD '-'
)

test_celForActsOn0Cells =: 3 : 0
  assert (ex, oh,: em) -: celFor__BCD 'xo-'
)

test_rowForEmpty =: 3 : 0
  assert emptyRow  -: rowFor__BCD '---'
  assert emptyRow4 -: rowFor__BCD '----'
)

test_rowForWithXOs =: 3 : 0
  assert (ex,. vd,. oh,. vd,. oh,. vd,. ex) -: rowFor__BCD 'xoox'
)

test_rowForActsOn1Cells =: 3 : 0
  assert (emptyRow ,: emptyRow) -: rowFor__BCD 2 3 $ '-'
)

test_boardForEmpty =: 3 : 0
  assert emptyBoard -: boardFor__BCD 3 3 $ '-'
)

test_displayAnEmptyBoard =: 3 : 0
  state =. 3 3 $ '-'
  display__BCD state
  assert emptyBoard -: lastwritten__mockwriter

  state =. 4 4 $ '-'
  display__BCD state
  assert emptyBoard4 -: lastwritten__mockwriter
)
