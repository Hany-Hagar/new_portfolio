import 'home_quick_facts.dart';
import 'package:flutter/material.dart';
import '../../../../core/enums/font_type.dart';
import '../../../layout/manager/layout_cubit.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_divider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 18,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Tag(),
        _Title(),
        _Description(),
        _Buttons(),
        CustomDivider(endIndent: 14, padding: EdgeInsets.only(top: 10),),
        QuickFacts(),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag();

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
        ),
        CustomText(
          size: 12,
          color: primary,
          letterSpacing: 0.96,
          type: FontType.medium,
          fontFamily: FontFamily.inter.value,
          text: 'FLUTTER DEVELOPER · CAIRO, EGYPT',
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return CustomText(
      size: 65,
      height: 1.05,
      type: FontType.overMedium,
      letterSpacing: -0.02 * 60,
      fontFamily: FontFamily.spaceGrotesk.value,
      textSpans: [
        const TextSpan(text: 'Cross-platform apps,\n'),
        TextSpan(
          text: 'built to last.',
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationThickness: 1,
            decorationColor: primary,
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 470),
      child: CustomText(
        size: 15,
        height: 1.6,
        type: FontType.medium,
        fontFamily: FontFamily.inter.value,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        text: "I'm Hany Magdy Hagar. I build reliable, user-focused mobile apps with ",
        textSpans: const [
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: _AnimatedSkills(),
          ),
        ],
      ),
    );
  }
}

const _skills = [
  'Flutter and Dart.',
  'BLoC / Cubit.',
  'Clean Architecture.',
  'REST APIs and Firebase.',
];

class _AnimatedSkills extends StatelessWidget {
  const _AnimatedSkills();

  @override
  Widget build(BuildContext context) {
    return CustomText(
      size: 15,
      height: 1.6,
      isAnimated: true,
      type: FontType.medium,
      fontFamily: FontFamily.spaceGrotesk.value,
      textSpans: [for (final skill in _skills) TextSpan(text: skill)],
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        CustomButton(
          label: 'View projects',
          onPressed: () => cubit.scrollTo(2),
        ),
        CustomButton(
          outlined: true,
          label: 'Get in touch',
          onPressed: () => cubit.scrollTo(4),
        ),
      ],
    );
  }
}
