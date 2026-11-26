import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/project_body.dart';

import 'package:flutter/material.dart';

import '../../data/models/project_model.dart';
import '../../../../core/widgets/custom_layout.dart';

class ProjectView extends StatelessWidget {
  final ProjectModel project;
  const ProjectView({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      body: ProjectBody(project: project,),
      appBar: CustomAppBar(title: "Hany Magdy"),
      controller: ScrollController(),
    );
  }
}
