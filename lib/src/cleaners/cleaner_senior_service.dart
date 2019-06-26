import 'package:PartyAnimals/src/cleaners/cleaner.dart';

import 'cleaner_base.dart';

class CleanerSeniorService extends CleanerBase implements Cleaner {
  String get _message => 'Senior cleaner cleaning all party stuff!';
  void clean() => onCleanController.add(_message);
}
