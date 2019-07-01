import 'package:PartyAnimals/animal/animal.dart';
import 'package:PartyAnimals/animal/animal_component.dart';
import 'package:angular/angular.dart';

import 'animal_owner.dart';

@Component(
    selector: 'owner',
    templateUrl: 'owner_component.html',
    styleUrls: ['owner_component.css'],
    directives: [AnimalComponent, NgFor, NgIf])
class OwnerComponent {
  @Input()
  Animal animal;

  @Input()
  AnimalOwner owner;

  final List<String> log = [];
  void addVoice(String voice) => log.add(voice);
}
