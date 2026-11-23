import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double endIndent;
  final EdgeInsetsGeometry? padding;
  const CustomDivider({super.key, this.padding, this.endIndent = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Divider(thickness: 1, color: Theme.of(context).dividerColor,endIndent: endIndent,),
    );
  }
}
