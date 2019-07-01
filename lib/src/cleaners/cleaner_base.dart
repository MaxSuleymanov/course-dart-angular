import 'dart:async';

abstract class CleanerBase {
  String getMessage();
  Stream<String> get onClean => _onCleanController.stream;

  final StreamController<String> _onCleanController =
      new StreamController<String>();
  void clean() => _onCleanController.add(getMessage());
}
