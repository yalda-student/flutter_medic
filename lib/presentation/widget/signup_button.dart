import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/signup/signup.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SingUpScreen(),
        ));
      },
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Don't have an account? ",
              style: getRegularStyle(
                  fontFamily: FontFamily.alegreyaSans,
                  color: ColorManager.white,
                  fontSize: FontSize.s20),
            ),
            TextSpan(
              text: 'Sign Up',
              style: getBoldStyle(
                  fontFamily: FontFamily.alegreya,
                  color: ColorManager.white,
                  fontSize: FontSize.s20),
            ),
          ],
        ),
      ),
    );
  }
}
