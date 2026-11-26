import '../widgets/skills_body.dart';

import 'package:flutter/material.dart';

import '../../manager/skills_cubit.dart';
import '../../manager/skills_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/project_enum.dart';
import '../../../../../core/widgets/custom_view.dart';
import '../../../../../core/widgets/custom_chip.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(
      spacing: 8,
      title: "Skills",
      header: const _Projects(),
      body: SkillsBody(),
    );
  }
}

class _Projects extends StatelessWidget {
  const _Projects();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsCubit, SkillsStates>(
      builder: (context, state) {
        var cubit = SkillsCubit.get(context);
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ProjectEnum.values
              .map(
                (e) => GestureDetector(
                  onTap: () => cubit.setSelectedProject(e),
                  child: CustomChip(
                    label: e.name,
                    selected: cubit.selectedProject == e,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
