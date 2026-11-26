import 'package:flutter/material.dart';
import '../../data/models/project_model.dart';
import '../../../../core/enums/font_type.dart';
import '../../../../core/widgets/custom_text.dart';

class ProjectBody extends StatelessWidget {
  final ProjectModel project;

  const ProjectBody({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: project.name),
        CustomText(text: project.summary, fontFamily: FontFamily.inter.value),
      ],
    );
  }
}
