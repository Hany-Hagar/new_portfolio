import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const CustomDivider({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Divider(thickness: 1, color: Theme.of(context).dividerColor),
    );
  }
}
