import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              child: Assets.image.pic.leaf.image(
                  fit: BoxFit.cover,
                  height: 300,
                  width: MediaQuery.of(context).size.width)),
          Positioned.fill(
            bottom: 160,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height - 160,
                padding: const EdgeInsets.all(AppSize.s12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: AppSize.s20),
                    SvgPicture.asset(Assets.image.svg.logo,
                        width: AppSize.s60, height: AppSize.s65),
                    Text('Sign Up',
                        style: getMeduimStyle(
                            fontFamily: FontFamily.alegreya,
                            color: ColorManager.white,
                            fontSize: FontSize.s30)),
                    Text(
                      'Sign up now for free and start meditating, and explore Medic.',
                      style: getRegularStyle(
                          fontFamily: FontFamily.alegreyaSans,
                          color: ColorManager.white.withOpacity(0.7),
                          fontSize: FontSize.s22),
                    ),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(hintText: 'Name'),
                        style: getRegularStyle(
                            fontFamily: FontFamily.alegreyaSans,
                            color: ColorManager.white,
                            fontSize: FontSize.s20)),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            const InputDecoration(hintText: 'Email Address'),
                        style: getRegularStyle(
                            fontFamily: FontFamily.alegreyaSans,
                            color: ColorManager.white,
                            fontSize: FontSize.s20)),
                    TextFormField(
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(hintText: 'Password'),
                      style: getRegularStyle(
                          fontFamily: FontFamily.alegreyaSans,
                          color: ColorManager.white,
                          fontSize: FontSize.s20),
                    ),
                    const SizedBox(height: AppSize.s20),
                    Center(child: Button(text: 'SUGNUP', onPress: () {})),
                    // const Center(child: SignUpButton()),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
