import 'dart:io';

void main(List<String> args) async {
  String content = await File('lib/day5/input.txt').readAsString();
  final ls = content.trim().split('\n\n');

  final seeds = ls[0].split(': ')[1].split(' ').map(int.tryParse).toList();
  final maps = ls
      .sublist(1)
      .map((l) => l
          .split(':\n')[1]
          .split('\n')
          .map((n) => n.split(' ').map(int.parse).toList())
          .toList())
      .toList();

  final results = <int>[];

  for (var i = 0; i < seeds.length; i++) {
    var seed = seeds[i];
    for (var j = 0; j < maps.length; j++) {
      final map = maps[j];
      for (var k = 0; k < maps[j].length; k++) {
        final list = map[k];

        if (seed! >= list[1] && seed < list[1] + list[2]) {
          seed = seed + list[0] - list[1];
          break;
        } else {
          continue;
        }
      }
    }
    results.add(seed!);
  }
  print(results.reduce((value, element) => value < element ? value : element));
}
