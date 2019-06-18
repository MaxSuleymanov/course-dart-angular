import 'package:PartyAnimals/party/animal_party_component.dart';
import 'package:PartyAnimals/src/sizer/sizer_component.dart';
import 'package:angular/angular.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    AnimalPartyComponent,
    SizerComponent,
  ],
)
class AppComponent {}
