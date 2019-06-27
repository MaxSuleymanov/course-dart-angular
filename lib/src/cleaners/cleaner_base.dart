import 'dart:async';

import 'package:angular/angular.dart';

abstract class CleanerBase {
  String getMessage();
  Stream<String> get onClean => onCleanController.stream;

  final StreamController<String> onCleanController = new StreamController<String>();
  void clean() => onCleanController.add(getMessage());
}