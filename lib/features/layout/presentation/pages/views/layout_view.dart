import '../widgets/layout_body.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../core/models/action_model.dart';
import '../../../../../core/widgets/custom_layout.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return CustomLayout(
      controller: ScrollController(),
      appBar: CustomAppBar(
        actions: actions,
        title: "Hany Hagar",
        actionTap: (value) => cubit.scrollTo(value),
      ),
      body: const LayoutBody(),
    );
  }
}
