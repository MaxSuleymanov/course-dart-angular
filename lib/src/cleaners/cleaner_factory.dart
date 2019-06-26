import 'package:PartyAnimals/src/cleaners/cleaner.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_granny_service.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_senior_service.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_types.dart';

Cleaner cleanerFactory(CleanerTypes cleanerType) =>
    cleanerType == CleanerTypes.granny
        ? new CleanerGrannyService()
        : new CleanerSeniorService();
