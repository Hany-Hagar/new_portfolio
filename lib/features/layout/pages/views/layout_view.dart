import '../widgets/layout_body.dart';

import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_layout.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      controller: ScrollController(),
      body: const LayoutBody(),
    );
  }
}
