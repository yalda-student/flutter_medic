import 'package:flutter/cupertino.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

//regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    required String fontFamily,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.regular, color);
}

//light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    required String fontFamily,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.light, color);
}

//bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required String fontFamily,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.bold, color);
}

//semi bold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    required String fontFamily,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.semibold, color);
}

//meduim style
TextStyle getMeduimStyle(
    {double fontSize = FontSize.s12,
    required String fontFamily,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.medium, color);
}
