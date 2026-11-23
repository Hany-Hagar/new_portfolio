import '../../models/quick_fact.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/enums/font_type.dart';
import '../../../../core/widgets/custom_text.dart';

class QuickFacts extends StatelessWidget {
  const QuickFacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 36,
      runSpacing: 16,
      children: quickFacts.map((fact) => _QuickFactItem(fact: fact)).toList(),
    );
  }
}

class _QuickFactItem extends StatelessWidget {
  final QuickFact fact;
  const _QuickFactItem({required this.fact});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Count(number: fact.number),
        CustomText(
          size: 13,
          height: 1.6,
          text: fact.label,
          type: FontType.small,
          color: scheme.onSurfaceVariant,
          fontFamily: FontFamily.inter.value,
        ),
      ],
    );
  }
}

class _Count extends StatelessWidget {
  final int number;
  const _Count({required this.number});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Countup(
      begin: 0,
      curve: Curves.linear,
      end: number.toDouble(),
      duration: Duration(milliseconds: number * 260),
      style: Styles.textStyle800(context).copyWith(
        height: 1.1,
        fontSize: 34,
        color: scheme.primary,
        fontFamily: FontFamily.spaceGrotesk.value,
      ),
    );
  }
}
