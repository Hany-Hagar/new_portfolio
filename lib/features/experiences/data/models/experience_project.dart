import 'package:flutter/material.dart';
import '../../../../core/enums/device_type.dart';

class ExperienceProject {
  final String name;
  final String description;
  final int mobileSpan;
  final int tabletSpan;
  final int desktopSpan;

  const ExperienceProject({
    required this.name,
    required this.description,
    this.mobileSpan = 12,
    this.tabletSpan = 12,
    this.desktopSpan = 6,
  });

    int spanFor(BuildContext context) {
    if (context.isMobile) return mobileSpan;
    if (context.isTablet) return tabletSpan;
    return desktopSpan;
  }
}