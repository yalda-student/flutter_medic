import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/appbar.dart';
import 'package:flutter_medic_application/presentation/widget/bottom_navigation.dart';
import 'package:flutter_medic_application/presentation/widget/button.dart';
import 'package:flutter_medic_application/presentation/widget/drawer.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';
import 'package:flutter_medic_application/root/root.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  late CountdownTimerController controller;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = noIndex;

    return AppDrawer(
      scaffold: Scaffold(
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
            CountdownTimer(
              endTime: endTime,
              controller: controller,
              textStyle: getRegularStyle(
                  fontFamily: FontFamily.alegreyaSans,
                  color: ColorManager.white,
                  fontSize: 38),
            ),
            Button(text: 'Start Now', onPress: () => controller.disposeTimer()),
            const SizedBox(height: AppSize.s28),
          ],
        ),
        bottomNavigationBar: AppBottomNavigation(
          selectedIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RootScreen(),
                ));
          },
        ),
      ),
    );
  }
}
