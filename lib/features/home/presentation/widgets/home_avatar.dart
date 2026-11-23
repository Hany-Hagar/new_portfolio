import 'package:flutter/material.dart';
import '../../data/database/home_data.dart';
import '../../data/models/floating_note.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:new_portfolio/core/widgets/custom_chip.dart';

class HomeAvatar extends StatelessWidget {
  const HomeAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const _OuterRing(),
          const _DashedRing(),
          const _InnerDisc(),
          _AvatarImage(avatar: homeData.avatar),
          _Notes(notes: homeData.avatarNotes, jobTitle: homeData.jobTitle),
        ],
      ),
    );
  }
}

class _OuterRing extends StatelessWidget {
  const _OuterRing();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
    );
  }
}

class _DashedRing extends StatelessWidget {
  const _DashedRing();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary.withValues(alpha: 0.4);

    return Align(
      child: FractionallySizedBox(
        widthFactor: 0.76,
        heightFactor: 0.76,
        child:
            DottedBorder(
                  options: CircularDottedBorderOptions(
                    color: color,
                    strokeWidth: 1,
                    padding: EdgeInsets.zero,
                    dashPattern: const [4, 4],
                  ),
                  child: const SizedBox.shrink(),
                )
                .animate(onPlay: (c) => c.repeat())
                .rotate(duration: 60.seconds, curve: Curves.linear),
      ),
    );
  }
}

class _InnerDisc extends StatelessWidget {
  const _InnerDisc();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Align(
      child: FractionallySizedBox(
        widthFactor: 0.54,
        heightFactor: 0.54,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: scheme.outline),
            gradient: RadialGradient(
              radius: 0.82,
              center: const Alignment(0, -0.3), // 50% × 35%
              colors: [scheme.surface, theme.scaffoldBackgroundColor],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 70,
                color: scheme.secondary.withValues(alpha: 0.12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  final String avatar;

  const _AvatarImage({required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        widthFactor: 0.84,
        child: Image.asset(avatar, fit: BoxFit.contain),
      ),
    );
  }
}

class _Notes extends StatelessWidget {
  final String jobTitle;
  final List<FloatingNote> notes;

  const _Notes({required this.notes, required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 16,
          right: 0,
          child: _FloatingNote(
            title: notes[0].title,
            message: notes[0].message,
            floatDuration: const Duration(milliseconds: 2500),
          ),
        ),
        Positioned(
          bottom: 44,
          child: _FloatingNote(
            title: notes[1].title,
            message: notes[1].message,
            floatDuration: const Duration(milliseconds: 3000),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -12,
          child: CustomChip(
            label: jobTitle,
            leading: CircleAvatar(
              radius: 3.5,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _FloatingNote extends StatelessWidget {
  final String title;
  final String message;
  final Duration floatDuration;

  const _FloatingNote({
    required this.title,
    required this.message,
    required this.floatDuration,
  });

  @override
  Widget build(BuildContext context) {
    return CustomChip(title: title, label: message)
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .moveY(end: -10, duration: floatDuration, curve: Curves.easeInOut);
  }
}