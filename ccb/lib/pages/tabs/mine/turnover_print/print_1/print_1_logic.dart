
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'print_1_state.dart';

class Print_1Logic extends GetxController {
  final Print_1State state = Print_1State();
  var agree = false.obs;
  String item5title1 = "电子邮件";

  @override
  void onInit() {
    super.onInit();

    state.printData = Get.arguments['info'];


  }

  Widget replaceAsterisksWithImages(String text,
      {double fontSize = 14, Color? color,double? size,double? bottom}) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style:
        TextStyle(fontSize: fontSize.sp, color: color ?? Color(0xff999999)),
      ));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(
              image: 'ic_ccb_xin'.png3x,
              width:size?? 6.w,
              height:size?? 6.w,
              color: color ?? Color(0xff999999))
              .withPadding(bottom:bottom?? 2.w),
          alignment: PlaceholderAlignment.middle,
        ));
      }
    }

    return Text.rich(
      maxLines: 10,
      textAlign: TextAlign.right,
      TextSpan(children: spans),
    );
  }
}
