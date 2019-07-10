import 'package:PartyAnimals/src/api/animal_dto.dart';
import 'package:PartyAnimals/src/api/owner_animal_dto.dart';
import 'package:PartyAnimals/src/api/owner_dto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PartyApi {
  Future<Iterable<AnimalDto>> getAnimalsDto() async {
    final url = '/fake_api/animals.json';
    var response = await http.get(url);
    var body = response.body;
    var animals = json.decode(body) as List;
    var animalsDto = animals.map((x) => AnimalDto.fromJson(x));
    return animalsDto;
  }

  Future<Iterable<OwnerDto>> getOwnersDto() async {
    final url = '/fake_api/owners.json';
    var response = await http.get(url);
    var body = response.body;
    var owners = json.decode(body) as List;
    var ownersDto = owners.map((x) => OwnerDto.fromJson(x));
    return ownersDto;
  }

  Future<Iterable<OwnerAnimalDto>> getOwnersToAnimalsDto() async {
    final url = '/fake_api/owners_to_animals.json';
    var response = await http.get(url);
    var body = response.body;
    var ownersToAnimals = json.decode(body) as List;
    var ownersToAnimalsDto =
        ownersToAnimals.map((x) => OwnerAnimalDto.fromJson(x));
    return ownersToAnimalsDto;
  }
}
