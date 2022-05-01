import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/media_button.dart';

class VideoItem extends StatelessWidget {
  final String title;
  final String description;
  final AssetGenImage image;

  const VideoItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 170,
        decoration: BoxDecoration(
            color: ColorManager.milky,
            borderRadius: BorderRadius.circular(AppSize.s20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: getMeduimStyle(
                        fontFamily: FontFamily.alegreya,
                        color: ColorManager.primary,
                        fontSize: FontSize.s25),
                  ),
                  Text(
                    description,
                    style: getMeduimStyle(
                        fontFamily: FontFamily.alegreyaSans,
                        color: ColorManager.primary,
                        fontSize: FontSize.s15),
                  ),
                  const PlayMediaButton(
                      title: 'Watch now',
                      bgColor: ColorManager.primary,
                      color: ColorManager.white),
                ]),
            image.image(width: 160, height: 110,fit: BoxFit.cover),
          ],
        ));
  }
}
