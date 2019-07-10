import 'package:PartyAnimals/animal/animal.dart';
import 'package:PartyAnimals/owner/animal_owner.dart';
import 'package:PartyAnimals/src/api/owner_dto.dart';
import 'package:PartyAnimals/src/api/party_api.dart';

class PartyManager {
  final PartyApi _api = new PartyApi();

  Future<Iterable<Animal>> getAnimals() async {
    var dto = await _api.getAnimalsDto();
    var result = dto.map((x) => new Animal(x.id, x.name)).toList();
    return result;
  }

  Future<Iterable<AnimalOwner>> getOwners() async {
    var dto = await _api.getOwnersDto();
    var result = dto
        .map((x) => _getAnimal(x))
        .toList();
    return result;
  }

  AnimalOwner _getAnimal(OwnerDto owner) =>
      new AnimalOwner(owner.id, owner.name, _getAgeFromBirthday(owner.birthday), owner.hobby);

  int _getAgeFromBirthday(DateTime birthday) =>
      DateTime.now().year - birthday.year;

  Future<Map<int, int>> getOwnersToAnimals() async {
    var dto = await _api.getOwnersToAnimalsDto();
    print(dto);
    var result = Map.fromIterable(dto,
        key: (x) => x.ownerId as int, value: (x) => x.animalId as int);
    return result;
  }
}