import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/tools.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_svg/svg.dart';

class ToolItem extends StatelessWidget {
  final Tool data;

  const ToolItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173,
      height: 125,
      decoration: BoxDecoration(color: data.backgroundColor),
      child: Stack(
        children: [
          Positioned.fill(
            top: AppSize.s12,
            child: SvgPicture.asset(
              Assets.image.svg.cloud,
              color: data.cloudColor,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: AppSize.s12,
            left: AppSize.s12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data.icon,
                const SizedBox(height: AppSize.s8),
                Text(
                  data.title,
                  style: getMeduimStyle(
                      fontFamily: FontFamily.alegreyaSans,
                      color: ColorManager.white,
                      fontSize: FontSize.s18),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
