import 'package:flutter/material.dart';
import 'package:swappid/app.dart';

class KNavigator {
  static BuildContext context = SwappidApp.navKey.currentState!.context;
  static Future<Object?> pushNamed(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }

  static Future<Object?> pushNamedAndRemoveUntil(
      BuildContext context, String route) {
    return Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

  static Future<Object?> pushReplacement(BuildContext context, String route) {
    return Navigator.pushReplacementNamed(context, route);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
