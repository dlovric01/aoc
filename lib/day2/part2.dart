class Day2Part2 {
  int partTwo(List<String> games) {
    int sumOfMultiplications = 0;
    for (var i = 0; i < games.length; i++) {
      sumOfMultiplications =
          sumOfMultiplications + gameMultiplication(games[i]);
    }
    return sumOfMultiplications;
  }

  int gameMultiplication(String inpt) {
    var input = inpt.substring(inpt.indexOf(':') + 1);

    input = input.replaceAll(';', ',');
    final items = input.split(',');

    int green = 0;
    int red = 0;
    int blue = 0;

    for (var element in items) {
      if (element.contains('green')) {
        int item = int.parse(element.split(' ')[1]);
        if (item > green) {
          green = item;
        }
      } else if (element.contains('red')) {
        int item = int.parse(element.split(' ')[1]);
        if (item > red) {
          red = item;
        }
      } else if (element.contains('blue')) {
        int item = int.parse(element.split(' ')[1]);
        if (item > blue) {
          blue = item;
        }
      }
    }
    return green * red * blue;
  }
}
