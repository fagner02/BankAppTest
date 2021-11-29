import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xFF700092);
  static Color backColor = Colors.white;
  static Color titleColor = Colors.white;
  static Color cardTitleColor = Colors.grey;
  static Color cardTextColor = Colors.black;
  static BoxDecoration titleBarDecoration = BoxDecoration(
      color: primaryColor,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ));
}
