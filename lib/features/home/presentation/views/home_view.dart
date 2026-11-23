import '../widgets/home_body.dart';
import '../widgets/home_avatar.dart';

import 'package:flutter/material.dart';

import '../widgets/home_tech_banner.dart';
import '../../../../core/widgets/custom_view.dart';

class HomeView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(
      body: Row(
        spacing: 10,
        children: [
          Expanded(child: HomeBody()),
          Expanded(child: HomeAvatar()),
        ],
      ),
      bottom: HomeTechBanner(),
    );
  }
}
