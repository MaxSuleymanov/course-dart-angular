import 'package:PartyAnimals/animal/animal.dart';
import 'package:PartyAnimals/animal/animal_component.dart';
import 'package:PartyAnimals/src/animal_controller.dart';
import 'package:angular/angular.dart';

import 'animal_owner.dart';

@Component(
    selector: 'owner',
    templateUrl: 'owner_component.html',
    styleUrls: ['owner_component.css'],
    directives: [AnimalComponent, NgFor, NgIf])
class OwnerComponent {
  AnimalController _animalController;
  OwnerComponent(this._animalController);

  @ViewChild('animalInstance', read: AnimalComponent)
  AnimalComponent animalComponent;

  @Input()
  Animal animal;

  @Input()
  AnimalOwner owner;

  @HostBinding('class.is-party')
  bool get isParty => _animalController.isOnParty(animal.id);

  final List<String> log = [];
  void addVoice(String voice) => log.add(voice);
}
