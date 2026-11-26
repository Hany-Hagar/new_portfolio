import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../contact/pages/views/contact_view.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../../projects/pages/views/projects_view.dart';
import '../../../../skills/presentation/pages/views/skills_view.dart';
import '../../../../experiences/presentation/views/experience_view.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomeView(key: cubit.keys[0]),
        ExperienceView(key: cubit.keys[1]),
        ProjectsView(key: cubit.keys[2]),
        SkillsView(key: cubit.keys[3]),
        ContactView(key: cubit.keys[4]),
      ],
    );
  }
}
