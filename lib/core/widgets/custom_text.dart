import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CustomText extends StatelessWidget {
  final double? size;
  final Color? color;
  final String? text;
  final double? height;
  final FontType? type;
  final String? fontFamily;
  final FontOpacity? opacity;
  final double? letterSpacing;
  final List<InlineSpan>? textSpans;
  final bool isAnimated;
  final AnimatedText Function(String text, TextStyle style)? animatedType;

  const CustomText({
    super.key,
    this.text,
    this.type,
    this.size,
    this.color,
    this.height,
    this.opacity,
    this.textSpans,
    this.fontFamily,
    this.letterSpacing,
    this.animatedType,
    this.isAnimated = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = _style(context, type ?? FontType.medium).copyWith(
      fontSize: size,
      height: height,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      color: (color ?? Theme.of(context).colorScheme.onSurface).withValues(
        alpha: _alpha(opacity ?? FontOpacity.high),
      ),
    );

    if (isAnimated) {
      final words = [
        ?text,
        ...?textSpans?.whereType<TextSpan>().map((s) => s.text ?? ''),
      ];

      return AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          for (final w in words)
            (animatedType ??
                (t, s) => TypewriterAnimatedText(
                  t,
                  textStyle: s,
                  speed: const Duration(milliseconds: 70),
                ))(
              w,
              baseStyle,
            ),
        ],
      );
    }

    return Text.rich(
      TextSpan(
        style: baseStyle,
        children: [
          if (text != null) TextSpan(text: text),
          ...?textSpans,
        ],
      ),
    );
  }
}

enum FontOpacity { high, medium, overLow, low }

enum FontType { header, overMedium, medium, overSmall, small }

TextStyle _style(BuildContext context, FontType type) => switch (type) {
  FontType.header => Theme.of(
    context,
  ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),
  FontType.overMedium => Theme.of(
    context,
  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
  FontType.medium => Theme.of(
    context,
  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
  FontType.overSmall => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
  FontType.small => Theme.of(
    context,
  ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400),
};

double _alpha(FontOpacity o) => switch (o) {
  FontOpacity.high => 1,
  FontOpacity.medium => 0.7,
  FontOpacity.overLow => 0.4,
  FontOpacity.low => 0.2,
};