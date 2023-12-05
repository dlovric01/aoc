import 'dart:io';

void main() {
  final input = File('lib/day5/input.txt').readAsStringSync();
  List<String> lines = input.split('\n');
  final seeds = lines.first.split(':')[1].trim().split(' ');

  List<int> values = [];

  for (var i = 0; i < seeds.length; i++) {
    var value = int.parse(seeds[i]);

    for (var j = 1; j < lines.length; j++) {
      final line = lines[j];

      if (line.isEmpty || !line.isDigit) {
        continue;
      } else {
        final soils = line.split(' ');
        if (value >= int.parse(soils[1]) &&
            value <= (int.parse(soils[1]) + int.parse(soils[2]))) {
          final sum = int.parse(soils[0]) - int.parse(soils[1]);
          value = value + sum;
          for (var k = j; k < lines.length; k++) {
            if (lines[k].isEmpty) {
              j = k;
              break;
            }
          }
        } else {
          continue;
        }
      }
    }
    values.add(value);
  }
  print(values.reduce((curr, next) => curr < next ? curr : next));
}

extension on String {
  bool get isDigit {
    return RegExp(r'\d').hasMatch(this);
  }
}
