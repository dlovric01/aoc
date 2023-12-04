import 'dart:io';

void main(List<String> args) {
  final input = File('lib/day4/example.txt').readAsStringSync();
  List<String> games = input.split('\n');
  int p1 = 0;
  var listOfCards = List.generate(games.length, (index) => 1);

  for (var i = 0; i < games.length; i++) {
    final game = games[i];
    var parts = game.substring(game.indexOf(':') + 1).split('|');
    var first = parts[0].trim().split(RegExp(r'\s+'));
    var rest = parts[1].trim().split(RegExp(r'\s+'));
    var val = first.toSet().intersection(rest.toSet()).length;
    var cardValue = val == 0 ? 0 : 1 << (val - 1);
    p1 += cardValue;
    for (var c = 0; c < listOfCards[i]; c++) {
      for (var v = 0; v < val; v++) {
        if (i + v + 1 < listOfCards.length) {
          listOfCards[i + v + 1]++;
        } else {
          break;
        }
      }
    }
  }
  var p2 =
      listOfCards.fold(0, (previousValue, element) => previousValue + element);

  print(p1);
  print(p2);
}
