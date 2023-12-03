import 'package:aoc/day3/part1.dart';
import 'package:aoc/read_input.dart';

void main(List<String> args) {
  readInput('lib/day3/input.txt').then((contents) {
    final part1result = sumAllMatchingPatterns(contents);
    print('Part 1: $part1result');
  });
}
