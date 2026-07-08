import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData theme() {
    return Theme.of(this);
  }

  void pop() {
    Navigator.pop(this);
  }

  void unfocus() {
    FocusScope.of(this).unfocus();
  }

  Future pushNamed(String route) {
    return Navigator.pushNamed(this, route);
  }
}

extension AppThemeExtension on ThemeData {
  static ThemeData light() {
    return ThemeData(scaffoldBackgroundColor: Colors.white);
  }
}
