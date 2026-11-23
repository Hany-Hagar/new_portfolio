import 'package:flutter/material.dart';
import '../../../../core/enums/font_type.dart';
import '../../data/models/experience_model.dart';
import '../../../../core/widgets/custom_list.dart';
import '../../data/models/experience_project.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../../core/widgets/custom_text.dart';

class ExperienceCardMore extends StatelessWidget {
  final ExperienceModel experience;
  const ExperienceCardMore({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (experience.highlights.isNotEmpty)
          _Highlights(highlights: experience.highlights),
        if (experience.projects.isNotEmpty)
          _Projects(projects: experience.projects),
        if (experience.technologies.isNotEmpty)
          _Techs(techs: experience.technologies),
      ],
    );
  }
}

class _Techs extends StatelessWidget {
  final List<String> techs;
  const _Techs({required this.techs});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).scaffoldBackgroundColor;
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: techs
            .map((tech) => CustomChip(label: tech, backgroundColor: color))
            .toList(),
      ),
    );
  }
}

class _Highlights extends StatelessWidget {
  final List<String> highlights;
  const _Highlights({required this.highlights});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: highlights
          .map(
            (highlight) => CustomText(
              size: 14,
              height: 1.6,
              type: FontType.overSmall,
              opacity: FontOpacity.medium,
              fontFamily: FontFamily.inter.value,
              textSpans: [
                TextSpan(
                  text: '▹',
                  style: TextStyle(color: primary),
                ),
                const WidgetSpan(child: SizedBox(width: 10)),
                TextSpan(text: highlight),
              ],
            ),
          )
          .toList(),
    );
  }
}

class _Projects extends StatelessWidget {
  final List<ExperienceProject> projects;
  const _Projects({required this.projects});

  @override
  Widget build(BuildContext context) {
    return CustomList<ExperienceProject>(
      gap: 11,
      items: projects,
      padding: EdgeInsets.symmetric(vertical: 6),
      itemBuilder: (project) => _Item(project: project),
      columnSpans: projects.map((e) => e.spanFor(context)).toList(),
    );
  }
}

class _Item extends StatelessWidget {
  final ExperienceProject project;
  const _Item({required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(size: 15, text: project.name, type: FontType.medium),
          CustomText(
            size: 13,
            height: 1.5,
            type: FontType.small,
            text: project.description,
            opacity: FontOpacity.medium,
            fontFamily: FontFamily.inter.value,
          ),
        ],
      ),
    );
  }
}
