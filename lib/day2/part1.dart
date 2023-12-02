import 'dart:io';

void main() {
  readInput().then((contents) {
    List<String> lines = contents.split('\n');
    int sum = 0;
    for (var i = 0; i < lines.length; i++) {
      final check = checkIfValid(lines[i]);
      if (check) {
        sum = sum + i + 1;
      }
    }
    print(sum);
  });
}

Future<String> readInput() async {
  final file = File('lib/day2/input.txt');
  return file.readAsString();
}

bool checkIfValid(String inpt) {
  var input = inpt.substring(inpt.indexOf(':') + 1);

  input = input.replaceAll(';', ',');
  final items = input.split(',');

  for (var element in items) {
    if (element.contains('green')) {
      int item = int.parse(element.split(' ')[1]);
      if (item > 13) {
        return false;
      }
    } else if (element.contains('red')) {
      int item = int.parse(element.split(' ')[1]);
      if (item > 12) {
        return false;
      }
    } else if (element.contains('blue')) {
      int item = int.parse(element.split(' ')[1]);
      if (item > 14) {
        return false;
      }
    }
  }

  return true;
}
