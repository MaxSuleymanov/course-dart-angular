class AnimalDto {
  String name;
  int id;

  AnimalDto.fromJson(Map<String, dynamic> jsonMap) {
    name = jsonMap['name'] as String;
    id = jsonMap['id'] as int;
  }
}
