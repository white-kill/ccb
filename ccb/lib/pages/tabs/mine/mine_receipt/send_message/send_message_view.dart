import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../utils/scale_point_widget.dart';
import 'send_message_logic.dart';
import 'send_message_state.dart';

class SendMessagePage extends BaseStateless {
  SendMessagePage({Key? key}) : super(key: key, title: '短信通知');

  final SendMessageLogic logic = Get.put(SendMessageLogic());
  final SendMessageState state = Get.find<SendMessageLogic>().state;

  //hd_dx@3x

  @override
  List<Widget>? get rightAction => [
        const ScalePointWidget(
          icColor: Colors.white,
        ).withPadding(right: 6.w),
        const Icon(
          Icons.clear,
          color: Colors.white,
        ).withOnTap(onTap: () {
          Get.back();
        }).withPadding(
          right: 16.w,
        )
      ];

  @override
  Color? get backColor => Colors.white;

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Widget initBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 'hd_dx'.png3x,
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 55.w,
            width: 1.sw * 0.7,
            margin: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight + 5.w),
          ).withOnTap(onTap: (){
            logic.sendSms();
          })
        ],
      ),
    );
  }
}
