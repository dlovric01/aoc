bool checkSpecialCharacter(String character) {
  RegExp specialCharacterRegex = RegExp(r'[^\w\s.]');

  return specialCharacterRegex.hasMatch(character);
}

List<int> extractNumbers(String inputString) {
  RegExp regExp = RegExp(r'\d+');
  Iterable<RegExpMatch> matches = regExp.allMatches(inputString);

  List<int> numbersList =
      matches.map((match) => int.parse(match.group(0)!)).toList();

  return numbersList;
}

int sumAllMatchingPatterns(String contents) {
  var sum = 0;
  List<String> lines = contents.split('\n');

  for (int i = 0; i < lines.length; i++) {
    final numbers = extractNumbers(lines[i]);
    var line = lines[i];

    for (var number in numbers) {
      final startIndex = line.indexOf(number.toString());
      final endIndex = startIndex + number.toString().length - 1;
      final startIndexChecker = startIndex > 0 ? startIndex - 1 : 0;
      final endIndexChecker =
          endIndex <= line.length - 2 ? endIndex + 1 : endIndex;

      final check = checkSpecialCharacter(line[startIndexChecker]) ||
          checkSpecialCharacter(line[endIndexChecker]);

      if (check) {
        sum = sum + number;
      } else {
        final startIndexChecker = startIndex > 0 ? startIndex - 1 : 0;
        final endIndexChecker =
            endIndex < line.length - 1 ? endIndex + 2 : endIndex + 1;

        final previousLineIndex = i > 0 ? i - 1 : 0;
        final nextLineIndex = i < lines.length - 1 ? i + 1 : i;

        final checkPreviousRow = checkSpecialCharacter(lines[previousLineIndex]
            .substring(startIndexChecker, endIndexChecker));
        final checkNextRow = checkSpecialCharacter(
            lines[nextLineIndex].substring(startIndexChecker, endIndexChecker));

        if (checkPreviousRow || checkNextRow) {
          sum = sum + number;
        }
      }
      line = line.replaceRange(
          startIndex, endIndex + 1, '.' * number.toString().length);
    }
  }
  return sum;
}
