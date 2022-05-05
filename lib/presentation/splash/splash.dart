import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/presentation/onboarding/onboard.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';
import 'package:flutter_medic_application/root/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Widget nextScreen;
    bool firstRun = await isFirstTime();

    if (firstRun) {
      nextScreen = const OnBoardScreen();
    } else {
      fetchUserData();
      nextScreen = const RootScreen();
    }

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Assets.image.pic.background.image(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height),
        Center(
            child: FadeTransition(
          opacity: _animation,
          child: SVGLoader(
            size: 200,
            path: Assets.image.svg.splashLogo,
          ),
        ))
      ],
    ));
  }

  Future<bool> isFirstTime() async {
    final pref = await SharedPreferences.getInstance();
    var isFirstTime = pref.getBool(isFirstRun);
    if (isFirstTime != null && !isFirstTime) {
      pref.setBool(isFirstRun, false);
      return false;
    } else {
      pref.setBool(isFirstRun, false);
      return true;
    }
  }
}
