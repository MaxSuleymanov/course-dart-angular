import 'dart:async';
import 'dart:math';

import 'package:PartyAnimals/src/img_url_service.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

const minAge = 8;
const maxAge = minAge * 5;

@Component(
    selector: 'animal',
    templateUrl: 'animal_component.html',
    styleUrls: ['animal_component.css'],
    preserveWhitespace: true,
    directives: [formDirectives],
    exports: [minAge, maxAge],
    providers: [ClassProvider(ImgUrlService)])
class AnimalComponent implements
    OnInit,
    AfterChanges,
    DoCheck,
    AfterContentInit,
    AfterContentChecked,
    AfterViewInit,
    AfterViewChecked,
    OnDestroy {
  @Input()
  String name = 'nothing';

  final String imageUrl;

  // ignore: unused_field
  final ImgUrlService _imgUrlService;
  AnimalComponent(this._imgUrlService)
      : imageUrl = _imgUrlService.getImageUrl();

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

  int step = 0;
  @override
  void ngOnInit() {
    print('AnimalComponent $name ${step++}  ngOnInit');
  }

  @override
  void ngDoCheck() {
    print('AnimalComponent $name ${step++}  ngDoCheck');
  }

  @override
  void ngAfterContentChecked() {
    print('AnimalComponent $name ${step++}  ngAfterContentChecked');
  }

  @override
  void ngAfterContentInit() {
    print('AnimalComponent $name ${step++}  ngAfterContentInit');
  }

  @override
  void ngAfterViewChecked() {
    print('AnimalComponent $name ${step++}  ngAfterViewChecked');
  }

  @override
  void ngAfterViewInit() {
    print('AnimalComponent $name ${step++}  ngAfterViewInit');
  }

  @override
  void ngOnDestroy() {
    print('AnimalComponent $name ${step++}  ngOnDestroy');
  }

  @override
  void ngAfterChanges() {
    print('AnimalComponent $name ${step++}  ngAfterChanges');
  }
}
