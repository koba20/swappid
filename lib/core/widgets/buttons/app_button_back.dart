import 'package:flutter/material.dart';


class AppButtonBack extends StatelessWidget {
  final VoidCallback onPressed;
  const AppButtonBack({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back_ios , size: 15),
    );
  }
}