import 'skills_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/project_enum.dart';

class SkillsCubit extends Cubit<SkillsStates> {
  SkillsCubit() : super(SetSelectedProject());
  static SkillsCubit get(BuildContext context) => BlocProvider.of(context);

  ProjectEnum selectedProject = ProjectEnum.all;

  void setSelectedProject(ProjectEnum project) {
    selectedProject = project;
    emit(SetSelectedProject());
  }
}
