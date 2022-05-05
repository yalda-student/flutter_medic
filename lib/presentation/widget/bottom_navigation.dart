import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';

class AppBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const AppBottomNavigation(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: AppSize.bottomNavigationHeight,
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BottomNavigationItem(
            activePath:
                SVGLoader(size: AppSize.s35, path: Assets.image.svg.logo),
            inactivePath: SVGLoader(
              size: AppSize.s30,
              path: Assets.image.svg.logo,
              color: ColorManager.white.withOpacity(0.4),
            ),
            isActive: selectedIndex == mainIndex,
            onTap: () => onTap(mainIndex),
            size: 100,
          ),
          _BottomNavigationItem(
            activePath: Assets.image.pic.soundActive.image(),
            inactivePath: Assets.image.pic.soundsInactive.image(),
            isActive: selectedIndex == soundIndex,
            onTap: () => onTap(soundIndex),
          ),
          _BottomNavigationItem(
            activePath: Assets.image.pic.userActive.image(),
            inactivePath: Assets.image.pic.userInactive.image(),
            isActive: selectedIndex == profileIndex,
            onTap: () => onTap(profileIndex),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final Function() onTap;
  final Widget activePath;
  final Widget inactivePath;
  final bool isActive;
  double size;

  _BottomNavigationItem(
      {Key? key,
      required this.activePath,
      required this.inactivePath,
      required this.isActive,
      required this.onTap,
      this.size = AppSize.s28})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isActive ? activePath : inactivePath,
    );
  }
}
