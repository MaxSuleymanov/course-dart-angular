import 'dart:math';

class ImgUrlService {
  String getImageUrl() => imgUrls[Random().nextInt(imgUrls.length - 1)];
  final List<String> imgUrls = [
    'https://www.stickpng.com/assets/images/58a050065583a1291368eeb4.png',
    'https://s3.amazonaws.com/peoplepng/wp-content/uploads/2018/07/01071525/lynx-PNG-HD.png',
    'https://img.fireden.net/v/image/1513/27/1513273350414.png',
    'https://freepngimg.com/thumb/bear/8-2-bear-png-15.png',
    'http://www.pngnames.com/files/4/Lemur-PNG-Free-Pic.png',
    'http://www.sclance.com/pngs/lemur-png/lemur_png_782285.png',
    'https://i.pinimg.com/originals/21/ba/d1/21bad180342225fb45d60e9faa38e86e.png',
    'https://cdn.pixabay.com/photo/2017/02/04/22/37/panther-2038656__340.png',
    'https://cdn.pixabay.com/photo/2016/07/18/20/30/tiger-1526704_960_720.png',
    'https://www.georgiaaquarium.org/wp-content/uploads/2018/07/otter-1035x735.png',
    'https://freepngimg.com/thumb/dog/20279-8-border-collie-transparent-background.png',
    'https://i.dlpng.com/static/png/84697_preview.png',
    'https://www.seekpng.com/png/small/63-632816_rainforest-animals-png-amazon-rainforest-animals-transparent-background.png',
  ];
}
