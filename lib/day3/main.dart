import 'dart:collection';
import 'dart:io';

void main() {
  var D = File('lib/day3/input.txt').readAsStringSync().trim();
  var lines = D.split('\n');
  var G = [for (var line in lines) line.split('')];
  var R = G.length;
  var C = G[0].length;

  var nums = HashMap<String, List<int>>();
  var p1 = calculateP1(R, C, G, nums);
  print(p1);
  var p2 = calculateP2(nums);
  print(p2);
}

int calculateP1(
    int R, int C, List<List<String>> G, HashMap<String, List<int>> nums) {
  var p1 = 0;

  for (var r = 0; r < R; r++) {
    var gears = <String>{};
    var n = 0;
    var hasPart = false;

    for (var c = 0; c <= C; c++) {
      if (c < C && G[r][c].isDigit) {
        n = n * 10 + int.parse(G[r][c]);
        for (var rr in [-1, 0, 1]) {
          for (var cc in [-1, 0, 1]) {
            if (0 <= r + rr && r + rr < R && 0 <= c + cc && c + cc < C) {
              var ch = G[r + rr][c + cc];
              if (!ch.isDigit && ch != '.') {
                hasPart = true;
              }
              if (ch == '*') {
                gears.add('${r + rr},${c + cc}');
              }
            }
          }
        }
      } else if (n > 0) {
        for (var gear in gears) {
          nums[gear] ??= [];
          nums[gear]!.add(n);
        }
        if (hasPart) {
          p1 += n;
        }
        n = 0;
        hasPart = false;
        gears = {};
      }
    }
  }

  return p1;
}

int calculateP2(HashMap<String, List<int>> nums) {
  var p2 = 0;
  for (var v in nums.values) {
    if (v.length == 2) {
      p2 += v[0] * v[1];
    }
  }
  return p2;
}

extension on String {
  bool get isDigit {
    return RegExp(r'\d').hasMatch(this);
  }
}
