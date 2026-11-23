import 'package:flutter/material.dart';
import '../data/models/experience_model.dart';
import '../../../../core/enums/font_type.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_text.dart';
import '../presentation/widgets/experience_card_more.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experience;
  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      body: Column(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Top(experience: experience),
          _Sub(experience: experience),
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final ExperienceModel experience;
  const _Top({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          size: 13,
          type: FontType.medium,
          text: experience.organization,
          fontFamily: FontFamily.inter.value,
          color: Theme.of(context).colorScheme.primary,
        ),
        CustomText(
          size: 13,
          type: FontType.small,
          text: experience.period,
          opacity: FontOpacity.medium,
          fontFamily: FontFamily.inter.value,
        ),
      ],
    );
  }
}

class _Sub extends StatelessWidget {
  final ExperienceModel experience;
  const _Sub({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(size: 21, text: experience.title, type: FontType.overMedium),
        CustomText(
          size: 15,
          type: FontType.overSmall,
          opacity: FontOpacity.medium,
          text: experience.description,
          fontFamily: FontFamily.inter.value,
        ),
        ExperienceCardMore(experience: experience),
      ],
    );
  }
}
