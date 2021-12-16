import 'dart:collection';
import 'dart:math';

class GameLogic {
  HashSet<int> specialCards = HashSet();
  bool CheckForRemainingElements(int count) {
    return specialCards.length == count;
  }

  void GenerateNewSpecialElement(int count) {
    var rnd = Random();
    var number = count + 1;
    while (specialCards.contains(number));
    {
      number = rnd.nextInt(count);
    }
    currentIndex = number;
    specialCards.add(currentIndex);
    print(currentIndex);
  }

  bool CheckForValidElement(int index) {
    return index == currentIndex;
  }

  var currentIndex;
}
