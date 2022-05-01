import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPress;

  const Button({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress,
      child: Text(text, style: const TextStyle(letterSpacing: 1.5)),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(321, 61),
        maximumSize: const Size(321, 61),
      ),
    );
  }
}
