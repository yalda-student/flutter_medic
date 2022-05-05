import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/data/feelings.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/appbar.dart';
import 'package:flutter_medic_application/presentation/widget/video_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: AppSize.s20),
          Text(
            'Welcome back, $name!',
            style: getMeduimStyle(
                fontFamily: FontFamily.alegreya,
                color: ColorManager.white,
                fontSize: FontSize.s30),
          ),
          const SizedBox(height: AppSize.s12),
          Text(
            'How are you feeling today ?',
            style: getRegularStyle(
                fontFamily: FontFamily.alegreyaSans,
                color: ColorManager.white.withOpacity(0.7),
                fontSize: FontSize.s22),
          ),
          const SizedBox(height: AppSize.s20),
          Container(
            padding: const EdgeInsets.fromLTRB(
                AppSize.s12, AppSize.s25, AppSize.s12, AppSize.s25),
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var data in feelings)
                  _FeelingItem(title: data.name, image: data.icon)
              ],
            )),
          ),
          VideoItem(
              title: 'Meditation 101',
              description: 'Techniques, Benefits, and \na Beginner’s How-To',
              image: Assets.image.pic.videoPic2),
          const SizedBox(height: AppSize.s20),
          VideoItem(
              title: 'Cardio Meditation',
              description:
                  'Basics of Yoga for Beginners \nor Experienced Professionals',
              image: Assets.image.pic.videoPic1),
        ],
      ),
    );
  }
}

class _FeelingItem extends StatelessWidget {
  final String title;
  final Widget image;

  const _FeelingItem({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppSize.s65,
          height: 65,
          padding: const EdgeInsets.all(AppSize.s8),
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s20)),
          child: image,
        ),
        const SizedBox(height: AppSize.s8),
        Text(
          title,
          style: getRegularStyle(
              fontFamily: FontFamily.alegreyaSans,
              color: ColorManager.white,
              fontSize: FontSize.s12),
        ),
      ],
    );
  }
}
