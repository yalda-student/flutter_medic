import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/appbar.dart';
import 'package:flutter_medic_application/presentation/widget/button.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomAppBar(),
          const SizedBox(height: AppSize.s28),
          Text(
            'Meditation',
            style: getMeduimStyle(
                fontFamily: FontFamily.alegreya,
                color: ColorManager.white,
                fontSize: FontSize.s34),
          ),
          Text(
              'Guided by a short introductory course,\nstart trying meditation.',
              style: getRegularStyle(
                  fontFamily: FontFamily.alegreyaSans,
                  color: ColorManager.white.withOpacity(0.5),
                  fontSize: FontSize.s20),
              textAlign: TextAlign.center),
          SVGLoader(size: AppSize.s350, path: Assets.image.svg.ink),
          Text(
            '45:00',
            style: getRegularStyle(
                fontFamily: FontFamily.alegreyaSans,
                color: ColorManager.white,
                fontSize: 38),
          ),
          Button(text: 'Start Now', onPress: () {}),
          const SizedBox(height: AppSize.s28),
        ],
      ),
    );
  }
}
