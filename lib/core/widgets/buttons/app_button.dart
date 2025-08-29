import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swappid/core/helper/enums.dart';
import 'package:swappid/core/theme/colors.dart';
import 'package:swappid/core/theme/theme.dart';

class SButton extends StatelessWidget {
  const SButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.horizontalPadding,
    this.verticalPadding = 10,
    this.icon,
    this.loading = false,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.iconSize,
    this.iconColor,
    this.fontSize,
    this.iconPadding,
    this.width,
    this.height,
    this.radius,
    this.enabled = true,
    this.image,
    this.textStyle,
    this.textColor,
    this.disabledTextColor,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    this.disabledBorderColor,
    this.loadingColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.splashColor,
    this.highlightColor,
    this.focusColor,
    this.margin,
    this.hoverColor,
    this.gradient,
  });

  final double? horizontalPadding;
  final double? verticalPadding;

  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final double? iconPadding;
  final Widget? image;

  final EdgeInsets? margin;
  final String text;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? disabledTextColor;
  final double? fontSize;

  final double? width;
  final double? height;
  final double? radius;
  final bool enabled;
  final ButtonType type;
  final void Function()? onPressed;
  final bool loading;
  final double? elevation;

  final Color? backgroundColor;
  final Color? disabledBackgroundColor;

  final Color? borderColor;
  final double? borderWidth;
  final Color? disabledBorderColor;

  final Color? loadingColor;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  final Color? splashColor;
  final Color? highlightColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final double pillRadius = (height ?? 70) / 2;
    return Material(
      color: Colors.transparent,
      elevation: elevation ?? 0,
      shadowColor: KTheme.ofColorScheme().onSurface.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(radius ?? pillRadius),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 70,
        padding: EdgeInsets.symmetric(
          //horizontal: horizontalPadding ?? 10,
          vertical: verticalPadding ?? 10,
        ),
        margin: margin,
        decoration: gradient != null
            ? BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(radius ?? pillRadius),
              )
            : null,
        child: TextButton(
          onPressed: enabled && !loading ? onPressed : null,
          style: _buildButtonStyle(context, pillRadius),
          child: _buildButtonContent(context),
        ),
      ),
    );
  }

  ButtonStyle _buildButtonStyle(BuildContext context, double pillRadius) {
    final isOutline = type == ButtonType.outline;
    final Color effectiveBackgroundColor =
        backgroundColor != null && gradient == null
            ? _getBackgroundColor(isOutline)
            : (isOutline
                ? Colors.transparent
                : _getAdaptiveBackgroundColor(context));
    final Color effectiveDisabledBackgroundColor =
        disabledBackgroundColor != null && gradient == null
            ? _getDisabledBackgroundColor(isOutline)
            : (isOutline
                ? Colors.transparent
                : _getAdaptiveDisabledBackgroundColor(context));
    final Color effectiveBorderColor = _getBorderColor(isOutline);
    final Color effectiveDisabledBorderColor =
        _getDisabledBorderColor(isOutline);
    return TextButton.styleFrom(
      backgroundColor: gradient == null
          ? (enabled
              ? effectiveBackgroundColor
              : effectiveDisabledBackgroundColor)
          : Colors.transparent,
      foregroundColor: _getTextColor(isOutline, context),
      disabledForegroundColor: _getDisabledTextColor(isOutline, context),
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? pillRadius),
        side: BorderSide(
          color: enabled ? effectiveBorderColor : effectiveDisabledBorderColor,
          width: borderWidth ?? (isOutline ? 1.0 : 0.0),
        ),
      ),
      padding: EdgeInsets.zero,
    ).copyWith(
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.pressed)) {
          return splashColor ??
              (isOutline
                  ? Palette.primary.withValues(alpha: 0.1)
                  : Colors.white.withValues(alpha: 0.1));
        }
        if (states.contains(MaterialState.hovered)) {
          return hoverColor ??
              (isOutline
                  ? KTheme.getLight()
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.05)
                  : Colors.white.withValues(alpha: 0.05));
        }
        if (states.contains(MaterialState.focused)) {
          return focusColor ??
              (isOutline
                  ? KTheme.getLight().colorScheme.primary.withValues(alpha: 0.1)
                  : Colors.white.withValues(alpha: 0.1));
        }
        return null;
      }),
    );
  }

  Color _getBackgroundColor(bool isOutline) =>
      isOutline ? Colors.transparent : (backgroundColor ?? Palette.primary);

  Color _getDisabledBackgroundColor(bool isOutline) => isOutline
      ? Colors.transparent
      : (disabledBackgroundColor ?? Palette.primary.withOpacity(0.5));

  Color _getBorderColor(bool isOutline) =>
      isOutline ? (borderColor ?? Palette.primary) : Colors.transparent;

  Color _getDisabledBorderColor(bool isOutline) => isOutline
      ? (disabledBorderColor ?? Palette.primary.withOpacity(0.5))
      : Colors.transparent;

  Color _getTextColor(bool isOutline, BuildContext context) {
    if (textColor != null) return textColor!;
    if (isOutline) return Palette.primary;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.black : Colors.white;
  }

  Color _getDisabledTextColor(bool isOutline, BuildContext context) {
    if (disabledTextColor != null) return disabledTextColor!;
    if (isOutline) return Palette.primary.withOpacity(0.5);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? Colors.black.withOpacity(0.5)
        : Colors.white.withOpacity(0.5);
  }

  Color _getAdaptiveBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.white : Colors.black;
  }

  Color _getAdaptiveDisabledBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? Colors.white.withOpacity(0.5)
        : Colors.black.withOpacity(0.5);
  }

  Widget _buildButtonContent(BuildContext context) {
    if (loading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            loadingColor ?? _getTextColor(type == ButtonType.outline, context),
          ),
        ),
      );
    }

    if (text.isEmpty && icon == null && image == null) {
      return const SizedBox();
    }

    final List<Widget> children = [];

    if (image != null) {
      children.add(image!);
    } else if (icon != null) {
      children.add(
        Icon(
          icon,
          size: iconSize ?? 24,
          color:
              iconColor ?? _getTextColor(type == ButtonType.outline, context),
        ),
      );
    }

    if ((image != null || icon != null) && text.isNotEmpty) {
      children.add(SizedBox(width: iconPadding ?? 8));
    }

    if (text.isNotEmpty) {
      children.add(
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: _getTextColor(type == ButtonType.outline, context),
                    fontSize: fontSize ?? 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
        ),
      );
    }

    return children.length == 1
        ? children.first
        : Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
  }
}
