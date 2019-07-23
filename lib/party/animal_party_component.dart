import 'dart:async';
import 'dart:html';

import 'package:PartyAnimals/animal/animal.dart';
import 'package:PartyAnimals/animal/animal_component.dart';
import 'package:PartyAnimals/owner/animal_owner.dart';
import 'package:PartyAnimals/owner/owner_component.dart';
import 'package:PartyAnimals/src/animal_controller.dart';
import 'package:PartyAnimals/src/app_providers.dart';
import 'package:PartyAnimals/src/cleaners/cleaner.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_types.dart';
import 'package:PartyAnimals/src/image_url_getter.dart';
import 'package:PartyAnimals/src/nice_day_service.dart';
import 'package:PartyAnimals/src/party_image_service.dart';
import 'package:angular/angular.dart';

const String imagePartyUrl = 'https://vignette.wikia.nocookie.net/adventuretimewithfinnandjake/images/9/98/Party_laser.gif';

@Component(
    selector: 'animal-party',
    templateUrl: 'animal_party_component.html',
    directives: [
      NgFor,
      NgIf,
      AnimalComponent,
      OwnerComponent,
    ],
    exports: [imagePartyUrl],
    providers: [
      appProviders,
      const ClassProvider(AnimalController),
      ClassProvider(ImageUrlGetter, useClass: PartyUrlService),
      ValueProvider(CleanerTypes, CleanerTypes.senior),
    ])
class AnimalPartyComponent implements OnInit {
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
  final AnimalController _animalController;
  final String greeting;
  final List<String> cleaningLog = [];
  ChangeDetectorRef _cdr;
  NgZone _zone;

  Timer timer;

  AnimalPartyComponent(
      this._imageService, this._niceDayService, this._cleanerService, this._animalController, this._zone, this._cdr)
      : imageUrl = _imageService.getImageUrl(),
        greeting = _niceDayService.wish() {
    _cleanerService.onClean.listen((info) => cleaningLog.add(info));
  }

  @ViewChild('partyNameInput', read: HtmlElement) InputElement partyNameInput;
  String partyName = 'PARTY AN|MALS!';

  void clean() => _cleanerService.clean();

  void partyToggle() {
    if (isSuperParty) {
      animals
          .where((x) => _animalController.isOnParty(x.id))
          .forEach((x) => _animalController.toggleParting(x.id));
    }
    else {
      animals
          .where((x) => !_animalController.isOnParty(x.id))
          .forEach((x) => _animalController.toggleParting(x.id));
    }
  }

  bool get isSuperParty => _animalController.isEverybodyParty(animals.map((x) => x.id).toSet());

  final List<String> log = [];
  void addVoice(String voice) => log.add(voice);

  Animal getAnimalByOwnerId(int ownerId) =>
      animals.firstWhere((x) => x.id == ownerToAnimal[ownerId]);

  void updatePartyName() {
    _zone.runOutsideAngular(() {
      if (timer != null) {
        timer.cancel();
      }
      timer = new Timer(const Duration(milliseconds: 500), () {
        partyName = partyNameInput.value;
        _cdr
          ..markForCheck()
          ..detectChanges();
      });
    });
  }

  @override
  void ngOnInit() {
    _zone.runOutsideAngular((){
      partyNameInput.onInput.listen((_) => updatePartyName());
    });
  }
}
