import 'package:PartyAnimals/animal/animal_component.dart';
import 'package:PartyAnimals/src/app_providers.dart';
import 'package:PartyAnimals/src/cleaner.dart';
import 'package:PartyAnimals/src/cleaner_factory.dart';
import 'package:PartyAnimals/src/cleaner_types.dart';
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
      AnimalComponent
    ],
    providers: [
      appProviders,
      ClassProvider(ImageUrlGetter, useClass: PartyUrlService),
      ValueProvider(CleanerTypes, CleanerTypes.senior),
      FactoryProvider(Cleaner, cleanerFactory, deps: [CleanerTypes])
    ])
class AnimalPartyComponent
//    implements
//        OnInit,
//        AfterChanges,
//        DoCheck,
//        AfterContentInit,
//        AfterContentChecked,
//        AfterViewInit,
//        AfterViewChecked,
//        OnDestroy
{
  final String imageUrl;
  // ignore: unused_field
  ImageUrlGetter _imageService;
  // ignore: unused_field
  NiceDayService _niceDayService;
  Cleaner _cleanerService;
  AnimalPartyComponent(
      this._imageService, this._niceDayService, this._cleanerService)
      : imageUrl = _imageService.getImageUrl();

  get greeting => _niceDayService.wish();
  void clean() => _cleanerService.clean();
  //print('clean');

  final List<String> log = [];

  void addVoice(String voice) {
    log.add(voice);
  }

//  int step = 0;
//  @override
//  void ngOnInit() {
//    print('AnimalPartyComponent ${step++}   ngOnInit');
//  }
//
//  @override
//  void ngDoCheck() {
//    print('AnimalPartyComponent ${step++}   ngDoCheck');
//  }
//
//  @override
//  void ngAfterContentChecked() {
//    print('AnimalPartyComponent ${step++}   ngAfterContentChecked');
//  }
//
//  @override
//  void ngAfterContentInit() {
//    print('AnimalPartyComponent ${step++}   ngAfterContentInit');
//  }
//
//  @override
//  void ngAfterViewChecked() {
//    print('AnimalPartyComponent ${step++}   ngAfterViewChecked');
//  }
//
//  @override
//  void ngAfterViewInit() {
//    print('AnimalPartyComponent ${step++}   ngAfterViewInit');
//  }
//
//  @override
//  void ngOnDestroy() {
//    print('AnimalPartyComponent ${step++}   ngOnDestroy');
//  }
//
//  @override
//  void ngAfterChanges() {
//    print('AnimalPartyComponent ${step++}   ngAfterChanges');
//  }
}
