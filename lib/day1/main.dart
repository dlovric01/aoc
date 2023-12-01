import 'dart:io';

void main() {
  readInput().then((contents) {
    List<String> lines = contents.split('\n');

    var sum = 0;
    for (int index = 0; index < lines.length; index++) {
      int number = getNumber(lines[index]);
      sum = sum + number;
    }

    print(sum);
  });
}

Future<String> readInput() async {
  final file = File('lib/day1/input.txt');
  return file.readAsString();
}

int getNumber(String line) {
  print(line);
  RegExp regExp = RegExp(r'\d');
  final str = line
      .replaceAll('one', 'one1one')
      .replaceAll('two', 'two2two')
      .replaceAll('three', 'three3three')
      .replaceAll('four', 'four4four')
      .replaceAll('five', 'five5five')
      .replaceAll('six', 'six6six')
      .replaceAll('seven', 'seven7seven')
      .replaceAll('eight', 'eight8eight')
      .replaceAll('nine', 'nine9nine');

  Iterable<Match> matches = regExp.allMatches(str);
  final numbers = matches.map((Match m) => int.parse(m.group(0)!)).toList();
  print(str);
  print(numbers);
  var result = '';
  if (numbers.length > 1) {
    result = numbers[0].toString() + numbers[numbers.length - 1].toString();
  } else if (numbers.length == 1) {
    result = numbers[0].toString() + numbers[0].toString();
  } else {
    result = '0';
  }
  print(result);
  return int.parse(result);
}
