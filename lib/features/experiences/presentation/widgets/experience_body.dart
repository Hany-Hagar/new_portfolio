import 'experience_card.dart';

import 'package:flutter/material.dart';

import '../../data/database/experience_database.dart';
import '../../../../core/widgets/custom_timeline.dart';

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTimeline(
      current: experiences.length - 1,
      linePosition: TimelineLinePosition.start,
      activeColor: Theme.of(context).colorScheme.primary,
      children: experiences
          .map((experience) => ExperienceCard(experience: experience))
          .toList(),
    );
  }
}
