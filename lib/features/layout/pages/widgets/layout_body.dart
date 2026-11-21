import 'package:flutter/material.dart';

import '../../manager/layout_cubit.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        cubit.keys.length,
        (index) => Placeholder(key: cubit.keys[index]),
      ),
    );
  }
}
