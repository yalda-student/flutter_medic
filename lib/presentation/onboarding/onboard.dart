import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/login/login.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/button.dart';
import 'package:flutter_medic_application/presentation/widget/signup_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoradScreen extends StatelessWidget {
  const OnBoradScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Assets.image.pic.background, fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: AppSize.s350,
                  height: AppSize.s350,
                  child: SvgPicture.asset(Assets.image.svg.logo)),
              Text(
                'WELCOME',
                style: getBoldStyle(
                    fontFamily: FontFamily.alegreya,
                    color: ColorManager.white,
                    fontSize: FontSize.s34),
              ),
              const SizedBox(height: AppSize.s20),
              Text(
                'Do meditation. Stay focused.\nLive a healthy life.',
                style: getMeduimStyle(
                    fontFamily: FontFamily.alegreyaSans,
                    color: ColorManager.white,
                    fontSize: FontSize.s20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.s65),
              Button(
                  text: 'Login With Email',
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  }),
              const SizedBox(height: AppSize.s20),
              const SignUpButton(),
              const SizedBox(height: AppSize.s28),
            ],
          ),
        ),
      ),
    );
  }
}
