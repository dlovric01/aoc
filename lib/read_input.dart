import 'dart:io';

Future<String> readInput(String input) async {
  final file = File(input);
  return file.readAsString();
}
