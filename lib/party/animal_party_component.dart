import 'package:PartyAnimals/animal/animal_component.dart';
import 'package:angular/angular.dart';

@Component(
    selector: 'animal-party',
    templateUrl: 'animal_party_component.html',
    directives: [NgFor, NgIf, AnimalComponent])
class AnimalPartyComponent
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
    print('AnimalPartyComponent ${step++}   ngOnInit');
  }

  @override
  void ngDoCheck() {
    print('AnimalPartyComponent ${step++}   ngDoCheck');
  }

  @override
  void ngAfterContentChecked() {
    print('AnimalPartyComponent ${step++}   ngAfterContentChecked');
  }

  @override
  void ngAfterContentInit() {
    print('AnimalPartyComponent ${step++}   ngAfterContentInit');
  }

  @override
  void ngAfterViewChecked() {
    print('AnimalPartyComponent ${step++}   ngAfterViewChecked');
  }

  @override
  void ngAfterViewInit() {
    print('AnimalPartyComponent ${step++}   ngAfterViewInit');
  }

  @override
  void ngOnDestroy() {
    print('AnimalPartyComponent ${step++}   ngOnDestroy');
  }

  @override
  void ngAfterChanges() {
    print('AnimalPartyComponent ${step++}   ngAfterChanges');
  }
}
