import 'package:flutter/material.dart';

import '../../data/models/project_model.dart';
import '../../../../core/enums/font_type.dart';
import '../../../../core/enums/device_type.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/utils/url_service.dart';
import '../views/project_view.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  const ProjectCard({super.key, required this.project});

  static const double coverMinHeight = 200;

  @override
  Widget build(BuildContext context) {
    final isRow = project.desktopSpan == 12 && !context.isMobile;
    return CustomCard(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProjectView(project: project)),
      ),
      body: isRow ? _row() : _Body(isRow: false, project: project),
    );
  }

  Widget _row() {
    return IntrinsicHeight(
      child: Row(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: coverMinHeight),
              child: _Cover(project: project),
            ),
          ),
          Expanded(child: _Body(project: project, isRow: true)),
        ],
      ),
    );
  }
}

class _Cover extends StatelessWidget {
  final ProjectModel project;
  const _Cover({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: project.color,
        borderRadius: BorderRadius.circular(12),
        image: project.cover.isNotEmpty
            ? DecorationImage(
                image: AssetImage(project.cover),
                fit: BoxFit.fill,
              )
            : null,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final bool isRow;
  final ProjectModel project;
  const _Body({required this.project, required this.isRow});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isRow)
          SizedBox(
            width: double.infinity,
            height: ProjectCard.coverMinHeight,
            child: _Cover(project: project),
          ),
        _Header(project: project),
        _Content(project: project),
        _Tags(project: project),
        _Links(project: project),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final ProjectModel project;
  const _Header({required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          size: 12,
          letterSpacing: 1.5,
          color: project.color,
          text: project.category,
          fontFamily: FontFamily.inter.value,
        ),
        CustomText(
          size: 12,
          text: project.index,
          opacity: FontOpacity.medium,
          fontFamily: FontFamily.inter.value,
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final ProjectModel project;
  const _Content({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(size: 24, text: project.name, type: FontType.header),
        CustomText(
          size: 14,
          height: 1.5,
          text: project.summary,
          type: FontType.overSmall,
          opacity: FontOpacity.medium,
          fontFamily: FontFamily.inter.value,
        ),
      ],
    );
  }
}

class _Tags extends StatelessWidget {
  final ProjectModel project;
  const _Tags({required this.project});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: project.tags
          .map(
            (tag) => CustomChip(
              label: tag,
              selected: true,
              borderRadius: 8,
              color: project.color,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
          )
          .toList(),
    );
  }
}

class _Links extends StatelessWidget {
  final ProjectModel project;
  const _Links({required this.project});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: project.links
          .map(
            (link) => CustomTextButton(
              itemSize: 14,
              icon: link.icon,
              title: link.label,
              onPressed: () => openUrl(context, link.url),
            ),
          )
          .toList(),
    );
  }
}
