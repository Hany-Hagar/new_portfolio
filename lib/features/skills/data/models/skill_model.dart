// skill_model.dart
import '../../../../core/enums/project_enum.dart';

class SkillModel {
  final String name;
  final bool isSelect;
  final List<ProjectEnum> projects;

  const SkillModel({
    required this.name,
    this.isSelect = false,
    this.projects = const [],
  });

  SkillModel copyWith({
    String? name,
    bool? isSelect,
    List<ProjectEnum>? projects,
  }) {
    return SkillModel(
      name: name ?? this.name,
      projects: projects ?? this.projects,
      isSelect: isSelect ?? this.isSelect,
    );
  }
}
