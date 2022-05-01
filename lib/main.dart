import 'package:flutter/material.dart';
import 'package:flutter_medic_application/presentation/meditation/meditation.dart';
import 'package:flutter_medic_application/presentation/resources/theme_manager.dart';
import 'package:flutter_medic_application/root/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Medic',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: const MeditationScreen(),
    );
  }
}
