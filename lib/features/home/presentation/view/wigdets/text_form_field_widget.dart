import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tansik/core/utils/app_colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextInputType keyboardType;
  final String? hintText;
  final bool obscureText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const TextFormFieldWidget({
    required this.controller,
    required this.validator,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isPassword = false,
    super.key,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return TextFormField(
      textDirection: TextDirection.rtl,
      cursorColor: primaryColor,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.textPrimaryDark : primaryColor,
        overflow: TextOverflow.ellipsis,
      ),
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        hintText: widget.hintText ?? 'أدخل المجموع (مثال: 385 أو 93.9%)',
        hintStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
          overflow: TextOverflow.ellipsis,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  size: 22.sp,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        enabledBorder: outlineInputBorder(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          radius: 14.r,
          width: 1,
        ),
        focusedBorder: outlineInputBorder(
          color: primaryColor,
          radius: 14.r,
          width: 1.5,
        ),
        errorBorder: outlineInputBorder(
          color: Colors.red.shade400,
          radius: 14.r,
          width: 1,
        ),
        focusedErrorBorder: outlineInputBorder(
          color: Colors.red.shade400,
          radius: 14.r,
          width: 1.5,
        ),
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
    );
  }

  OutlineInputBorder outlineInputBorder({
    required double radius,
    required Color color,
    required double width,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}