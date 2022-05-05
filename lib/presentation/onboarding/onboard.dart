import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/login/login.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/signup/signup.dart';
import 'package:flutter_medic_application/presentation/widget/button.dart';
import 'package:flutter_medic_application/presentation/widget/signup_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

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
                  width: 200,
                  height: 200,
                  child: SvgPicture.asset(Assets.image.svg.logo)),
              const SizedBox(height: AppSize.s35),
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
                      builder: (context) =>  LoginScreen(),
                    ));
                  }),
              const SizedBox(height: AppSize.s20),
               SignUpButton(
                  action: 'Sign Up',
                  textButton: "Don't have an account? ",
                  nextScreen: SingUpScreen()),
              const SizedBox(height: AppSize.s28),
            ],
          ),
        ),
      ),
    );
  }
}
