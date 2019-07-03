import 'package:PartyAnimals/party/animal_party_component.dart';
import 'package:PartyAnimals/owner/animal_owner.dart';
import 'package:PartyAnimals/src/servies/party_manager.dart';
import 'package:angular/angular.dart';

import 'animal/animal.dart';

@Component(
  selector: 'my-app',
  styleUrls: [ 'app_component.css' ],
  templateUrl: 'app_component.html',
  directives: [ AnimalPartyComponent ],
  providers: [ ClassProvider(PartyManager) ]
)
class AppComponent implements OnInit {

  final PartyManager _manager;
  AppComponent(this._manager);

  List<Animal> animals = [];

  List<AnimalOwner> owners = [];

  Map<int, int> ownerToAnimal = {};

  @override
  Future ngOnInit() async {
    ownerToAnimal = await _manager.getOwnersToAnimals();
    animals = await _manager.getAnimals();
    owners = await _manager.getOwners();
  }

}
