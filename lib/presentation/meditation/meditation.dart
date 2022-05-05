import 'package:flutter/material.dart';
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
import 'package:pausable_timer/pausable_timer.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  bool isPaused = true;
  String start = 'Start Now';
  String stop = 'Stop It';
  String timerText = '45:00';
  int countDown = 45 * 60;

  late PausableTimer timer;
  late ValueNotifier<String> _counter;

  @override
  void initState() {
    super.initState();
    _counter = ValueNotifier<String>(formatTime(countDown));

    timer = PausableTimer(const Duration(seconds: 1), () {
      countDown--;

      if (countDown > 0) {
        timer
          ..reset()
          ..start();
      }
      _counter.value = formatTime(countDown);
    });
  }

  @override
  void dispose() {
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
            ValueListenableBuilder<String>(
                valueListenable: _counter,
                builder: (context, value, child) {
                  debugPrint(value);
                  return Text(value,
                      style: getRegularStyle(
                          fontFamily: FontFamily.alegreyaSans,
                          color: ColorManager.white,
                          fontSize: 38));
                }),
            const SizedBox(height: AppSize.s28),
            Button(
                text: isPaused ? start : stop,
                onPress: () {
                  isPaused ? timer.start() : timer.pause();
                  setState(() {
                    isPaused = !isPaused;
                  });
                }),
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

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }
}
