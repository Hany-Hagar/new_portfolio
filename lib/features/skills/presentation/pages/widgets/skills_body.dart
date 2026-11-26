import 'package:flutter/material.dart';

import '../../manager/skills_cubit.dart';
import '../../manager/skills_states.dart';
import '../../../data/models/skill_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/database/skills_data.dart';
import '../../../../../core/widgets/custom_chip.dart';
import '../../../../../core/widgets/custom_list.dart';
import '../../../../../core/widgets/custom_card.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../data/models/skill_category_model.dart';

class SkillsBody extends StatelessWidget {
  const SkillsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsCubit, SkillsStates>(
      builder: (context, state) {
        var categories = mySkills;
        return CustomList(
          items: categories,
          padding: EdgeInsets.only(top: 24),
          itemBuilder: (category) => _Category(category: category),
          columnSpans: categories.map((e) => e.spanFor(context)).toList(),
        );
      },
    );
  }
}

class _Category extends StatelessWidget {
  final SkillCategoryModel category;
  const _Category({required this.category});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      body: Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(size: 17, text: category.name, type: FontType.overMedium),
          CustomText(
            size: 14,
            type: FontType.overSmall,
            text: category.description,
            opacity: FontOpacity.medium,
          ),
          SizedBox(height: 6),
          _Skills(skills: category.skills),
        ],
      ),
    );
  }
}

class _Skills extends StatelessWidget {
  final List<SkillModel> skills;
  const _Skills({required this.skills});

  @override
  Widget build(BuildContext context) {
    var cubit = SkillsCubit.get(context);
    var selectedProject = cubit.selectedProject;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: skills.map((e) {
        return CustomChip(
          label: e.name,
          borderRadius: 8,
          selected: e.projects.contains(selectedProject),
        );
      }).toList(),
    );
  }
}
