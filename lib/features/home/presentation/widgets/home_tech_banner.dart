import 'package:flutter/material.dart';

import '../../../../core/enums/font_type.dart';
import '../../../../core/widgets/custom_text.dart';

import 'package:flutter_animate/flutter_animate.dart';

class HomeTechBanner extends StatelessWidget {
  const HomeTechBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: const _TechBannerRow()
              .animate(onPlay: (c) => c.repeat())
              .slideX(end: -0.5, curve: Curves.linear, duration: 26.seconds),
        ),
      ],
    );
  }
}

class _TechBannerRow extends StatelessWidget {
  const _TechBannerRow();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      spacing: 34,
      children: [
        for (final tech in [...techBanner, ...techBanner]) ...[
          CustomText(
            size: 22,
            text: tech,
            type: FontType.medium,
            color: scheme.onSurfaceVariant,
            fontFamily: FontFamily.spaceGrotesk.value,
          ),
          CustomText(size: 22, text: '✦', color: scheme.primary),
        ],
      ],
    );
  }
}

const techBanner = [
  'Flutter',
  'Dart',
  'BLoC / Cubit',
  'Clean Architecture',
  'Firebase',
  'Dio',
  'GetIt',
  'Hive',
];
