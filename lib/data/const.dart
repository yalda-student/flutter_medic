import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

int selectedIndex = mainIndex;

const int noIndex = -1;
const int mainIndex = 0;
const int soundIndex = 1;
const int profileIndex = 2;

final advancedDrawerController = AdvancedDrawerController();
final List<int> _history = [];
