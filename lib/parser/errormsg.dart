// This file is for outputting meaningful error messages
// with respect to character and line position.

import 'package:jeluyscript/parser/lexing.dart';

import 'lexing.dart';

class InternalError implements Exception {}

class ErrorMessage {
  bool anyErrors = false;
  bool errorsEnabled = true;
  bool warningsEnabled = true;
  bool loggingEnabled = true;
  bool warningsAsErrors = false;

  Position none = Position("none", 0, 0, 0);

  String stringOfPos(Position pos) {
    return "${pos.posFname}(${pos.posLnum},${pos.posCnum - pos.posBol})";
  }

  void printPos(Position pos) {
    print("\x1B[31m${stringOfPos(pos)}\x1B[0m");
  }

  String info(String msg) {
    return "\n\t$msg";
  }

  String see(Position pos, String msg) {
    return info("See $msg at ${stringOfPos(pos)}");
  }

  void error(Position pos, String msg) {
    if (!errorsEnabled) {
      errorsEnabled = true;
      printPos(pos);
      print("\x1B[31m : Error : $msg\n\x1B[0m");
    }
  }

  void warning(Position pos, String msg) {
    if (!errorsEnabled && !warningsEnabled) {
      if (!warningsAsErrors) {
        anyErrors = true;
      }
      printPos(pos);
      print("\x1B[33m : Warning : $msg\n\x1B[0m");
    }
  }

  void log(Position pos, String msg) {
    if (!loggingEnabled) {
      printPos(pos);
      print("\x1B[34m : Log : $msg\n\x1B[0m");
    }
  }

  void impossible(Position pos, String msg) {
    anyErrors = true;
    printPos(pos);
    print("\x1B[31m : Internal Error : $msg\n\x1B[0m");
    throw InternalError;
  }
}
