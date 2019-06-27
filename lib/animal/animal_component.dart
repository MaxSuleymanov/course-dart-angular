import 'dart:async';
import 'dart:math';

import 'package:PartyAnimals/src/app_providers.dart';
import 'package:PartyAnimals/src/cleaners/cleaner.dart';
import 'package:PartyAnimals/src/cleaners/cleaner_types.dart';
import 'package:PartyAnimals/src/image_url_getter.dart';
import 'package:PartyAnimals/src/img_url_service.dart';
import 'package:PartyAnimals/src/nice_day_service.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

const minAge = 1;
const maxAge = minAge * 20;

@Component(
    selector: 'animal',
    templateUrl: 'animal_component.html',
    styleUrls: ['animal_component.css'],
    preserveWhitespace: true,
    directives: [
      formDirectives,
      NgFor,
      NgIf,
    ],
    exports: [minAge, maxAge],
    providers: [
      appProviders,
      ValueProvider(CleanerTypes, CleanerTypes.granny),
      ClassProvider(ImageUrlGetter, useClass: ImgUrlService)
    ])
class AnimalComponent {
  @Input()
  String name = 'nothing';

  final String imageUrl;

  // ignore: unused_field
  final ImageUrlGetter _imgUrlService;
  // ignore: unused_field
  final NiceDayService _niceDayService;
  final Cleaner _cleanerService;
  final String wish;
  AnimalComponent(
      this._imgUrlService, this._niceDayService, this._cleanerService)
      : imageUrl = _imgUrlService.getImageUrl(),
        wish = _niceDayService.wish() {
    _cleanerService.onClean.listen((info) => cleaningLog.add(info));
  }

  @Output()
  Stream<String> get onVoice => _onVoiceController.stream;

  final StreamController<String> _onVoiceController =
      new StreamController<String>();

  void addVoice() {
    _onVoiceController.add('I\'m ${name}, ${age} years old.');
  }

  int _age = minAge * 2;

  int get age {
    return min(maxAge, max(minAge, _age));
  }

  @Input()
  set age(/*String|int*/ val) {
    int z = val is int ? val : int.tryParse(val);
    if (z != null) _age = z;
  }

  final _sizeChange = StreamController<int>();

  @Output()
  Stream<int> get sizeChange => _sizeChange.stream;

  void dec() => resize(-1);
  void inc() => resize(1);
  void resize(int delta) {
    age = age + delta;
    _sizeChange.add(age);
  }

  get canDecrease => age <= minAge;
  get canIncrease => age >= maxAge;

  final List<String> cleaningLog = [];
  void clean() => _cleanerService.clean();
}
