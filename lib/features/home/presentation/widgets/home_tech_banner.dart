import 'package:flutter/material.dart';

import '../../data/database/home_data.dart';
import '../../../../core/enums/font_type.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_divider.dart';

import 'package:flutter_animate/flutter_animate.dart';

class HomeTechBanner extends StatelessWidget {
  const HomeTechBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomDivider(),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: _TechBannerRow(techBanner: homeData.techBanner)
              .animate(onPlay: (c) => c.repeat())
              .slideX(end: -0.5, curve: Curves.linear, duration: 26.seconds),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class _TechBannerRow extends StatelessWidget {
  final List<String> techBanner;

  const _TechBannerRow({required this.techBanner});

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
