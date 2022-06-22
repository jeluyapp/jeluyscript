import 'lexing.dart';
import 'dart:typed_data';

const digit = "1234567890";
const octal = "12345670";
const hex = "${digit}ABCDEFabcdef";
const schar =
    '+' '-' '*' '/' '^' '<' '>' '=' '`' '\'' '?' '@' '#' '\$' '&' '!' '_' '~';
const schar1 =
    '+' '-' '/' '^' '<' '>' '=' '`' '\'' '?' '@' '#' '\$' '&' '!' '_' '~';
const schar2 =
    '+' '-' '*' '^' '<' '>' '=' '`' '\'' '?' '@' '#' '\$' '&' '!' '~';
const fchar = ' ' '\t' '\x0b' '\x0d';
const pchar = '\u{040}' '!"#\$%&' '(' '[' ']^_`abcdefghijklmnopqrstuvwxyz{|}~';
const lcase = 'abcdefghijklmnopqrstuvwxyz';
const ucase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const idchar = digit + schar + lcase + ucase;
const idchar1 = digit + schar1 + lcase + ucase;
const wspace = ' ' '\t' '\r';

class Lplex {
  LexerBuffer lexbuf = LexerBuffer(false, Position("none", 0, 0, 0));

  Lplex(String fileName, Uint8List file) {
    lexbuf = LexerBuffer(file.length <= 1, Position(fileName, 0, 0, 0));
  }

  void setFileName(String fileName) {
    lexbuf.lexCurrentPos.posFname = fileName;
  }

  // void incrline() {

  // }
}
