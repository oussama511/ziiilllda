import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget smallMobile;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.smallMobile,
  }) : super(key: key);

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1200 then we consider it a desktop
    if (_size.width >= 1200) {
      return desktop;
    }
    // If width is less than 1200 and more than 768 we consider it as tablet
    else if (_size.width >= 768) {
      return tablet;
    }
    // If width is less than 768 and more than 376 we consider it as mobile
    else if (_size.width >= 376) {
      return mobile;
    } else {
      return smallMobile;
    }
  }
}
