import 'dart:collection';

class Symbol {
  String _1 = "";
  String _2 = "";
  int _3 = 0;

  Symbol(String _1_, String _2_, int _3_) {
    _1 = _1_;
    _2 = _2_;
    _3 = _3_;
  }
}

class Symbols {
  final Map<String, int> symbols = HashMap();

  int nextSym = 0;
  int currentId = 0;

  String name(Symbol sym) {
    return sym._1;
  }

  int id(Symbol sym) {
    return sym._3;
  }

  Symbol symbol(String sym) {
    return Symbol(sym, sym, symbols.putIfAbsent(sym, () => nextSym += 1));
  }

  Symbol symbolAlias(String sym, String sym_) {
    return Symbol(sym, sym_, symbols.putIfAbsent(sym, () => nextSym += 1));
  }

  Symbol generateName(String sym) {
    String sym_ = "${sym}_gen_${currentId}";
    String sym__ = "${sym}g_gen_${currentId}";

    currentId += 1;

    return symbolAlias(sym_, sym__);
  }

  Symbol generate() {
    return generateName('');
  }

  int compare(Symbol sym1, Symbol sym2) {
    if (sym1._3 < sym2._3) {
      return -1;
    } else if (sym1._3 > sym2._3) {
      return 1;
    } else {
      return 0;
    }
  }
}
