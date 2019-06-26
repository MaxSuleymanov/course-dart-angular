import 'package:angular/angular.dart';

import 'package:PartyAnimals/src/cleaners/cleaner.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_types.dart';
import 'nice_day_service.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_factory.dart';

const List<Object> appProviders = const [
  const ClassProvider(NiceDayService),
  FactoryProvider(Cleaner, cleanerFactory, deps: [CleanerTypes]),
];
