import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/audio_file.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/sound_file/sound_file.dart';
import 'package:flutter_medic_application/presentation/widget/appbar.dart';
import 'package:flutter_medic_application/presentation/widget/media_button.dart';

class SoundScreen extends StatelessWidget {
  const SoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppBar(),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: AppSize.s12, left: AppSize.s18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: Assets.image.pic.albumCover, fit: BoxFit.cover),
                color: ColorManager.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Relax Sounds ',
                  style: getMeduimStyle(
                      fontFamily: FontFamily.alegreya,
                      color: ColorManager.white,
                      fontSize: 27),
                ),
                Text(
                  'Sometimes the most productive \nthing you can do is relax. ',
                  style: getMeduimStyle(
                      fontFamily: FontFamily.alegreyaSans,
                      color: ColorManager.white,
                      fontSize: 15),
                ),
                const SizedBox(height: AppSize.s18),
                const PlayMediaButton(
                  title: 'Play now',
                  bgColor: ColorManager.white,
                  color: ColorManager.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s20),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: soundList.length,
              itemBuilder: (context, index) {
                final soundData = soundList[index];
                return _SoundItem(soundData: soundData);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _SoundItem extends StatelessWidget {
  const _SoundItem({
    Key? key,
    required this.soundData,
  }) : super(key: key);

  final Audio soundData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SoundFileScreen(audioData: soundData),
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(AppSize.s12),
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            soundData.cover.image(width: AppSize.s65, height: AppSize.s65),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: AppSize.s12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(soundData.name,
                        style: getMeduimStyle(
                            fontFamily: FontFamily.alegreyaSans,
                            color: ColorManager.white,
                            fontSize: FontSize.s20)),
                    Text(
                      '${soundData.listeningCount} Listening',
                      style: getLightStyle(
                          fontFamily: FontFamily.alegreyaSans,
                          color: ColorManager.white,
                          fontSize: FontSize.s12),
                    )
                  ],
                ),
              ),
            ),
            Text(soundData.length,
                style: getMeduimStyle(
                    fontFamily: FontFamily.alegreyaSans,
                    color: ColorManager.white,
                    fontSize: FontSize.s14))
          ],
        ),
      ),
    );
  }
}
