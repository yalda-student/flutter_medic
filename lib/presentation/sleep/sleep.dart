import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/bottom_navigation.dart';
import 'package:flutter_medic_application/presentation/widget/drawer.dart';
import 'package:flutter_medic_application/presentation/widget/line_chart.dart';
import 'package:flutter_medic_application/presentation/widget/appbar.dart';
import 'package:flutter_medic_application/root/root.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    selectedIndex = noIndex;

    return AppDrawer(
      scaffold: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(height: AppSize.s35),
              Padding(
                  padding: const EdgeInsets.only(left: AppSize.s20),
                  child: Text(
                    'Sleep Session',
                    style: getMeduimStyle(
                        fontFamily: FontFamily.alegreya,
                        color: ColorManager.white,
                        fontSize: 35),
                  )),
              const SizedBox(height: AppSize.s25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SessionItem(
                      title: 'Sleep',
                      time: '5h 30min',
                      color: Color(0xff69B09C),
                      iconData: Icons.bedtime),
                  SessionItem(
                      title: 'Deep',
                      time: '1h 10min',
                      color: Color(0xff498A78),
                      iconData: Icons.snooze),
                  SessionItem(
                      title: 'Quality',
                      time: '3h 30min',
                      color: Color(0xff69B09C),
                      iconData: Icons.star),
                ],
              ),
              const SizedBox(height: AppSize.s35),
              Padding(
                  padding: const EdgeInsets.only(left: AppSize.s20),
                  child: Text(
                    'Bedtime',
                    style: getMeduimStyle(
                        fontFamily: FontFamily.alegreya,
                        color: ColorManager.white,
                        fontSize: 35),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: AppSize.s16, right: AppSize.s16),
                  child: AppLineChart()),
            ],
          ),
        ),
        bottomNavigationBar: AppBottomNavigation(
          selectedIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RootScreen(),
                ));
          },
        ),
      ),
    );
  }
}

class SessionItem extends StatelessWidget {
  final String title;
  final String time;
  final Color color;
  final IconData iconData;

  const SessionItem(
      {Key? key,
      required this.title,
      required this.time,
      required this.color,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 165,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: ColorManager.white,
          ),
          const SizedBox(height: AppSize.s18),
          Text(
            time,
            style: getMeduimStyle(
                fontFamily: FontFamily.alegreyaSans,
                color: ColorManager.white,
                fontSize: FontSize.s18),
          ),
          Text(
            title,
            style: getRegularStyle(
                fontFamily: FontFamily.alegreyaSans,
                color: ColorManager.white,
                fontSize: FontSize.s14),
          ),
        ],
      ),
    );
  }
}
