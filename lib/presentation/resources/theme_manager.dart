import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors of the app
      primaryColor: ColorManager.greyText,
      scaffoldBackgroundColor: ColorManager.primary,

      //card view theme

      //appbar theme
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s0,
          shadowColor: ColorManager.primaryOpacity70),
      //button theme
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          buttonColor: ColorManager.buttonBackground,
          splashColor: ColorManager.primaryOpacity70),
      //elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
            color: ColorManager.white,
            fontFamily: FontFamily.alegreyaSans,
            fontSize: 25),
        primary: ColorManager.buttonBackground,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10)),
      )),
      //text theme
      textTheme: const TextTheme(),
      //input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(

        labelStyle: getRegularStyle(
            fontFamily: FontFamily.alegreyaSans,
            color: ColorManager.white,
            fontSize: FontSize.s18),
        hintStyle: getRegularStyle(
            fontFamily: FontFamily.alegreyaSans,
            color: ColorManager.greyText,
            fontSize: FontSize.s18),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.greyText),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.greyText),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.greyText),
        ),
      ));
}
