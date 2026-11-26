enum ProjectEnum {
  all,
  americanSoftDashboard,
  surrah,
  alReefWater,
  alReefWaterDashboard,
  stbtrFxEvents,
  twinsGomla,
}

extension ProjectEnumExtension on ProjectEnum {
  String get displayName {
    switch (this) {
      case ProjectEnum.all:
        return 'All';
      case ProjectEnum.americanSoftDashboard:
        return 'American Soft Dashboard';
      case ProjectEnum.surrah:
        return 'Surrah';
      case ProjectEnum.alReefWater:
        return 'Al Reef Water';
      case ProjectEnum.alReefWaterDashboard:
        return 'Al Reef Dashboard';
      case ProjectEnum.stbtrFxEvents:
        return 'StbtrFx Events';
      case ProjectEnum.twinsGomla:
        return 'Twins Gomla';
    }
  }
}