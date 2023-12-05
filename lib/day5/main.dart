import 'dart:io';
import 'dart:async';

List<List<List<int>>> mapRanges = List.generate(7, (index) => []);

int get(int depth, int src) {
  for (List<int> range in mapRanges[depth]) {
    if (range[0] <= src && src < range[1]) {
      int newSrc = src - range[0] + range[2];
      return depth == 6 ? newSrc : get(depth + 1, newSrc);
    }
  }
  return depth == 6 ? src : get(depth + 1, src);
}

Future<void> main() async {
  String content = await File('lib/day5/input.txt').readAsString();
  List<String> ls = content.split('\n\n');

  List<int> seeds = ls[0].split(': ')[1].split(' ').map(int.parse).toList();
  List<List<List<int>>> maps = ls
      .sublist(1)
      .map((l) => l
          .split(':\n')[1]
          .split('\n')
          .map((n) => n.split(' ').map(int.parse).toList())
          .toList())
      .toList();

  for (int depth = 0; depth < maps.length; depth++) {
    for (List<int> m in maps[depth]) {
      mapRanges[depth].add([m[1], m[1] + m[2], m[0]]);
    }
  }

  print(seeds
      .map((seed) => get(0, seed))
      .reduce((value, element) => value < element ? value : element));
}
