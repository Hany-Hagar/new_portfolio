import 'package:flutter/material.dart';
import '../widgets/projects_body.dart';
import '../../../../core/widgets/custom_view.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'Projects',
      body: const ProjectsBody(),
    );
  }
}