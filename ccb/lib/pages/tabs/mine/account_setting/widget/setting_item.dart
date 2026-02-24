import 'package:ccb/utils/text_style_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class SettingItem extends StatelessWidget {
  final String label;
  final String content;
  final bool isEditable;
  final VoidCallback? onTap;
  final bool showDivider;
  final Widget? contentWidget;
  final TextAlign? contentTextAlign;
  final TextStyle? labelTextStyle;
  final TextStyle? contentTextStyle;
  final Widget? rightIcon;

  const SettingItem({
    super.key,
    required this.label,
    this.content = '',
    this.isEditable = true,
    this.onTap,
    this.showDivider = true,
    this.contentWidget,
    this.contentTextAlign,
    this.labelTextStyle,
    this.contentTextStyle,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 56.h,
              child: Row(
                children: [
                  Text(
                    label, 
                    style: labelTextStyle ?? TextStyleUnit.bodyLarge.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16.sp,
                      letterSpacing: -0.5
                    )
                  ),
                  const Spacer(),
                  if (contentWidget != null)
                    contentWidget!
                  else
                    Text(
                      content.isEmpty ? '-' : content,
                      textAlign: contentTextAlign ?? TextAlign.right,
                      style: contentTextStyle ?? TextStyleUnit.bodyMedium.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: isEditable ? Colors.black : Colors.black,
                      ),
                    ),

                  if (rightIcon != null)
                    rightIcon!
                  else
                  if (isEditable)
                    Icon(Icons.arrow_forward_ios,
                        size: 16.w, color: Colors.black),
                ],
              ),
            ),
            if (showDivider) const Divider(height: 1, indent: 0, endIndent: 0),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.h, top: 12.h, bottom: 12.h),
      child: Text(
        title,
        style: TextStyleUnit.titleSmall.copyWith(fontWeight: FontWeight.w700, fontSize: 17.sp, letterSpacing: -1,),
      ),
    );
  }
}
