// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

void main(List<String> args) {
  final lines = File('lib/day9/input.txt').readAsStringSync().split('\n');
  var result = 0;

  for (var line in lines) {
    List<List<int>> _combinations = [line.split(' ').map(int.parse).toList()];
    while (!_combinations.last.every((element) => element == 0)) {
      final newRow = <int>[];
      for (var i = 0; i < _combinations.last.length - 1; i++) {
        newRow.add(_combinations.last[i + 1] - _combinations.last[i]);
      }
      _combinations.add(newRow);
    }

    for (var i = _combinations.length - 1; i > 0; i--) {
      _combinations[i - 1]
          .insert(0, _combinations[i - 1].first - _combinations[i].first);
    }

    for (var i = 0; i < _combinations.length - 1; i++) {
      // add to -1 index

    }
    print(_combinations);
    result += _combinations[0].first;
  }
  print(result);
}
