import '../models/skill_model.dart';
import '../models/skill_category_model.dart';
import '../../../../core/enums/project_enum.dart';

const _dash = ProjectEnum.americanSoftDashboard;
const _surrah = ProjectEnum.surrah;
const _reef = ProjectEnum.alReefWater;
const _reefDash = ProjectEnum.alReefWaterDashboard;
const _stbtr = ProjectEnum.stbtrFxEvents;
const _twins = ProjectEnum.twinsGomla;

const List<SkillCategoryModel> mySkills = [
  // Row 1
  SkillCategoryModel(
    mobileSpan: 12,
    tabletSpan: 6,
    desktopSpan: 6,
    name: 'Interfaces people enjoy',
    description: 'Responsive, bilingual screens that feel native.',
    skills: [
      SkillModel(name: 'Flutter', projects: [_dash, _surrah, _reef, _reefDash, _stbtr, _twins]),
      SkillModel(name: 'Material 3', projects: [_dash, _surrah, _reef, _reefDash]),
      SkillModel(name: 'Localization', projects: [_dash, _surrah, _reef, _reefDash, _stbtr]),
      SkillModel(name: 'Arabic RTL', projects: [_dash, _surrah, _reef, _reefDash, _stbtr, _twins]),
      SkillModel(name: 'Light and Dark Themes', projects: [_dash, _surrah, _reef, _reefDash]),
      SkillModel(name: 'ScreenUtil', projects: [_dash, _surrah, _reef, _reefDash, _stbtr]),
      SkillModel(name: 'Lottie and Skeletons', projects: [_dash, _surrah, _reef, _reefDash, _stbtr]),
      SkillModel(name: 'Banners and Carousels', projects: [_reef]),
      SkillModel(name: 'Admin Dashboards', projects: [_dash, _reefDash]),
      SkillModel(name: 'Responsive UI'),
    ],
  ),

  SkillCategoryModel(
    mobileSpan: 12,
    tabletSpan: 6,
    desktopSpan: 6,
    name: 'Code that stays clean',
    description: 'Layers that are easy to test, read and grow.',
    skills: [
      SkillModel(name: 'Clean Architecture'),
      SkillModel(name: 'Feature-first Structure', projects: [_dash, _surrah, _reef, _reefDash, _stbtr]),
      SkillModel(name: 'Cubit', projects: [_dash, _surrah, _reef, _reefDash, _stbtr]),
      SkillModel(name: 'BLoC'),
      SkillModel(name: 'Repository Pattern', projects: [_dash, _surrah, _reef, _reefDash, _stbtr]),
      SkillModel(name: 'MVVM'),
      SkillModel(name: 'GetIt', projects: [_dash, _surrah, _reef, _reefDash, _stbtr]),
      SkillModel(name: 'Dartz (Either)', projects: [_dash, _surrah, _reef, _reefDash, _stbtr]),
      SkillModel(name: 'GoRouter', projects: [_stbtr]),
      SkillModel(name: 'Optimistic Updates', projects: [_stbtr]),
    ],
  ),

  // Row 2 (tablet: 6 + 6, then 12)
  SkillCategoryModel(
    mobileSpan: 12,
    tabletSpan: 6,
    desktopSpan: 4,
    name: 'Connected to real backends',
    description: 'Secure, fast and predictable API work.',
    skills: [
      SkillModel(name: 'REST APIs', projects: [_dash, _stbtr]),
      SkillModel(name: 'Dio', projects: [_dash, _stbtr]),
      SkillModel(name: 'JSON'),
      SkillModel(name: 'Token Handling', projects: [_dash, _stbtr]),
      SkillModel(name: 'Role-based Access', projects: [_dash]),
      SkillModel(name: 'Pagination', projects: [_dash, _stbtr]),
      SkillModel(name: 'Multipart Uploads', projects: [_dash]),
    ],
  ),

  SkillCategoryModel(
    mobileSpan: 12,
    tabletSpan: 6,
    desktopSpan: 4,
    name: 'Data online and offline',
    description: 'Apps that keep working without a signal.',
    skills: [
      SkillModel(name: 'Hive', projects: [_surrah]),
      SkillModel(name: 'Hydrated BLoC', projects: [_dash, _surrah, _reef, _reefDash]),
      SkillModel(name: 'Secure Storage', projects: [_dash]),
      SkillModel(name: 'Firebase Auth', projects: [_reef, _reefDash]),
      SkillModel(name: 'Google Sign-In', projects: [_reef, _reefDash]),
      SkillModel(name: 'Firestore', projects: [_reef, _reefDash, _twins]),
      SkillModel(name: 'Storage', projects: [_twins]),
      SkillModel(name: 'MySQL'),
      SkillModel(name: 'Excel Import', projects: [_twins]),
      SkillModel(name: 'Shared Preferences', projects: [_stbtr]),
    ],
  ),

  SkillCategoryModel(
    mobileSpan: 12,
    tabletSpan: 12,
    desktopSpan: 4,
    name: 'Features users notice',
    description: 'The details that make an app feel complete.',
    skills: [
      SkillModel(name: 'PDF Reports', projects: [_dash]),
      SkillModel(name: 'ML Kit', projects: [_dash]),
      SkillModel(name: 'Biometric Auth', projects: [_dash, _surrah]),
      SkillModel(name: 'Camera and Gallery', projects: [_dash]),
      SkillModel(name: 'Speech and TTS', projects: [_dash]),
      SkillModel(name: 'Home Widget', projects: [_surrah]),
      SkillModel(name: 'Screenshot Protection', projects: [_dash, _surrah]),
      SkillModel(name: 'Image Viewer', projects: [_reefDash]),
      SkillModel(name: 'FCM'),
      SkillModel(name: 'Shorebird OTA', projects: [_dash]),
      SkillModel(name: 'Deep Links', projects: [_stbtr]),
      SkillModel(name: 'Native Sharing', projects: [_stbtr]),
    ],
  ),

  // Row 3
  SkillCategoryModel(
    mobileSpan: 12,
    tabletSpan: 6,
    desktopSpan: 6,
    name: 'Maps and live data',
    description: 'Location, maps and realtime updates.',
    skills: [
      SkillModel(name: 'OpenStreetMap', projects: [_dash, _reef]),
      SkillModel(name: 'Geolocation', projects: [_dash, _reef]),
      SkillModel(name: 'Background Location', projects: [_dash]),
      SkillModel(name: 'Realtime Sockets', projects: [_dash]),
      SkillModel(name: 'Charts', projects: [_dash]),
    ],
  ),

  SkillCategoryModel(
    mobileSpan: 12,
    tabletSpan: 6,
    desktopSpan: 6,
    name: 'Daily toolkit',
    description: 'Languages and tools I reach for every day.',
    skills: [
      SkillModel(name: 'Dart', projects: [_dash, _surrah, _reef, _reefDash, _stbtr, _twins]),
      SkillModel(name: 'PHP'),
      SkillModel(name: 'SQL'),
      SkillModel(name: 'Git'),
      SkillModel(name: 'GitHub', projects: [_surrah]),
      SkillModel(name: 'Android Flavors', projects: [_dash]),
      SkillModel(name: 'Android Studio'),
      SkillModel(name: 'VS Code'),
      SkillModel(name: 'Website Deployment', projects: [_stbtr]),
    ],
  ),
];