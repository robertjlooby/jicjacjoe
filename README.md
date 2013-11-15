jicjacjoe
=========

Tic-Tac-Toe implemented in J

Get [the J programming language](http://www.jsoftware.com)

How To Get The unittest Package
-------------------------------

1. run `<your J directory>/bin/jhs`
2. open your browser and go to http://127.0.0.1:65001/jijx
3. click link -> jal
4. click 'not installed'
5. check 'general/unittest'
6. click 'install selected'

How To Run The Tests
--------------------

1. git clone this project and cd to the jicjacjoe directory
2. run `<your J directory>/bin/jconsole`
3. run `load 'spec/spec_helper.ijs'`
4. then run `runSpecs ''` (may require installing packages) 
5. to run a single spec file (for example `spec/board_test.ijs`) run `runSpecs 'board'`

How To Play The Game
--------------------

1. run `<your J directory>/bin/jconsole`
2. run `load 'src/play_ttt.ijs'`
3. run `playTTT ''`
