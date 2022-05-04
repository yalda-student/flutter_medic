import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/bar_chart.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _AppBar(),
        ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: Assets.image.pic.profile.image(width: 240, height: 210),
        ),
        Text(
          'Yalda Student',
          style: getMeduimStyle(
              fontFamily: FontFamily.alegreya,
              color: ColorManager.white,
              fontSize: FontSize.s34),
        ),
        Text('Fars, Iran',
            style: getRegularStyle(
                fontFamily: FontFamily.alegreyaSans,
                color: ColorManager.white,
                fontSize: FontSize.s20)),
        Expanded(
          child: ContainedTabBarView(
            initialIndex: 0,
            tabs: const [
              Text('STATS'),
              Text('ACHIEVEMENTS'),
            ],
            views: const [
              Center(child: AppBarChart()),
              Center(
                  child: Icon(Icons.account_circle, color: ColorManager.milky)),
            ],
            tabBarProperties: const TabBarProperties(
              indicatorColor: Color(0xff95CBCF),
              labelColor: ColorManager.white,
              unselectedLabelColor: Color(0xff3A5051),
            ),
            tabBarViewProperties:
                const TabBarViewProperties(physics: BouncingScrollPhysics()),
          ),
        ),
      ],
    );
  }

  Widget getTabBarChild(BuildContext context, int index) {
    return TabBarItem(
        index: index,
        transform: ScaleTransform(
            maxScale: 1.3,
            transform: ColorsTransform(
              normalColor: const Color(0xff3A5051).withOpacity(0.5),
              highlightColor: const Color(0xff95CBCF),
              builder: (context, color) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    index == 0 ? 'STATS' : 'ACHIEVEMENTS',
                    style: TextStyle(fontSize: 14, color: color),
                  ),
                );
              },
            )));
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: SVGLoader(size: AppSize.s35, path: Assets.image.svg.logo),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'edit',
              style: getMeduimStyle(
                  fontFamily: FontFamily.alegreyaSans,
                  color: ColorManager.white,
                  fontSize: FontSize.s15),
            ))
      ],
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Assets.image.pic.hamburger.image(
          width: AppSize.s8,
          height: AppSize.s8,
        ),
      ),
    );
  }
}
