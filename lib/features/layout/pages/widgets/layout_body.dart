import 'package:flutter/material.dart';
import '../../manager/layout_cubit.dart';
import '../../../home/views/home_view.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomeView(),
        ...List.generate(
          cubit.keys.length - 1,
          (index) => Placeholder(key: cubit.keys[index + 1]),
        ),
      ],
    );
  }
}
