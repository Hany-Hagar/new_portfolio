import 'package:flutter/material.dart';
import '../../data/models/contact_model.dart';
import '../../../../core/utils/url_service.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_button.dart';

class ContactStart extends StatelessWidget {
  final ContactModel contact;
  const ContactStart({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _ContactIntro(),
        _ContactEmail(email: contact.email),
      ],
    );
  }
}

class _ContactIntro extends StatelessWidget {
  const _ContactIntro();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ContactLabel(),
        const _ContactHeadline(),
        const _ContactDescription(),
      ],
    );
  }
}

class _ContactLabel extends StatelessWidget {
  const _ContactLabel();

  @override
  Widget build(BuildContext context) {
    return CustomText(
      size: 18,
      text: "Connect",
      color: Theme.of(context).primaryColor,
    );
  }
}

class _ContactHeadline extends StatelessWidget {
  const _ContactHeadline();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return CustomText(
      size: 42,
      height: 1,
      text: "Let's build something ",
      textSpans: [
        TextSpan(
          text: "together.",
          style: TextStyle(
            fontSize: 42,
            decoration: TextDecoration.underline,
            decorationColor: primaryColor,
          ),
        ),
      ],
    );
  }
}

class _ContactDescription extends StatelessWidget {
  const _ContactDescription();

  @override
  Widget build(BuildContext context) {
    return CustomText(
      size: 14,
      type: FontType.overSmall,
      opacity: FontOpacity.medium,
      text: "Have a Flutter project or a role in mind? Reach out by email or phone.",
    );
  }
}

class _ContactEmail extends StatelessWidget {
  final String email;
  const _ContactEmail({required this.email});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: "Send an email",
      onPressed: () => UrlService.openEmail(context, email),
    );
  }
}
