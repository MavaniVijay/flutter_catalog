import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:get/get.dart';

class Responsive extends StatelessWidget {
  final Widget tablet;
  final Widget desktop;
  final Widget mobile;

  const Responsive({Key key, this.tablet, this.desktop, this.mobile})
      : super(key: key);

  static bool isDesktop() => Get.width > kTabletSize;

  static bool isTablet() => Get.width > kMobileSize;

  static bool isMobile() => Get.width <= kMobileSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > kTabletSize)
          return desktop;
        else if (constraints.maxWidth > kMobileSize)
          return tablet;
        else
          return mobile;
      },
    );
  }
}
