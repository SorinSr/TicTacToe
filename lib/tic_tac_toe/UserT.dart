class UserT {
  List<int> tapHistory = new List.empty(growable: true);

  List<List<int>> listOfPossibleSolutions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ];

  bool winVariable = false;

  void verification({required int totalNumberOfTaps, required int index}) {
    tapHistory.add(index);
    tapHistory.sort();
    print("Tap History ___:  " + tapHistory.toSet().toString());

    listOfPossibleSolutions.forEach(
      (element) {
        print("Comparing element: " + element.toString());
        Set<int> intersectionSet = (tapHistory.toSet()).intersection(element.toSet());
        print(intersectionSet);
        if (intersectionSet.length == 3) {
          winVariable = true;
          print("WINNER__________________________ " + winVariable.toString());
        }
      },
    );
  }
}
