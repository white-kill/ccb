import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'yueduzd_state.dart';

class YueduzdLogic extends GetxController {
  final YueduzdState state = YueduzdState();



   showTime(
      BuildContext context, {
        String title = '时间选择',
        PickerSelectedCallback? onSelect,
        PickerConfirmCallback? onConfirm,
      }) {
    BoxBorder border = Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 0.1,
      ),
    );
    var picker = Picker(
        backgroundColor: Colors.white,
        selecteds: [state.dataList.length-1],
        height: 200.w + ScreenUtil().bottomBarHeight,
        selectedTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
        selectionOverlay: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)),
              bottom:
              BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)), // 下边框
            ),
          ),
        ),
        itemExtent: 42.w,
        headerDecoration: BoxDecoration(border: border),
        adapter: PickerDataAdapter(
          pickerData:state.dataList,
        ),
        title: BaseText(text: title),
        cancelText: '取消',
        confirmText: '确认',

        cancelTextStyle: TextStyle(color: Colors.grey, fontSize: 14.w),
        confirmTextStyle: TextStyle(color: Colors.blue, fontSize: 14.w),
        onConfirm: onConfirm,
        onSelect: onSelect);
    picker.showModal(context, builder: (context, view) {
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.w),
                  topRight: Radius.circular(10.w))),
          child: view);
    });
  }
}
