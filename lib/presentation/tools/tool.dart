import 'package:flutter/material.dart';
import 'package:flutter_medic_application/data/const.dart';
import 'package:flutter_medic_application/data/tools.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/appbar.dart';
import 'package:flutter_medic_application/presentation/widget/bottom_navigation.dart';
import 'package:flutter_medic_application/presentation/widget/drawer.dart';
import 'package:flutter_medic_application/presentation/widget/tool_item.dart';
import 'package:flutter_medic_application/root/root.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    selectedIndex = noIndex;

    return AppDrawer(
      scaffold: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const SizedBox(height: AppSize.s35),
            Padding(
                padding: const EdgeInsets.only(left: AppSize.s20),
                child: Text(
                  'Tools',
                  style: getMeduimStyle(
                      fontFamily: FontFamily.alegreya,
                      color: ColorManager.white,
                      fontSize: 35),
                )),
            const SizedBox(height: AppSize.s35),
            Center(
              child: Wrap(
                  spacing: AppSize.s35,
                  runSpacing: AppSize.s35,
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    ToolItem(data: tools[0]),
                    ToolItem(data: tools[1]),
                    ToolItem(data: tools[2]),
                    ToolItem(data: tools[3]),
                    ToolItem(data: tools[4]),
                  ]),
            )
          ],
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
