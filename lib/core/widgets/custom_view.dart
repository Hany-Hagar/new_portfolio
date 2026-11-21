import 'custom_text.dart';
import 'custom_divider.dart';
import 'package:flutter/material.dart';

class CustomView extends StatelessWidget {
  final Widget body;
  final String? title;
  final double padding;
  final double spacing;
  final Widget? bottom;
  final Widget? header;
  final String? subtitle;
  final bool showDivider;
  const CustomView({
    super.key,
    this.title,
    this.bottom,
    this.header,
    this.subtitle,
    this.padding = 70,
    this.spacing = 24,
    required this.body,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDivider) CustomDivider(),
        SizedBox(height: padding),
        if (title != null) _Title(title: title!),
        if (subtitle != null) _SubTitle(subtitle: subtitle!),
        if (header != null) _Header(header: header!),
        _Body(body: body, spacing: spacing),
        SizedBox(height: padding),
        ?bottom,
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(text: title, size: 32, type: FontType.header);
  }
}

class _SubTitle extends StatelessWidget {
  final String subtitle;
  const _SubTitle({required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      size: 16,
      text: subtitle,
      type: FontType.overSmall,
      opacity: FontOpacity.medium,
    );
  }
}

class _Header extends StatelessWidget {
  final Widget header;
  const _Header({required this.header});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 16.0), child: header);
  }
}

class _Body extends StatelessWidget {
  final Widget body;
  final double spacing;
  const _Body({required this.body, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: spacing),
      child: body,
    );
  }
}
