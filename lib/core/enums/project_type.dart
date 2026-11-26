enum ProjectType {
  company,
  personal,
  freelance;

  /// من نص الـ API/JSON إلى enum
  static ProjectType fromString(String value) {
    return ProjectType.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => ProjectType.personal,
    );
  }

  /// النص اللي بيظهر في البادج
  String get label {
    switch (this) {
      case ProjectType.company:
        return 'Company';
      case ProjectType.personal:
        return 'Personal';
      case ProjectType.freelance:
        return 'Freelance';
    }
  }
}
