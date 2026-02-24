import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'zzjd_logic.dart';
import 'zzjd_state.dart';

class ZzjdPage extends BaseStateless {
  ZzjdPage({Key? key}) : super(key: key,title: '转账进度查询');

  final ZzjdLogic logic = Get.put(ZzjdLogic());
  final ZzjdState state = Get.find<ZzjdLogic>().state;


  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(
              image: 'zzjd'.png3x,
              fit: BoxFit.fitWidth,
              width: 1.sw,
            ),
            
            Positioned(
                top: 50.w,
                left: 54.w,
                child: BaseText(text: Get.arguments['time'],fontSize: 11.sp,color: Color(0xff999999),))
          ],
        )
      ],
    );
  }
}
