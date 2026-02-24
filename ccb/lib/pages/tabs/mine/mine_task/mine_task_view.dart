import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'mine_task_logic.dart';
import 'mine_task_state.dart';

class MineTaskPage extends BaseStateless {
  MineTaskPage({Key? key}) : super(key: key, title: '任务中心');

  final MineTaskLogic logic = Get.put(MineTaskLogic());
  final MineTaskState state = Get.find<MineTaskLogic>().state;


  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem => InkWell(
        child: Obx(() => Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Icon(
                Icons.navigate_before,
                size: 30.h,
                color: logic.navActionColor.value,
              ),
            )),
        onTap: () => Get.back(),
      );

  @override
  Widget? get titleWidget => Obx(() => BaseText(
      text: title??'',
      fontSize: 18.sp,
      color: logic.navActionColor.value),);

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
    logic.navActionColor.value = v ? Colors.black : Colors.white;
  };

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Image(
          image:'bg_rwzx'.png3x,
          fit: BoxFit.fitWidth,
          width: 1.sw,
        )
      ],
    );
  }
}
