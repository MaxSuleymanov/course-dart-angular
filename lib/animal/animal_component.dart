import 'dart:async';
import 'dart:math';

import 'package:PartyAnimals/src/ImgUrlService.dart';
import 'package:angular/angular.dart';

const minSize = 8;
const maxSize = minSize * 5;

@Component(
    selector: 'animal',
    templateUrl: 'animal_component.html',
    styleUrls: ['animal_component.css'],
    preserveWhitespace: true,
    exports: [minSize, maxSize],
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

  void addVoice() => _onVoiceController.add('I\'m ${name}, ${size} years old.');

  int _size = minSize * 2;
  int get size => _size;

  @Input()
  set size(/*String|int*/ val) {
    int z = val is int ? val : int.tryParse(val);
    if (z != null) _size = min(maxSize, max(minSize, z));
  }

  final _sizeChange = StreamController<int>();

  @Output()
  Stream<int> get sizeChange => _sizeChange.stream;

  void dec() => resize(-1);
  void inc() => resize(1);
  void resize(int delta) {
    size = size + delta;
    _sizeChange.add(size);
  }


  int step = 0;
  @override
  void ngOnInit() {
    print('AnimalComponent ${step++}  ngOnInit');
  }

  @override
  void ngDoCheck() {
    print('AnimalComponent ${step++}  ngDoCheck');
  }

  @override
  void ngAfterContentChecked() {
    print('AnimalComponent ${step++}  ngAfterContentChecked');
  }

  @override
  void ngAfterContentInit() {
    print('AnimalComponent ${step++}  ngAfterContentInit');
  }

  @override
  void ngAfterViewChecked() {
    print('AnimalComponent ${step++}  ngAfterViewChecked');
  }

  @override
  void ngAfterViewInit() {
    print('AnimalComponent ${step++}  ngAfterViewInit');
  }

  @override
  void ngOnDestroy() {
    print('AnimalComponent ${step++}  ngOnDestroy');
  }

  @override
  void ngAfterChanges() {
    print('AnimalComponent ${step++}  ngAfterChanges');
  }
}
