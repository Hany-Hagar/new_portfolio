import 'package:flutter/material.dart';
import '../../manager/layout_cubit.dart';
import '../../../experiences/presentation/views/experience_view.dart';
import '../../../home/presentation/views/home_view.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomeView(key: cubit.keys[0]),
        ExperienceView(key: cubit.keys[1]),
        ...List.generate(
          cubit.keys.length - 2,
          (index) => Placeholder(key: cubit.keys[index + 2]),
        ),
      ],
    );
  }
}
