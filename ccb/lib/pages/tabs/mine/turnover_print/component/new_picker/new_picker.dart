import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'new_picker_date.dart';

class NewMxPicker {
  static showNewTime({
    DateTime? initialDateTime,
    ValueChanged<DateTime>? onDateTime,
  }) {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 280.w + ScreenUtil().bottomBarHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.w),
              topRight: Radius.circular(8.w),
            ),
          ),
          child: DateTimePicker(
            onDateTime: onDateTime,
            initialDateTime: initialDateTime,
          ),
        );
      },
    );
  }
}
