import 'package:flutter/material.dart';
import '../widgets/experience_body.dart';
import '../../../../core/widgets/custom_view.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: "Experience",
      body: const ExperienceBody(),
    );
  }
}
