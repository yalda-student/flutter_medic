import 'package:flutter/cupertino.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';

class FeelingData {
  final String name;
  final Widget icon;

  FeelingData(this.name, this.icon);
}

final feelings = [
  FeelingData('Calm', Assets.image.pic.calm.image(fit: BoxFit.cover)),
  FeelingData('Relax', Assets.image.pic.relax.image(fit: BoxFit.fitHeight)),
  FeelingData('Focus', Assets.image.pic.focus.image(fit: BoxFit.fitHeight)),
  FeelingData('Anxious', Assets.image.pic.anxious.image(fit: BoxFit.fitHeight)),
];
