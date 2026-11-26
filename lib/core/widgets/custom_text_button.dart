import 'custom_text.dart';
import '../enums/font_type.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final double itemSize;
  final FaIconData? icon;
  final bool isIconAtStart;
  final double itemSpacing;
  final VoidCallback? onPressed;
  const CustomTextButton({
    super.key,
    this.icon,
    this.onPressed,
    required this.title,
    this.itemSpacing = 8,
    required this.itemSize,
    this.isIconAtStart = true,
  });

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.primary;
    return TextButton(
      onPressed: onPressed,
      child: Row(
        spacing: itemSpacing,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isIconAtStart && icon != null) _icon(icon!, color: color),
          CustomText(
            text: title,
            size: itemSize,
            fontFamily: FontFamily.inter.value,
            color: color,
          ),
          if (!isIconAtStart && icon != null) _icon(icon!, color: color),
        ],
      ),
    );
  }

  Widget _icon(FaIconData icon, {required Color color}) {
    return FaIcon(icon, size: itemSize - 2, color: color);
  }
}
