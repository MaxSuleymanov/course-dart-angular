import 'package:PartyAnimals/src/cleaner.dart';
import 'package:PartyAnimals/src/cleaner_granny_service.dart';
import 'package:PartyAnimals/src/cleaner_senior_service.dart';
import 'package:PartyAnimals/src/cleaner_types.dart';

Cleaner cleanerFactory(CleanerTypes cleanerType) =>
    cleanerType == CleanerTypes.granny
        ? new CleanerGrannyService()
        : new CleanerSeniorService();
