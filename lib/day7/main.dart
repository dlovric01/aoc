import 'dart:io';

const cards = [
  'J',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  'T',
  'J',
  'Q',
  'K',
  'A'
];

void main(List<String> args) {
  final file = File('lib/day7/input.txt').readAsStringSync();
  final lines = file.split('\n');
  final hands = lines.map((e) => e.split(' ')[0]).toList();
  final bidsMap = lines.map((value) {
    var splitValue = value.split(' ');
    return {splitValue[0]: splitValue[1]};
  }).toList();
  var hand = hands[0];
  final reorderHands = [];

  for (var j = 0; j < hands.length; j++) {
    for (var i = 0; i < hands.length; i++) {
      final currentCard = hands[i];

      if (getCardType(currentCard).value < getCardType(hand).value) {
        if (reorderHands.contains(currentCard)) continue;
        hand = currentCard;
      } else if (getCardType(currentCard).value > getCardType(hand).value) {
        continue;
      } else {
        if (reorderHands.contains(currentCard)) continue;

        for (var v = 0; v < currentCard.length; v++) {
          final currentCardIndex = cards.indexOf(currentCard[v]);
          final cardIndex = cards.indexOf(hand[v]);
          if (currentCardIndex == cardIndex) {
            continue;
          } else if (currentCardIndex < cardIndex) {
            hand = currentCard;
            break;
          } else {
            break;
          }
        }
      }
    }
    reorderHands.add(hand);
    final filteredList = hands.where((e) => !reorderHands.contains(e)).toList();
    if (filteredList.isNotEmpty) {
      hand = filteredList.first;
    }
  }
  print(reorderHands);

  final reorderedBidsMap = {
    for (var hand in reorderHands) hand: bidsMap[hands.indexOf(hand)]
  };
  print(reorderedBidsMap.values);
  var result = 0;
  for (var i = 0; i < reorderedBidsMap.length; i++) {
    result +=
        int.parse(reorderedBidsMap[reorderHands[i]]!.values.first) * (i + 1);
  }
  print(result);
}

CardType getCardType(String hand) {
  var cardType = CardType.highCard;

  // Count occurrences of each rank
  var rankCount = <String, int>{};
  var jCards = 0;
  for (var card in hand.split('')) {
    if (card == 'J') {
      jCards++;
    } else {
      rankCount[card] = (rankCount[card] ?? 0) + 1;
    }
  }

  // Check for different poker hand types
  var pairs = 0;
  var threeOfKind = false;
  var fourOfKind = false;
  var fiveOfKind = false;

  rankCount = sortMapByValue(rankCount);

  if (rankCount.isNotEmpty) {
    String firstKey = rankCount.keys.first;
    rankCount[firstKey] = rankCount.values.first + jCards; // Add 2 to the value
  } else {
    rankCount['A'] = jCards;
  }

  rankCount.forEach((rank, count) {
    if (count == 2) {
      pairs++;
    } else if (count == 3) {
      threeOfKind = true;
    } else if (count == 4) {
      fourOfKind = true;
    } else if (count == 5) {
      fiveOfKind = true;
    }
  });

  // Determine the card type based on the counts
  if (fiveOfKind) {
    cardType = CardType.fiveOfKind;
  } else if (fourOfKind) {
    cardType = CardType.fourOfKind;
  } else if (threeOfKind && pairs == 1) {
    cardType = CardType.fullHouse;
  } else if (threeOfKind) {
    cardType = CardType.threeOfKind;
  } else if (pairs == 2) {
    cardType = CardType.twoPairs;
  } else if (pairs == 1) {
    cardType = CardType.onePair;
  } else {
    cardType = CardType.highCard;
  }

  return cardType;
}

enum CardType {
  fiveOfKind(7),
  fourOfKind(6),
  fullHouse(5),
  threeOfKind(4),
  twoPairs(3),
  onePair(2),
  highCard(1);

  const CardType(this.value);

  final int value;
}

Map<String, int> sortMapByValue(Map<String, int> inputMap) {
  var sortedEntries = inputMap.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  return Map.fromEntries(sortedEntries);
}
