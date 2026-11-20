import '../widgets/layout_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/action_model.dart';
import '../../../../core/widgets/custom_layout.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      controller: ScrollController(),
      appBar: CustomAppBar(title: "Hany Hagar", actions: actions),
      body: const LayoutBody(),
    );
  }
}
