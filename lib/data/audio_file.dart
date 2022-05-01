import 'package:flutter_medic_application/gen/assets.gen.dart';

final soundList = [
  Audio('Painting Forest', '20 min',
      Assets.image.pic.forest, 149),
  Audio('Mountaineers', '8 min',
      Assets.image.pic.mountain, 2307),
  Audio('Lovely Deserts', '13 min',
      Assets.image.pic.desert, 612),
  Audio('The Hill Sides', '57 min',
      Assets.image.pic.hill, 1751),
];

class Audio {
  final String name;
  final String length;
  final AssetGenImage cover;
  final int listeningCount;

  Audio(this.name, this.length, this.cover, this.listeningCount);
}
