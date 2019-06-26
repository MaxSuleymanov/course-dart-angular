import 'dart:async';

import 'package:angular/angular.dart';

abstract class CleanerBase {
  //String get _message => 'base';
  @Output()
  Stream<String> get onClean => onCleanController.stream;

  final StreamController<String> onCleanController = new StreamController<String>();
  //void clean() => _onCleanController.add(_message);
}