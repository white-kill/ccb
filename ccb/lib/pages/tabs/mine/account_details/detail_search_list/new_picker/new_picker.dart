import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'new_picker_date.dart';
import 'new_picker_foot.dart';
import 'new_picker_header.dart';

class NewSearchPicker {

  static showNewTime({
    NewSearchPickerHeaderNotifier? newHeadNotifier,
  }) {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 200.w + 80.w + 85.w + ScreenUtil().bottomBarHeight + 60.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.w),
              topRight: Radius.circular(8.w),
            ),
          ),
          child: Column(
            children: [
              NewPickerHeader(
                headerNotifier: newHeadNotifier,
              ),
              // 时间选择器
              Expanded(
                child: SearchDateTimePicker(
                  headerNotifier: newHeadNotifier,
                  minDateTime: DateTime(2010,DateTime.now().month,DateTime.now().day,),
                  onDateTimeChanged: (DateTime newDate) {
                    newHeadNotifier?.upDataTime(newDate);
                  },
                ),
              ),

              const NewPickerFoot(),
            ],
          ),
        );
      },
    );
  }
}