class OwnerAnimalDto {
  int ownerId;
  int animalId;

  OwnerAnimalDto.fromJson(Map<String, dynamic> jsonMap) {
    ownerId = jsonMap['ownerId'] as int;
    animalId = jsonMap['animalId'] as int;
  }
}
