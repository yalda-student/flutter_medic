import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
            child: SVGLoader(
          size: 200,
          path: Assets.image.svg.splashLogo,
        ))
      ],
    ));
  }
}
