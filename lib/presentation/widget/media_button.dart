import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';

class PlayMediaButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color color;

  const PlayMediaButton(
      {Key? key,
      required this.title,
      required this.bgColor,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: getMeduimStyle(
                  fontFamily: FontFamily.alegreyaSans,
                  color: color,
                  fontSize: FontSize.s14)),
          const SizedBox(width: AppSize.s4),
          Icon(Icons.play_circle, color: color,)
        ],
      ),
    );
  }
}
