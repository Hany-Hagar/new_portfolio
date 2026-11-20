import 'custom_text.dart';
import '../enums/device_type.dart';
import '../models/action_model.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final int currentAction;
  final Function(int)? actionTap;
  final List<ActionModel>? actions;
  const CustomAppBar({
    super.key,
    this.actions,
    this.actionTap,
    required this.title,
    this.currentAction = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(child: _Title(title: title)),
          if (actions != null)
            _Actions(
              onTap: actionTap,
              actions: actions!,
              current: currentAction,
            ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      size: 28,
      text: title,
      letterSpacing: 0,
      type: FontType.overMedium,
      textSpans: [
        TextSpan(
          text: ".",
          style: TextStyle(
            height: 1,
            fontSize: 28,
            letterSpacing: 0,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  final int current;
  final Function(int)? onTap;
  final List<ActionModel> actions;
  const _Actions({
    required this.actions,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (!context.isDesktop) return Icon(Icons.menu);
    return Row(
      spacing: 10,
      children: actions
          .map(
            (e) => _ActionButton(
              action: e,
              onTap: onTap,
              isActive: e.id == current,
            ),
          )
          .toList(),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final bool isActive;
  final ActionModel action;
  final Function(int)? onTap;
  const _ActionButton({
    required this.action,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Color? color = isActive ? theme.colorScheme.primary : null;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: onTap?.call(action.id),
        child: CustomText(
          size: 15,
          color: color,
          text: action.name,
          type: isActive ? FontType.header : FontType.small,
          opacity: isActive ? FontOpacity.high : FontOpacity.medium,
        ),
      ),
    );
  }
}
