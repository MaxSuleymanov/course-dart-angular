import 'package:PartyAnimals/animal/animal.dart';
import 'package:PartyAnimals/animal/animal_component.dart';
import 'package:PartyAnimals/owner/animal_owner.dart';
import 'package:PartyAnimals/owner/owner_component.dart';
import 'package:PartyAnimals/src/app_providers.dart';
import 'package:PartyAnimals/src/cleaners/cleaner.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_types.dart';
import 'package:PartyAnimals/src/image_url_getter.dart';
import 'package:PartyAnimals/src/nice_day_service.dart';
import 'package:PartyAnimals/src/party_image_service.dart';
import 'package:angular/angular.dart';

@Component(
    selector: 'animal-party',
    templateUrl: 'animal_party_component.html',
    directives: [
      NgFor,
      NgIf,
      AnimalComponent,
      OwnerComponent,
    ],
    providers: [
      appProviders,
      ClassProvider(ImageUrlGetter, useClass: PartyUrlService),
      ValueProvider(CleanerTypes, CleanerTypes.senior),
    ])
class AnimalPartyComponent {
  @Input()
  List<Animal> animals;

  @Input()
  List<AnimalOwner> owners;

  @Input()
  Map<int, int> ownerToAnimal;

  final String imageUrl;
  // ignore: unused_field
  final ImageUrlGetter _imageService;
  // ignore: unused_field
  final NiceDayService _niceDayService;
  final Cleaner _cleanerService;
  final String greeting;
  final List<String> cleaningLog = [];

  AnimalPartyComponent(
      this._imageService, this._niceDayService, this._cleanerService)
      : imageUrl = _imageService.getImageUrl(),
        greeting = _niceDayService.wish() {
    _cleanerService.onClean.listen((info) => cleaningLog.add(info));
  }

  void clean() => _cleanerService.clean();

  final List<String> log = [];
  void addVoice(String voice) => log.add(voice);

  Animal getAnimalByOwnerId(int ownerId) =>
      animals.firstWhere((x) => x.id == ownerToAnimal[ownerId]);
}
