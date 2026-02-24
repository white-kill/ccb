import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 文本样式工具类
/// 提供项目中常用的文本样式
class TextStyleUnit {
  // 字体族名称
  static const String _fontFamily = 'PingFangSC';

  // 标题样式
  static TextStyle get titleLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      );

  static TextStyle get titleMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      );

  static TextStyle get titleSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      );

  // 正文样式
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      );

  static TextStyle get bodySmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      );

  // 标签样式
  static TextStyle get labelLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      );

  static TextStyle get labelMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      );

  static TextStyle get labelSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      );

  // 特殊样式
  static TextStyle get caption => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black45,
      );

  static TextStyle get overline => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black45,
        letterSpacing: 1.5,
      );

  // 按钮样式
  static TextStyle get button => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.25,
      );

  // 链接样式
  static TextStyle get link => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.blue,
        decoration: TextDecoration.underline,
      );

  // 强调样式
  static TextStyle get emphasis => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      );

  // 次要文本样式
  static TextStyle get secondary => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      );

  // 辅助文本样式
  static TextStyle get helper => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black45,
      );

  // 错误文本样式
  static TextStyle get error => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.red,
      );

  // 成功文本样式
  static TextStyle get success => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.green,
      );

  // 警告文本样式
  static TextStyle get warning => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.orange,
      );

  // 自定义样式方法
  static TextStyle custom({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    TextDecoration? decoration,
    double? height,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize?.sp,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      height: height,
    );
  }

  // 根据权重获取样式
  static TextStyle getWeight(FontWeight weight,
      {double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize?.sp ?? 14.sp,
      fontWeight: weight,
      color: color ?? Colors.black87,
    );
  }

  // 预设权重样式
  static TextStyle get ultralight => getWeight(FontWeight.w100);
  static TextStyle get thin => getWeight(FontWeight.w200);
  static TextStyle get light => getWeight(FontWeight.w300);
  static TextStyle get regular => getWeight(FontWeight.w400);
  static TextStyle get medium => getWeight(FontWeight.w500);
  static TextStyle get semibold => getWeight(FontWeight.w600);
}
