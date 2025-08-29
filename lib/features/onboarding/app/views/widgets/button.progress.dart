import 'package:flutter/material.dart';

class ButtonProgress extends StatelessWidget {
  const ButtonProgress({super.key, required this.progress, required this.total, required this.onProgress});

  final int progress;
  final int total;

  final void Function(int progress) onProgress;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
