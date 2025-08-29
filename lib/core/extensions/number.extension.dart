// Extension for number
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumberExtension on num {


  BorderRadius get radius => BorderRadius.circular(toDouble());


  Widget get width => SizedBox(
        width: toDouble().w,
      );
  Widget get height => SizedBox(
        height: toDouble().h,
      );

  EdgeInsets get insets {
    return EdgeInsets.all(toDouble());
  }
}

extension InsetsExtention on List<num> {
  EdgeInsets get insets {
    return switch (length) {
      1 => EdgeInsets.all(this[0].toDouble()),
      2 => EdgeInsets.symmetric(
          horizontal: this[0].toDouble(), vertical: this[1].toDouble()),
      4 => EdgeInsets.fromLTRB(this[0].toDouble(), this[1].toDouble(),
          this[2].toDouble(), this[3].toDouble()),
      _ => EdgeInsets.all(this[0].toDouble()),
    };
  }
}
