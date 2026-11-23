import 'experience_project.dart';

class ExperienceModel {
  final String title;
  final String period;
  final String description;
  final String organization;
  final List<String> highlights;
  final List<ExperienceProject> projects;
  final List<String> technologies;

  const ExperienceModel({
    required this.organization,
    required this.title,
    required this.period,
    required this.description,
    this.highlights = const [],
    this.projects = const [],
    this.technologies = const [],
  });
}