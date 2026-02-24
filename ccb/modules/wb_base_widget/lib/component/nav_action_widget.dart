import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class NavActionWidget extends StatefulWidget {
  final String? image;
  final String? title;
  final Color? color;
  final double? left;
  final double? right;
  final bool showTitle;
  final String? routesName;

  const NavActionWidget({
    super.key,
    this.image,
    this.title,
    this.color,
    this.left,
    this.right,
    this.routesName,
    this.showTitle = true,
  });

  @override
  State<NavActionWidget> createState() => _NavActionWidgetState();
}

class _NavActionWidgetState extends State<NavActionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //widget.onpress!();
        },
        child: Padding(
          padding: EdgeInsets.only(
              left: (widget.left ?? 0), right: widget.right ?? 16.w),
          child: Container(
            height: 34.w,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: widget.image!.png3x,
                  width: 18.w,
                  height: 18.w,
                  color: widget.color ?? Colors.black,
                ),
                widget.showTitle? BaseText(
                  text: widget.title ?? '',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: widget.color ?? Colors.black,
                    // fontWeight: FontWeight.w600,
                  ),
                ):const SizedBox.shrink(),
              ],
            ).withOnTap(onTap: () {
              if (widget.routesName != null) {
                Get.toNamed(widget.routesName!);
                return;
              }
              if (widget.title == '客服') {
                Get.toNamed('/ccbCustomerPage');
              }
            }),
          ),
        ));
  }
}
