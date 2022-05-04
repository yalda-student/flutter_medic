import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';

class Tool {
  final String title;
  final Color backgroundColor;
  final Color cloudColor;
  final Widget icon;

  Tool(
      {required this.title,
      required this.backgroundColor,
      required this.cloudColor,
      required this.icon});
}

final tools = <Tool>[
  Tool(
      title: 'Mood Journal',
      backgroundColor: const Color(0xff3E8469),
      cloudColor: const Color(0xff2B5B54),
      icon: SVGLoader(size: 18, path: Assets.image.svg.journal)),
  Tool(
      title: 'Mood Booster',
      backgroundColor: const Color(0xff69B09C),
      cloudColor: const Color(0xff498A78),
      icon: SVGLoader(size: 18, path: Assets.image.svg.booster)),
  Tool(
      title: 'Positive Notes',
      backgroundColor: const Color(0xff6AAE72),
      cloudColor: const Color(0xff3E8469),
      icon: SVGLoader(size: 18, path: Assets.image.svg.notes)),
  Tool(
      title: 'Trigger Plan',
      backgroundColor: const Color(0xffA9D571),
      cloudColor: const Color(0xff6AAE72),
      icon: const Icon(Icons.verified, color: ColorManager.white)),
  Tool(
      title: 'Goal Trainer',
      backgroundColor: const Color(0xffb1b1b1),
      cloudColor: const Color(0xff9a9a9a),
      icon: SVGLoader(size: 18, path: Assets.image.svg.trainer)),
];
