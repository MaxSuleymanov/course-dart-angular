import 'package:PartyAnimals/src/cleaners/cleaner.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_base.dart';

class CleanerGrannyService extends CleanerBase implements Cleaner {
  String get _message => 'Granny cleanning animal stuff!';
  void clean() => onCleanController.add(_message);
}
