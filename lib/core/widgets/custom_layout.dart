import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget body;
  final Color? color;
  final Widget appBar;
  final ScrollController controller;

  const CustomLayout({
    super.key,
    this.color,
    required this.body,
    required this.appBar,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: color ?? theme.scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Scrollbar(
            controller: controller,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: controller,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 32, 0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [appBar, body],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
