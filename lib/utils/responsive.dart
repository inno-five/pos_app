import 'package:flutter/material.dart';

enum DeviceScreenType {
  Mobile,
  Tablet,
  Desktop,
}

class ResponsiveLayoutUtil {
  static DeviceScreenType getDeviceType(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    if (deviceWidth > 950) {
      return DeviceScreenType.Desktop;
    } else if (deviceWidth > 600) {
      return DeviceScreenType.Tablet;
    } else {
      return DeviceScreenType.Mobile;
    }
  }

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceScreenType.Mobile;

  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceScreenType.Tablet;

  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceScreenType.Desktop;
}
