import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/login/login.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/button.dart';
import 'package:flutter_medic_application/presentation/widget/signup_button.dart';
import 'package:flutter_medic_application/root/root.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SingUpScreen({Key? key}) : super(key: key);

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
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextField(
                                controller: _nameController, hint: 'Name'),
                            const SizedBox(height: AppSize.s20),
                            AppTextField(
                                controller: _emailController,
                                hint: 'Email Address'),
                            const SizedBox(height: AppSize.s20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              decoration:
                                  const InputDecoration(hintText: 'Password'),
                              style: getRegularStyle(
                                  fontFamily: FontFamily.alegreyaSans,
                                  color: ColorManager.white,
                                  fontSize: FontSize.s20),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your password.';
                                }
                                return null;
                              },
                            )
                          ],
                        )),
                    const SizedBox(height: AppSize.s20),
                    Center(
                        child: Button(
                            text: 'SIGNUP', onPress: () => signUp(context))),
                    Center(
                        child: SignUpButton(
                            action: 'Sign In',
                            textButton: "Already have an account? ",
                            nextScreen: LoginScreen())),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void signUp(BuildContext context) {
    var validate = _formKey.currentState!.validate();
    if (validate) {
      saveUser();
      fetchUserData();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RootScreen()));
    }
  }

  void saveUser() async {
    final pref = await SharedPreferences.getInstance();

    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    pref.setString(savedName, name);
    debugPrint('name: $name');
    pref.setString(savedEmail, email);
    debugPrint('name: $name');
    pref.setString(savedPassword, password);
    debugPrint('name: $name');
  }
}

class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const AppTextField({Key? key, required this.controller, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: hint == 'Email Address'
          ? TextInputType.emailAddress
          : TextInputType.text,
      decoration: InputDecoration(hintText: hint),
      style: getRegularStyle(
          fontFamily: FontFamily.alegreyaSans,
          color: ColorManager.white,
          fontSize: FontSize.s20),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Fill the box.';
        }
        if (hint == 'Email Address' && !value.contains('@')) {
          return 'Enter valid email address.';
        }
        return null;
      },
    );
  }
}
