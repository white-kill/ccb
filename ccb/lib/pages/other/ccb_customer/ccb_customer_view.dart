import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'ccb_customer_logic.dart';
import 'ccb_customer_state.dart';

class CcbCustomerPage extends BaseStateless {
  CcbCustomerPage({Key? key}) : super(key: key,title: '建行客服');

  final CcbCustomerLogic logic = Get.put(CcbCustomerLogic());
  final CcbCustomerState state = Get.find<CcbCustomerLogic>().state;


  @override
  Widget initBody(BuildContext context) {
    return Obx(()=>Column(
      children: [

        Expanded(child: ListView(
          padding: EdgeInsets.zero,
          children: [
            logic.showView.value?const SizedBox.shrink():Container(
              width: 60.w,
              height: 20.w,
              color: const Color(0xffDDDDDD),
              alignment: Alignment.center,
              child: BaseText(text: '正在连接...',fontSize: 10.sp,color: Colors.white,),
            ).withContainer(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10.w)
            ),

            logic.showView.value?Container(
              width: 60.w,
              height: 20.w,
              color: const Color(0xffDDDDDD),
              alignment: Alignment.center,
              child: BaseText(
                text: DateUtil.formatDate(DateTime.now(), format: DateFormats.zh_h_m),
                fontSize: 10.sp,color: Colors.white,),
            ).withContainer(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20.w)
            ):const SizedBox.shrink(),

            logic.showView.value?Container(
              width: 350.w,
              height: 70.w,
              alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.all(10.w),
              child: const BaseText(text: '下午好!我是客服小微，请简要输入您的问题，我会耐心为您解答。',maxLines: 2,),
            ).withContainer(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 15.w)
            ):const SizedBox.shrink(),

            //
            logic.showView.value? Image(
              image: 'bg_custome'.png3x,
              fit: BoxFit.fitWidth,
              width: 1.sw,
            ).withPadding(
                top: 15.w
            ):const SizedBox.shrink(),
          ],
        )),

        logic.showView.value? Container(
          height: ScreenUtil().bottomBarHeight + 55.w,
          child: Column(
            children: [
              Image(
                image: 'bg_custome_bottom'.png3x,
                fit: BoxFit.fitWidth,
                width: 1.sw,
                height: 55.w,
              ),

              Container(
                width: 1.sw,
                height: ScreenUtil().bottomBarHeight,
                color: Colors.white,
              )
            ],
          ),
        ):const SizedBox.shrink(),
      ],
    ));
  }
}
