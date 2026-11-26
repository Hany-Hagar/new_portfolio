import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_divider.dart';

class ContactItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isLast;
  final Function()? onTap;
  const ContactItem({
    super.key,
    required this.title,
    required this.value,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var isHovered = false;
    return StatefulBuilder(
      builder: (context, setState) => MouseRegion(
        onExit: (_) => setState(() => isHovered = false),
        onHover: (_) => setState(() => isHovered = true),
        child: Column(
          children: [
            CustomDivider(),
            _ItemBody(
              title: title,
              value: value,
              onTap: onTap,
              isHovered: isHovered,
            ),
            if (isLast) CustomDivider(),
          ],
        ),
      ),
    );
  }
}

class _ItemBody extends StatelessWidget {
  final String title;
  final String value;
  final bool isHovered;
  final Function()? onTap;
  const _ItemBody({
    this.onTap,
    required this.title,
    required this.value,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    Color? color = isHovered ? Theme.of(context).primaryColor : null;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: isHovered ? 14 : 0,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomText(
                size: 13,
                color: color,
                letterSpacing: 1,
                type: FontType.overSmall,
                text: title.toUpperCase(),
                opacity: FontOpacity.medium,
              ),
            ),
            CustomText(
              size: 14,
              text: value,
              color: color,
              type: FontType.overSmall,
            ),
          ],
        ),
      ),
    );
  }
}
