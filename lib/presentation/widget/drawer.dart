import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/meditation/meditation.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/sleep/sleep.dart';
import 'package:flutter_medic_application/presentation/tools/tool.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';

class AppDrawer extends StatelessWidget {

  final Scaffold scaffold;

  const AppDrawer({Key? key, required this.scaffold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      openRatio: 0.6,
      openScale: 0.8,
      backdropColor: ColorManager.buttonBackground,
      controller: advancedDrawerController,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black12, blurRadius: 0.0)
        ],
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
      ),
      animationDuration: const Duration(milliseconds: 500),
      drawer: const _Drawer(),
      child: scaffold,
    );
  }
}


class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorManager.buttonBackground,
        child: ListTileTheme(
          textColor: ColorManager.primary,
          iconColor: ColorManager.primary,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.s12),
                  child: SVGLoader(
                    path: Assets.image.svg.logo,
                    size: AppSize.s20,
                    color: ColorManager.primary,
                  ),
                ),
              ),
              ListTile(
                onTap: () => openScreen(context,  const ToolsScreen()),
                leading: const Icon(Icons.home),
                title: Text(
                  'Tools',
                  style: getSemiBoldStyle(
                      fontFamily: FontFamily.alegreya,
                      fontSize: FontSize.s18,
                      color: ColorManager.primary),
                ),
              ),
              ListTile(
                onTap: () => openScreen(context, const SleepScreen()),
                leading: const Icon(Icons.account_circle_rounded),
                title: Text(
                  'Sleep',
                  style: getSemiBoldStyle(
                      fontFamily: FontFamily.alegreya,
                      fontSize: FontSize.s18,
                      color: ColorManager.primary),
                ),
              ),
              ListTile(
                onTap: () => openScreen(context, const MeditationScreen()),
                leading: const Icon(Icons.favorite),
                title: Text(
                  'Meditation',
                  style: getSemiBoldStyle(
                      fontFamily: FontFamily.alegreya,
                      fontSize: FontSize.s18,
                      color: ColorManager.primary),
                ),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: getMeduimStyle(
                    fontFamily: FontFamily.alegreya,
                    color: ColorManager.primary.withOpacity(0.85)),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openScreen(BuildContext context, Widget nextScreen) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => nextScreen,
    ));
    advancedDrawerController.hideDrawer();
  }
}