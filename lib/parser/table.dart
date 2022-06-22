import 'symbol.dart';

import 'dart:collection';

class SymbolTable<T_0> {
  final Map<Symbol, T_0> symbols = HashMap();

  T_0? find(Symbol sym) {
    return symbols[sym];
  }

  void add(Symbol sym, T_0 value) {
    symbols.addAll({sym: value});
  }

  void iter(void Function(Symbol key, T_0 value) f) {
    symbols.forEach((key, value) {
      f(key, value);
    });
  }

  T_1 fold<T_1>(T_1 Function(Symbol key, T_0 value, T_1 right) f, T_1 initial) {
    var vertex = initial;

    symbols.forEach((key, value) {
      vertex = f(key, value, vertex);
    });

    return vertex;
  }

  void printTable(String Function(Symbol key, T_0 value) f) {
    iter((key, value) {
      print(f(key, value));
    });
  }
}
