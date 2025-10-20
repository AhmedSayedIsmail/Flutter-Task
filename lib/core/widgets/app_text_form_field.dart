import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/themes/styles.dart';

class AppTextFormField extends StatelessWidget {
  final double? width;
  final double? height;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final int? minLines;
  final int? maxlenght;
  final TextStyle? labelStyle;
  final bool? enabled;
  final bool readOnly;
  final Function()? onTap;
  final String? helperText;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Function()? suffixTap;
  final Widget? prefixContent;
  const AppTextFormField({
    super.key,
    this.width,
    this.height,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.onChange,
    this.onFieldSubmitted,
    this.maxlenght,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.hintStyle,
    this.contentPadding,
    this.maxLines = 1,
    this.minLines,
    this.labelStyle,
    this.enabled,
    this.readOnly = false,
    this.prefixContent,
    this.onTap,
    this.textInputAction,
    this.helperText,
    this.validator,
    this.suffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: readOnly ? null : keyboardType,
      onTap: onTap,
      obscuringCharacter: "*",
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: textInputAction,
      obscureText: obscureText,
      style: TextStyles.font12BlackMedium,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxlenght,
      onChanged: onChange,
      cursorColor: Colors.black,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxWidth: width?.w ?? double.infinity,
          maxHeight: height?.h ?? double.infinity,
        ),
        helperText: helperText,
        alignLabelWithHint: true,
        labelText: labelText,
        errorStyle: TextStyles.font12RedBold,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 10.h),
        hintText: hintText,
        labelStyle: labelStyle ?? TextStyles.font12BlackBold,
        hintStyle: hintStyle ?? TextStyles.font12GreyBold,
        prefixIcon:
            prefixContent ?? Icon(prefixIcon, size: 25, color: Colors.black),
        suffixIcon: IconButton(
          onPressed: suffixTap,
          icon: Icon(suffixIcon, size: 20, color: Colors.black),
        ),
        hintMaxLines: 1,
      ),
    );
  }
}
