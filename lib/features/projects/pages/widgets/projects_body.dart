import 'project_card.dart';
import 'package:flutter/material.dart';
import '../../data/models/project_model.dart';
import '../../data/database/projects_data.dart';
import '../../../../core/widgets/custom_list.dart';


class ProjectsBody extends StatelessWidget {
  const ProjectsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var data = projects;
    return CustomList<ProjectModel>(
      items: data,
      itemBuilder: (item) => ProjectCard(project: item),
      columnSpans: data.map((e) => e.spanFor(context)).toList(),
    );
  }
}
