import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class BaseBottomSheet {
  static Future sheetContentWidget({
    String title = '请选择',
    required Widget child,
    Widget? topWidget,
    bool showLine = true,
    Color? bgColor,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      context: Get.context!,
      builder: (context) {
        return CpdAlterWidget(
          title: title,
          topWidget: topWidget,
          child1: child,
          showLine: showLine,
          bgColor: bgColor,
        );
      },
    );
  }

  static Future sheetContentRightClearWidget({
    String title = '请选择',
    required Widget child,
    bool showLine = true,
    Widget? topWidget,
    Color? bgColor,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      context: Get.context!,
      builder: (context) {
        return CpdAlterWidget(
          title: title,
          topWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 24.w,
                height: 24.w,
              ),

              BaseText(
                text: title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.clear,
                size: 24.w,
                color: Color(0xff666666),
              ).withOnTap(onTap: () {
                Navigator.of(Get.context!).pop();
              }),


            ],
          ).withPadding(
            left: 10.w,
            right: 10.w,
            top: 14.w,
            bottom: 14.w,
          ),
          child1: child,
          bgColor: bgColor,
        );
      },
    );
  }
}




class CpdAlterWidget extends StatefulWidget {
  final String title;
  final Widget child1;
  final Widget? topWidget;
  final bool showLine;
  final Color? bgColor;

  const CpdAlterWidget({
    super.key,
    required this.title,
    required this.child1,
    this.topWidget,
    this.bgColor,
    this.showLine =true,
  });

  @override
  State<CpdAlterWidget> createState() => _CpdAlterWidgetState();
}

class _CpdAlterWidgetState extends State<CpdAlterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: _decoration(widget.bgColor),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            widget.topWidget?? _topWidget(),
            widget.showLine?Container(
              width: 1.sw,
              height: 0.5.w,
              color: Color.fromARGB(255, 235, 235, 235),
            ):Container(),
            widget.child1,
          ],
        ),
      ).withContainer(
        width: 1.sw,
        height: 1.sh,
        color: Colors.transparent,
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  Decoration _decoration(Color? bgColor) {
    return BoxDecoration(
      color: bgColor??Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.w),
        topRight: Radius.circular(8.w),
      ),
    );
  }

  Widget _topWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Icon(
          Icons.clear,
          size: 24.w,
          color: Color(0xff666666),
        ).withOnTap(onTap: () {
          Navigator.of(context).pop();
        }),
        BaseText(
          text: widget.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(
          width: 24.w,
          height: 24.w,
        ),

      ],
    ).withPadding(
      left: 10.w,
      right: 10.w,
      top: 14.w,
      bottom: 14.w,
    );
  }

}
