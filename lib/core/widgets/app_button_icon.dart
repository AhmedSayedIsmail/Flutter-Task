import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? conentPadding;
  final BorderRadiusGeometry? borderRadius;
  final IconAlignment? iconAlignment;
  final double? buttonHeight;
  final double? buttonWidth;
  final TextStyle? textStyle;
  const AppButtonIcon({
    super.key,
    this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.conentPadding,
    this.borderRadius,
    this.iconAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(label, style: textStyle ?? TextStyles.font16WhiteBold),
      icon: icon,
      iconAlignment: iconAlignment ?? IconAlignment.start,
      style: TextButton.styleFrom(
        textStyle: textStyle ?? TextStyles.font16WhiteBold,
        fixedSize: Size(
          buttonWidth?.w ?? double.maxFinite,
          buttonHeight?.h ?? 44.h,
        ),
        padding: conentPadding,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? Colors.transparent),
          borderRadius: borderRadius ?? BorderRadius.circular(32),
        ),
      ),
    );
  }
}
