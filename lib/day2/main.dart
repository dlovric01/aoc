import 'package:aoc/day2/part1.dart';
import 'package:aoc/day2/part2.dart';

import 'package:aoc/read_input.dart';

void main() {
  readInput('lib/day2/input.txt').then((contents) {
    List<String> games = contents.split('\n');

    //  part 1
    final result1 = partOne(games);
    print(result1);

    //  part 2
    final result2 = partTwo(games);
    print(result2);
  });
}
