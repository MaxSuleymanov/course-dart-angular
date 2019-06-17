import 'package:PartyAnimals/animal/animal_component.dart';
import 'package:angular/angular.dart';

@Component(
    selector: 'animal-party',
    templateUrl: 'animal_party_component.html',
    directives: [NgFor, NgIf, AnimalComponent])
class AnimalVillageComponent 
    implements 
        OnInit, 
        AfterChanges,
        DoCheck, 
        AfterContentInit, 
        AfterContentChecked, 
        AfterViewInit, 
        AfterViewChecked, 
        OnDestroy {
  final List<String> log = [];

  void addVoice(String voice) {
    log.add(voice);
  }

  int step = 0;
  @override
  void ngOnInit() {
    print('AnimalVillageComponent ${step++}   ngOnInit');
  }

  @override
  void ngDoCheck() {
    print('AnimalVillageComponent ${step++}   ngDoCheck');
  }

  @override
  void ngAfterContentChecked() {
    print('AnimalVillageComponent ${step++}   ngAfterContentChecked');
  }

  @override
  void ngAfterContentInit() {
    print('AnimalVillageComponent ${step++}   ngAfterContentInit');
  }

  @override
  void ngAfterViewChecked() {
    print('AnimalVillageComponent ${step++}   ngAfterViewChecked');
  }

  @override
  void ngAfterViewInit() {
    print('AnimalVillageComponent ${step++}   ngAfterViewInit');
  }

  @override
  void ngOnDestroy() {
    print('AnimalVillageComponent ${step++}   ngOnDestroy');
  }

  @override
  void ngAfterChanges() {
    print('AnimalVillageComponent ${step++}   ngAfterChanges');
  }
}
