import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/assets.gen.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';
import 'package:flutter_medic_application/presentation/widget/svg_loader.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: SVGLoader(size: AppSize.s35, path: Assets.image.svg.logo),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Assets.image.pic.profile
                .image(width: 40, height: 40))
      ],
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Assets.image.pic.hamburger
            .image(width: AppSize.s8, height: AppSize.s8,),
      ),
    );
  }
}
