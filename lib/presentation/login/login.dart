import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/signup/signup.dart';
import 'package:flutter_medic_application/presentation/widget/button.dart';
import 'package:flutter_medic_application/presentation/widget/signup_button.dart';
import 'package:flutter_medic_application/root/root.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

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
            bottom: 200,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height - 180,
                padding: const EdgeInsets.all(AppSize.s12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: AppSize.s20),
                    SvgPicture.asset(Assets.image.svg.logo,
                        width: AppSize.s60, height: AppSize.s65),
                    Text('Sign In',
                        style: getMeduimStyle(
                            fontFamily: FontFamily.alegreya,
                            color: ColorManager.white,
                            fontSize: FontSize.s30)),
                    Text(
                      'Sign in now to access your exercises and saved music.',
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
                                controller: _emailController,
                                hint: 'Email Address'),
                            const SizedBox(height: AppSize.s20),
                            TextFormField(
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
                            ),
                          ],
                        )),
                    const SizedBox(height: AppSize.s20),
                    Center(
                        child: Button(
                            text: 'LOGIN',
                            onPress: () {
                              login(context);
                            })),
                    Center(
                        child: SignUpButton(
                      action: 'Sign Up',
                      textButton: "Don't have an account? ",
                      nextScreen: SingUpScreen(),
                    )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void login(BuildContext context) async {
    var validate = _formKey.currentState!.validate();
    if (validate) {
      var isAuthorized = await authorization(context);
      if (isAuthorized) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RootScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('This user does not exist.')));
      }
    }
  }

  authorization(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString(savedEmail);
    final password = pref.getString(savedPassword);

    if (email == null || password == null) {
      return false;
    } else if (email != _emailController.text ||
        password != _passwordController.text) {
      return false;
    }
    return true;
  }
}
