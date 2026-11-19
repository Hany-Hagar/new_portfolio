import 'package:flutter/material.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Placeholder(), Placeholder(), Placeholder(), Placeholder()],
    );
  }
}
