import '../models/home_model.dart';
import '../models/quick_fact.dart';
import '../models/floating_note.dart';

const homeData = HomeModel(
  tag: 'FLUTTER DEVELOPER · CAIRO, EGYPT',
  title: 'Cross-platform apps,\n',
  highlightedTitle: 'built to last.',
  description:
      "I'm Hany Magdy Hagar. I build reliable, user-focused mobile apps with ",
  skills: _skills,
  quickFacts: _quickFacts,
  avatar: 'assets/images/avatar.png',
  jobTitle: 'Flutter Developer',
  avatarNotes: _avatarNotes,
  techBanner: _techBanner,
);

const _skills = [
  'Flutter and Dart.',
  'BLoC / Cubit.',
  'Clean Architecture.',
  'REST APIs and Firebase.',
];

const _quickFacts = [
  QuickFact(number: 3, label: 'App flavors'),
  QuickFact(number: 11, label: 'Feature modules'),
  QuickFact(number: 4, label: 'Projects shipped'),
];

const _avatarNotes = [
  FloatingNote(
    title: 'FIREBASE CLOUD MESSAGING',
    message: 'New order received',
  ),
  FloatingNote(title: 'CURRENTLY', message: 'American Soft · 2026 – Present'),
];

const _techBanner = [
  'Flutter',
  'Dart',
  'BLoC / Cubit',
  'Clean Architecture',
  'Firebase',
  'Dio',
  'GetIt',
  'Hive',
];
