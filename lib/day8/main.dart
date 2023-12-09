import 'dart:io';

void main(List<String> args) {
  final file = File('lib/day8/input.txt').readAsStringSync().split('\n');
  final instructions = file[0].split('');
  List<Map<String, List<String>>> listOfMaps = [];

  for (String inputString in file) {
    RegExp regExp = RegExp(r"(\w+) = \((\w+), (\w+)\)");
    RegExpMatch? match = regExp.firstMatch(inputString);
    if (match != null) {
      Map<String, List<String>> mapEntry = {
        match.group(1)!: [match.group(2)!, match.group(3)!],
      };
      listOfMaps.add(mapEntry);
    }
  }

  // part1(listOfMaps, instructions);
  part2(listOfMaps, instructions);
}

final alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

void part2(
    List<Map<String, List<String>>> listOfMaps, List<String> instructions) {
  var currentMaps =
      listOfMaps.where((element) => element.keys.first.endsWith('A')).toList();

  int j = 0;
  int stepCount = 0;
  var elements = List.generate(currentMaps.length, (index) => '');

  for (var i = 0; i < listOfMaps.length; i++) {
    final currentInstruction = instructions[j];
    for (var k = 0; k < currentMaps.length; k++) {
      if (currentInstruction == 'L') {
        elements[k] = currentMaps[k].values.first.first;
      } else {
        elements[k] = currentMaps[k].values.first.last;
      }
      currentMaps[k] =
          listOfMaps.firstWhere((el) => el.containsKey(elements[k]));
    }
    j++;
    if (j == instructions.length) {
      j = 0;
    }
    if (i == listOfMaps.length - 1) {
      i = 0;
    }
    print(elements);
    stepCount++;
    if (elements.every((element) => element.endsWith('Z'))) {
      break;
    }
  }
  print(stepCount);
}

void part1(
    List<Map<String, List<String>>> listOfMaps, List<String> instructions) {
  int j = 0;
  int stepCount = 0;
  var currentMap =
      listOfMaps.firstWhere((element) => element.containsKey('AAA'));
  var element = '';

  for (var i = 0; i < listOfMaps.length; i++) {
    final currentInstruction = instructions[j];
    if (currentInstruction == 'L') {
      element = currentMap.values.first.first;
    } else {
      element = currentMap.values.first.last;
    }

    currentMap = listOfMaps.firstWhere((el) => el.containsKey(element));
    j++;
    if (j == instructions.length) {
      j = 0;
    }
    if (i == listOfMaps.length - 1) {
      i = 0;
    }
    stepCount++;
    if (element == 'ZZZ') {
      break;
    }
  }
  print(stepCount);
}
