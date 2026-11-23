import 'home_quick_facts.dart';
import 'package:flutter/material.dart';
import '../../data/database/home_data.dart';
import '../../../../core/enums/font_type.dart';
import '../../../layout/manager/layout_cubit.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_divider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Tag(tag: homeData.tag),
        _Title(
          title: homeData.title,
          highlightedTitle: homeData.highlightedTitle,
        ),
        _Description(
          skills: homeData.skills,
          description: homeData.description,
        ),
        const _Buttons(),
        const CustomDivider(endIndent: 14, padding: EdgeInsets.only(top: 10)),
        QuickFacts(quickFacts: homeData.quickFacts),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String tag;

  const _Tag({required this.tag});

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
          text: tag,
          size: 12,
          color: primary,
          letterSpacing: 0.96,
          type: FontType.medium,
          fontFamily: FontFamily.inter.value,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String highlightedTitle;

  const _Title({required this.title, required this.highlightedTitle});

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
        TextSpan(text: title),
        TextSpan(
          text: highlightedTitle,
          style: TextStyle(
            decorationThickness: 1,
            decorationColor: primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  final String description;
  final List<String> skills;

  const _Description({required this.description, required this.skills});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 470),
      child: CustomText(
        size: 15,
        height: 1.6,
        text: description,
        type: FontType.medium,
        fontFamily: FontFamily.inter.value,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        textSpans: [
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: _AnimatedSkills(skills: skills),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSkills extends StatelessWidget {
  final List<String> skills;

  const _AnimatedSkills({required this.skills});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      size: 15,
      height: 1.6,
      isAnimated: true,
      type: FontType.medium,
      fontFamily: FontFamily.spaceGrotesk.value,
      textSpans: [for (final skill in skills) TextSpan(text: skill)],
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