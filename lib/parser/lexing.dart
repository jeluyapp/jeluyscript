import 'dart:typed_data';

class Position {
  String posFname = ""; // filename
  int posLnum = 0; // line number
  int posBol = 0; // offset from beginning of line
  int posCnum = 0; // number of characters between the beginning of the lexbuf and the position

  Position(String posFname_, int posLnum_, int posBol_, int posCnum_) {
    posFname = posFname_;
    posLnum = posLnum_;
    posBol = posBol_;
    posCnum = posCnum_;
  }
}

class LexerBuffer {
  Uint8List lexBuffer = Uint8List(0);
  Position lexCurrentPos = Position("", 0, 0, 0);
  Position lexStartPos = Position("", 0, 0, 0);
  int lexAbsolutePos = 0;
  int lexLastPos = 0;
  int lexLastAction = 0;
  bool lexEOFReached = false;
  Int32List lexMem = Int32List(0);

  LexerBuffer(bool isCodeEmpty, Position startPos) {
    lexEOFReached = isCodeEmpty;
    lexCurrentPos = startPos;
    lexStartPos = startPos;
  }

  int lexBufferLen() {
    return lexBuffer.length;
  }
}

