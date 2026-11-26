import 'skill_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/enums/device_type.dart';


class SkillCategoryModel {
  final String name;
  final int mobileSpan;
  final int tabletSpan;
  final int desktopSpan;
  final String description;
  final List<SkillModel> skills;

  const SkillCategoryModel({
    required this.name,
    required this.skills,
    required this.mobileSpan,
    required this.tabletSpan,
    required this.desktopSpan,
    required this.description,
  });

  /// Returns the span for the given screen width.
  int spanFor(BuildContext context) {
    if (context.isMobile) return mobileSpan;
    if (context.isTablet) return tabletSpan;
    return desktopSpan;
  }

  SkillCategoryModel copyWith({
    int? mobileSpan,
    int? tabletSpan,
    int? desktopSpan,
    String? name,
    String? description,
    List<SkillModel>? skills,
  }) {
    return SkillCategoryModel(
      name: name ?? this.name,
      skills: skills ?? this.skills,
      mobileSpan: mobileSpan ?? this.mobileSpan,
      tabletSpan: tabletSpan ?? this.tabletSpan,
      desktopSpan: desktopSpan ?? this.desktopSpan,
      description: description ?? this.description,
    );
  }
}
