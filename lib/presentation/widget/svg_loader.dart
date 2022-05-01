import 'package:flutter/material.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGLoader extends StatelessWidget {
  final double size;
  final String path;
  Color color;

  SVGLoader({
    Key? key,
    required this.size,
    required this.path,
    this.color = ColorManager.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset(path, color: color),
    );
  }
}
