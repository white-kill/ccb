import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../detail_more_time_logic.dart';


class NewPickerFoot extends StatefulWidget {
  const NewPickerFoot({super.key});

  @override
  State<NewPickerFoot> createState() => _NewPickerFootState();
}

class _NewPickerFootState extends State<NewPickerFoot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.w + ScreenUtil().bottomBarHeight,
      width: 1.sw,
      padding: EdgeInsets.only(top: 10.w),
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          SizedBox(
            width: 12.w,
          ),
          Expanded(
              child: Container(
                height: 40.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.w)),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.w,
                  ),
                ),
                child: BaseText(
                  text: '重置清空',
                  fontSize: 16.sp,
                ),
              ).withOnTap(onTap: (){
                final DetailMoreTimeLogic logic = Get.put(DetailMoreTimeLogic());
                Get.back();
                logic.restData();
              })),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
              child: Container(
                height: 40.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.w),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff4A6FCD),
                          Color(0xff81AEF4),
                        ])),
                child: BaseText(
                  text: '确定',
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ).withOnTap(onTap: (){
                final DetailMoreTimeLogic logic = Get.put(DetailMoreTimeLogic());
                Get.back();
                logic.sure();
              })),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
    );
  }
}
