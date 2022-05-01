import 'package:flutter/cupertino.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';

class FeelingData {
  final String name;
  final Widget icon;

  FeelingData(this.name, this.icon);
}

final feelings = [
  FeelingData(
      'Calm',
      SVGLoader(
        size: AppSize.s30,
        path: Assets.image.svg.calmIcon,
      )),
  FeelingData(
      'Relax', SVGLoader(size: AppSize.s35, path: Assets.image.svg.relax)),
  FeelingData(
      'Focus', SVGLoader(size: AppSize.s35, path: Assets.image.svg.focus)),
  FeelingData(
      'Anxious', Assets.image.pic.anxious.image(color: ColorManager.white, fit: BoxFit.fitHeight)),
];
//SVGLoader(size: AppSize.s35, path: Assets.image.svg.anxious)