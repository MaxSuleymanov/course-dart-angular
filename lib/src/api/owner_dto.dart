class OwnerDto {
  String name;
  int id;
  Set<String> hobby;
  DateTime birthday;

  OwnerDto.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'] as int;
    name = jsonMap['name'] as String;
    var hobbyList = (jsonMap['hobby'] as List<dynamic>);
    hobby = hobbyList.cast<String>().toSet();
    birthday = DateTime.parse(jsonMap['birthday'] as String);
  }
}
