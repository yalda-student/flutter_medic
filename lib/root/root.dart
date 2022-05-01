import 'package:flutter/material.dart';
import 'package:flutter_medic_application/presentation/main/main_screen.dart';
import 'package:flutter_medic_application/presentation/profile/profile.dart';
import 'package:flutter_medic_application/presentation/sound/sound.dart';
import 'package:flutter_medic_application/presentation/widget/bottom_navigation.dart';

const int mainIndex = 0;
const int soundIndex = 1;
const int profileIndex = 2;

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = mainIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _mainKey = GlobalKey();
  final GlobalKey<NavigatorState> _soundKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

 late final map = {
    mainIndex: _mainKey,
    soundIndex: _soundKey,
    profileIndex: _profileKey,
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            _navigator(_mainKey, mainIndex, const MainScreen()),
            _navigator(_soundKey, soundIndex, const SoundScreen()),
            _navigator(_profileKey, profileIndex, const ProfileScreen()),
          ],
        ),
        bottomNavigationBar: AppBottomNavigation(
          selectedIndex: selectedIndex,
          onTap: (index) {
            _history.remove(selectedIndex);
            _history.add(selectedIndex);
            selectedIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (setting) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: selectedIndex != index,
                child: child,
              ),
            ),
          );
  }

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedIndex]!.currentState!;

    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }
}
