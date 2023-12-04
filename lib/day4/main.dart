import 'package:aoc/read_input.dart';

void main(List<String> args) {
  readInput('lib/day4/input.txt').then((contents) {
    List<String> games = contents.split('\n');
    int p1 = 0;
    int p2 = 0;

    var listOfCards = List.generate(games.length, (index) => 1);

    for (var i = 0; i < games.length; i++) {
      var cardValue = 1;

      final winningList = games[i]
          .substring(games[i].indexOf(':') + 1, games[i].indexOf('|'))
          .split(' ')
        ..removeWhere((element) => element.isEmpty);

      final myList = games[i].substring(games[i].indexOf('|') + 1).split(' ')
        ..removeWhere((element) => element.isEmpty);

      final matchingNumbersLenght = winningList
          .where((number) => myList.contains(number))
          .toList()
          .length;

      for (var i = 1; i < matchingNumbersLenght; i++) {
        cardValue = cardValue * 2;
      }

      if (matchingNumbersLenght == 0) {
        cardValue = 0;
      }

      p1 = p1 + cardValue;

      final rep = listOfCards[i];
      for (var c = 0; c < rep; c++) {
        for (var v = 0; v < matchingNumbersLenght; v++) {
          try {
            listOfCards[i + v + 1]++;
          } catch (e) {
            break;
          }
        }
      }
    }
    p2 = listOfCards.fold(
        0, (previousValue, element) => previousValue + element);

    print(p1);
    print(p2);
  });
}
