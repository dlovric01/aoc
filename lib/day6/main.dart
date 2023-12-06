import 'dart:io';

void main(List<String> args) {
  final file = File('lib/day6/input.txt').readAsStringSync().split('\n');
  part1(file);
  part2(file);
}

void part2(List<String> file) {
  final time = int.parse(file[0].split(':')[1].trim().replaceAll(' ', ''));
  final distance = int.parse(file[1].split(':')[1].trim().replaceAll(' ', ''));
  var numOfBeats = 0;

  for (var j = 0; j < time; j++) {
    final b = j * (time - j);
    if (b > distance) {
      numOfBeats++;
    }
  }
  print(numOfBeats);
}

void part1(List<String> file) {
  final times = file[0].split(':')[1].trim().split(' ')
    ..removeWhere((element) => element.isEmpty);
  final distances = file[1].split(':')[1].trim().split(' ')
    ..removeWhere((element) => element.isEmpty);

  print('object');
  var result = 0;

  for (var i = 0; i < times.length; i++) {
    var numOfBeats = 0;

    final time = int.parse(times[i]);
    final distance = int.parse(distances[i]);

    for (var j = 0; j < time; j++) {
      final b = j * (time - j);
      if (b > distance) {
        numOfBeats++;
      }
    }
    print(numOfBeats);
    result = (result == 0 ? 1 : result) * numOfBeats;
  }
  print(result);
}
