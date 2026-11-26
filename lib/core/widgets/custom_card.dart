import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget body;
  final Color? glowColor;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;
  const CustomCard({
    super.key,
    this.onTap,
    this.padding,
    this.glowColor,
    this.clipBehavior = Clip.antiAlias,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    var hovered = false;
    final colors = Theme.of(context).colorScheme;
    final glow = glowColor ?? colors.primary;
    return GestureDetector(
      onTap: onTap,
      child: StatefulBuilder(
        builder: (_, setState) => MouseRegion(
          onEnter: (_) => setState(() => hovered = true),
          onExit: (_) => setState(() => hovered = false),
          child: AnimatedContainer(
            clipBehavior: clipBehavior,
            duration: const Duration(milliseconds: 300),
            padding: padding ?? const EdgeInsets.all(16),
            curve: const Cubic(0.2, 0.7, 0.2, 1),
            transform: Matrix4.translationValues(0, hovered ? -6 : 0, 0),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: hovered ? glow : colors.outline),
              boxShadow: [
                BoxShadow(
                  color: glow.withValues(alpha: hovered ? 0.35 : 0),
                  blurRadius: 34,
                  spreadRadius: -18,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
