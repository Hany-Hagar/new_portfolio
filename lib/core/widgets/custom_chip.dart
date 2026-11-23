import 'custom_text.dart';
import '../enums/font_type.dart';

import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final String? title;
  final bool selected;
  final Widget? leading;
  final Color? backgroundColor;

  const CustomChip({
    super.key,
    this.title,
    this.leading,
    required this.label,
    this.backgroundColor,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    var hovered = false;
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return StatefulBuilder(
      builder: (_, setState) {
        final active = hovered || selected;
        var raduis = title != null
            ? BorderRadius.circular(12)
            : BorderRadius.circular(24);
        return MouseRegion(
          onEnter: (_) => setState(() => hovered = true),
          onExit: (_) => setState(() => hovered = false),
          child: Chip(
            avatar: leading,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            side: BorderSide(color: active ? primary : theme.dividerColor),
            shape: RoundedRectangleBorder(borderRadius: raduis),
            backgroundColor: active
                ? primary.withValues(alpha: 0.16)
                : backgroundColor,
            label: _Label(
              title: title,
              label: label,
              active: active,
              primary: primary,
            ),
          ),
        );
      },
    );
  }
}

class _Label extends StatelessWidget {
  final Color primary;
  final bool active;
  final String? title;
  final String label;
  const _Label({
    required this.title,
    required this.label,
    required this.active,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          CustomText(
            size: 10,
            text: title,
            color: primary,
            letterSpacing: 0.8,
            fontFamily: FontFamily.inter.value,
          ),
        CustomText(
          size: 12,
          text: label,
          color: active ? primary : null,
          fontFamily: FontFamily.inter.value,
        ),
      ],
    );
  }
}
