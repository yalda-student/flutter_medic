import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/audio_file.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/appbar.dart';
import 'package:flutter_medic_application/presentation/widget/wave_form.dart';

class SoundFileScreen extends StatelessWidget {
  final Audio audioData;

  const SoundFileScreen({Key? key, required this.audioData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppBar(),
          ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: audioData.cover.image(width: 250, height: 250)),
          const SizedBox(height: AppSize.s20),
          Text(
            audioData.name,
            style: getMeduimStyle(
                fontFamily: FontFamily.alegreya,
                color: ColorManager.white,
                fontSize: AppSize.s35),
          ),
          Text(
            'By: Painting with Passion',
            style: getMeduimStyle(
                fontFamily: FontFamily.alegreya,
                color: ColorManager.white.withOpacity(0.5),
                fontSize: AppSize.s25),
          ),
          const SizedBox(height: AppSize.s35),
          SizedBox(
              height: 311,
              width: MediaQuery.of(context).size.width,
              child: const WaveformsDashboard()),
        ],
      ),
    );
  }
}
