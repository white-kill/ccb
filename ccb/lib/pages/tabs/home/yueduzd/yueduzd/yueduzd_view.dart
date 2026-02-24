import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/flutter_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../../../routes/app_pages.dart';
import 'yueduzd_logic.dart';
import 'yueduzd_state.dart';

class YueduzdPage extends BaseStateless{
  YueduzdPage({Key? key}) : super(key: key);

  final YueduzdLogic logic = Get.put(YueduzdLogic());
  final YueduzdState state = Get.find<YueduzdLogic>().state;
  // @override
  // bool get isChangeNav => true;


  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get backColor => Colors.white;
  @override
  Widget? get titleWidget => Text('月度账单',style: TextStyle(color: Colors.white,fontSize: 18.sp),);
  @override
  Widget initBody(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              child: Stack(
                children: [
                  Image(image: ('bg_ydzd').png3x),
                  Positioned(
                      top:335.w,
                      left: (1.sw - 120.w)/2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(15.w)
                        ),
                        width: 120.w,
                        height: 30.w,
                          child: Obx(()=>Center(child: Text(state.currentTime.value,style: TextStyle(color: Colors.blue,fontSize: 14.sp),textAlign: TextAlign.center,),)),
                  ).withOnTap(onTap: ()=>{
                    logic.showTime(
                        context,
                        onConfirm: (Picker picker, List<int> selected) {
                          state.currentTime.value = picker.getSelectedValues().first;
                        }
                    )
                      })),
                  Positioned(
                     top:335.w + 34.w + 30.w,
                      left: (1.sw - 245.w)/2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(26.w)
                        ),
                        width: 245.w,
                        height: 52.w,
                        child: Center(child:
                        Text('开启账单',style:
                        TextStyle(color: Colors.white,fontSize: 17.sp),
                          textAlign: TextAlign.center,),),
                      ).withOnTap(onTap: () {
                        String timeStr =  state.currentTime.value;
                        Get.toNamed(Routes.Jh_ydzdPage,arguments: {
                          'dateTime':timeStr.replaceAll('年', '-').replaceAll('月', '')
                        });
                      })),
                ],
              ),
            )
          ],
        ));
  }

}
