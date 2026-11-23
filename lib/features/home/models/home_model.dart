import 'quick_fact.dart';
import 'floating_note.dart';

class HomeModel {
  // _Tag
  final String tag;

  // _Title
  final String title;
  final String highlightedTitle;

  // _Description
  final String description;

  // _AnimatedSkills
  final List<String> skills;

  // QuickFacts
  final List<QuickFact> quickFacts;

  // HomeAvatar
  final String avatar;
  final String jobTitle;
  final List<FloatingNote> avatarNotes;

  // HomeTechBanner
  final List<String> techBanner;

  const HomeModel({
    required this.tag,
    required this.title,
    required this.highlightedTitle,
    required this.description,
    required this.skills,
    required this.quickFacts,
    required this.avatar,
    required this.jobTitle,
    required this.avatarNotes,
    required this.techBanner,
  });
}

