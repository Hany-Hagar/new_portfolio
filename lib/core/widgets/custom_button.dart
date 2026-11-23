import 'custom_text.dart';
import '../enums/font_type.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? width;
  final bool outlined;
  final IconData? icon;
  final double? height;
  final double itemSize;
  final VoidCallback? onPressed;
  const CustomButton({
    super.key,
    this.icon,
    this.width,
    this.height,
    this.onPressed,
    this.itemSize = 14,
    required this.label,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    var hovered = false;
    final scheme = Theme.of(context).colorScheme;

    return StatefulBuilder(
      builder: (_, setState) => MouseRegion(
        onEnter: (_) => setState(() => hovered = true),
        onExit: (_) => setState(() => hovered = false),
        child: AnimatedContainer(
          width: width,
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, hovered ? -3 : 0, 0),
          child: FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              minimumSize: Size(0, height ?? 54),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              backgroundColor: outlined ? scheme.surface : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: outlined ? scheme.outline : scheme.primary,
                ),
              ),
            ),
            child: _Body(
              label: label,
              icon: icon,
              itemSize: itemSize,
              outlined: outlined,
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final String label;
  final IconData? icon;
  final double itemSize;
  final bool outlined;
  const _Body({
    required this.label,
    required this.icon,
    required this.itemSize,
    required this.outlined,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = outlined ? scheme.onSurface : scheme.onPrimary;
    return Row(
      spacing: 2,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          color: color,
          text: label,
          size: itemSize,
          type: FontType.medium,
          fontFamily: FontFamily.inter.value,
        ),
        if (icon != null) Icon(icon, color: color, size: itemSize - 2.3),
      ],
    );
  }
}
