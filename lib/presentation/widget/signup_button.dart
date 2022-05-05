import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';

class SignUpButton extends StatelessWidget {
  final String action;
  final String textButton;
  final Widget nextScreen;

  const SignUpButton(
      {Key? key,
      required this.action,
      required this.textButton,
      required this.nextScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
      },
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: textButton,
              style: getRegularStyle(
                  fontFamily: FontFamily.alegreyaSans,
                  color: ColorManager.white,
                  fontSize: FontSize.s20),
            ),
            TextSpan(
              text: action,
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
