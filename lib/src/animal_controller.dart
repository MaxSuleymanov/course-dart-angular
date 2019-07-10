class AnimalController {
  Set<int> _partingAnimals = {};

  bool isOnParty(int id) => _partingAnimals.contains(id);

  void toggleParting(int id) {
    if (isOnParty(id)) {
      _partingAnimals.remove(id);
    }
    else {
      _partingAnimals.add(id);
    }
  }
}