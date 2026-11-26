import 'project_link.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/enums/device_type.dart';
import '../../../../core/enums/project_type.dart';

class ProjectModel {
  final Color color;
  final String name;
  final String index;
  final String cover;
  final int tabletSpan;
  final int mobileSpan;
  final String summary;
  final int desktopSpan;
  final String category;
  final List<Type> links;
  final List<String> tags;
  final List<String> images;
  final ProjectType projectType;

  const ProjectModel({
    required this.name,
    required this.tags,
    required this.index,
    required this.color,
    required this.cover,
    this.tabletSpan = 6,
    this.mobileSpan = 12,
    this.desktopSpan = 6,
    required this.images,
    required this.summary,
    this.links = const [],
    required this.category,
    required this.projectType,
  });

  int spanFor(BuildContext context) {
    if (context.isMobile) return mobileSpan;
    if (context.isTablet) return tabletSpan;
    return desktopSpan;
  }
}