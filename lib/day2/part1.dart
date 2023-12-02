int partOne(List<String> games) {
  int sum = 0;
  for (var i = 0; i < games.length; i++) {
    final check = checkIfValid(games[i]);
    if (check) {
      sum = sum + i + 1;
    }
  }
  print(sum);
  return sum;
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
