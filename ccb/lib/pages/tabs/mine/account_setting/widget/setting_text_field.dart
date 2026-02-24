import 'package:ccb/utils/text_style_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool showDivider;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final double? height;
  final TextStyle? textStyle;

  const SettingTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText = '请输入',
    this.showDivider = true,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.maxLines = 1,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyleUnit.bodyMedium.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      // color: Colors.white,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: 56.h,
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(label, style: TextStyleUnit.bodyLarge),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    textAlign: TextAlign.right,
                    minLines: 1,
                    maxLines: maxLines,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 8.h),
                      hintStyle: TextStyleUnit.bodyMedium.copyWith(color: Colors.grey),
                    ),
                    style: textStyle ?? defaultStyle,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    validator: validator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ],
            ),
          ),
          if (showDivider) const Divider(height: 1, indent: 0, endIndent: 0),
        ],
      ),
    );
  }
}
