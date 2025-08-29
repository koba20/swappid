import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swappid/core/theme/colors.dart';

class StyledText extends StatelessWidget {
  const StyledText(
      {super.key,
      required this.text,
      this.style,
      this.textAlign,
      this.onTag,
      this.fontWeight});
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  final void Function(String tag)? onTag;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        style: style ??
            Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 23.sp,
                ),
        children: [
          ...text.split(" ").map((e) {
            e = '$e ';

            if (e.contains("<a>")) {
              return TextSpan(
                  text: e.replaceAll("<a>", ""),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => onTag?.call("a"),
                  style: TextStyle(
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                    color: Palette.primary,
                    fontWeight: FontWeight.w300,
                  ));
            }

            if (e.contains("<u>")) {
              return TextSpan(
                  text: e.replaceAll("<u>", ""),
                  style: TextStyle(
                      color: Palette.primary,
                      fontWeight: fontWeight ?? FontWeight.w700));
            }

            if (e.contains("<c>")) {
              return TextSpan(
                  text: e.replaceAll("<c>", ""),
                  style: TextStyle(
                      color: Palette.primary,
                      fontWeight: fontWeight ?? FontWeight.w700));
            }

            return TextSpan(text: e);
          })
        ],
      ),
    );
  }
}
