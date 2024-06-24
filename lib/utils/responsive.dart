import 'package:flutter/material.dart';

enum DeviceScreenType {
  mobile,
  tablet,
  desktop,
}

class ResponsiveLayoutUtil {
  static DeviceScreenType getDeviceType(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    if (deviceWidth > 950) {
      return DeviceScreenType.desktop;
    } else if (deviceWidth > 600) {
      return DeviceScreenType.tablet;
    } else {
      return DeviceScreenType.mobile;
    }
  }

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceScreenType.mobile;

  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceScreenType.tablet;

  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceScreenType.desktop;
}
