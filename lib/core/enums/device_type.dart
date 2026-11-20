import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

extension DeviceTypeX on BuildContext {
  // Return device type from context
  DeviceType get deviceType {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) return DeviceType.mobile;
    if (width < 1024) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  // Return device type from context
  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
}
