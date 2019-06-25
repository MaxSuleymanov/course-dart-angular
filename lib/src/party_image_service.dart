import 'package:PartyAnimals/src/image_url_getter.dart';

class PartyUrlService implements ImageUrlGetter {
  @override
  String getImageUrl() {
    return 'https://upload.wikimedia.org/wikipedia/en/thumb/2/24/WWF_logo.svg/1200px-WWF_logo.svg.png';
  }
}
