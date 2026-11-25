import 'package:flutter/material.dart';

enum TimelineDotPosition { start, center, end }

enum TimelineLinePosition { start, center, end }

class CustomTimeline extends StatelessWidget {
  final int current;
  final double lineWidth;
  final Color activeColor;
  final Color inactiveColor;
  final List<Widget> children;
  final TimelineDotPosition dotPosition;
  final TimelineLinePosition linePosition;
  const CustomTimeline({
    super.key,
    this.lineWidth = 25.0,
    required this.current,
    required this.children,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.dotPosition = TimelineDotPosition.start,
    this.linePosition = TimelineLinePosition.start,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: children.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _Item(
        lineWidth: lineWidth,
        active: index <= current,
        dotPosition: dotPosition,
        activeColor: activeColor,
        onFirstSide: index.isEven,
        linePosition: linePosition,
        inactiveColor: inactiveColor,
        isLast: index == children.length - 1,
        child: children[index],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool isLast;
  final bool active;
  final Widget child;
  final bool onFirstSide;
  final double lineWidth;
  final Color activeColor;
  final Color inactiveColor;
  final TimelineDotPosition dotPosition;
  final TimelineLinePosition linePosition;
  const _Item({
    required this.child,
    required this.active,
    required this.isLast,
    required this.lineWidth,
    required this.activeColor,
    required this.onFirstSide,
    required this.dotPosition,
    required this.linePosition,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = switch (linePosition) {
      TimelineLinePosition.start => AlignmentDirectional.centerStart,
      TimelineLinePosition.center => AlignmentDirectional.center,
      TimelineLinePosition.end => AlignmentDirectional.centerEnd,
    };
    bool isCenter = linePosition == TimelineLinePosition.center;
    return Stack(
      fit: StackFit.passthrough,
      children: [
        if (isCenter) _center(),
        if (!isCenter) _notCenter(),
        Positioned.fill(
          child: Align(
            alignment: alignment,
            child: SizedBox(
              width: lineWidth,
              child: _Line(
                active: active,
                dotPosition: dotPosition,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _center() {
    const empty = SizedBox.shrink();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: onFirstSide ? child : empty),
        SizedBox(width: lineWidth + 16),
        Expanded(child: onFirstSide ? empty : child),
      ],
    );
  }

  Padding _notCenter() {
    bool isStart = linePosition == TimelineLinePosition.start;
    bool isEnd = linePosition == TimelineLinePosition.end;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: isLast ? 0 : 16,
        end: isEnd ? lineWidth + 16 : 0,
        start: isStart ? lineWidth + 16 : 0,
      ),
      child: child,
    );
  }
}

class _Line extends StatelessWidget {
  final bool active;
  final Color activeColor;
  final Color inactiveColor;
  final TimelineDotPosition dotPosition;
  const _Line({
    required this.active,
    required this.dotPosition,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = active ? activeColor : inactiveColor;
    Widget segment() => Expanded(
      child: Center(child: Container(width: 3, color: color)),
    );
    return Column(
      children: [
        if (dotPosition != TimelineDotPosition.start) segment(),
        _Dot(active: active, activeColor: activeColor),
        if (dotPosition != TimelineDotPosition.end) segment(),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final bool active;
  final Color activeColor;
  const _Dot({required this.active, required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RadioGroup<bool>(
        onChanged: (_) {},
        groupValue: active ? true : null,
        child: Radio<bool>(value: true, activeColor: activeColor),
      ),
    );
  }
}
