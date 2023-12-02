import 'dart:io';

import 'package:aoc/day2/part1.dart';
import 'package:aoc/day2/part2.dart';

void main() {
  readInput().then((contents) {
    List<String> games = contents.split('\n');

    //  part 1
    final result1 = partOne(games);
    print(result1);

    //  part 2
    final result2 = partTwo(games);
    print(result2);
  });
}

Future<String> readInput() async {
  final file = File('lib/day2/input.txt');
  return file.readAsString();
}
