import '../widgets/contact_body.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_view.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(
      body: const ContactBody(),
    );
  }
}