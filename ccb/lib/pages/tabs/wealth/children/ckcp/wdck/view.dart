import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'logic.dart';
import 'state.dart';

class WdckView extends BaseStateless {
  WdckView({Key? key}) : super(key: key);

  final WdckLogic logic = Get.put(WdckLogic());
  final WdckState state = Get.find<WdckLogic>().state;


  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem =>
      Obx(() {
        return IconButton(
          icon: Image.asset('assets/new_images/back.png', width: 8.w,
              height: 16.w,
              color: logic.navActionColor.value),
          onPressed: () => Get.back(),
        );
      });


  @override
  Function(bool change)? get onNotificationNavChange =>
          (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };



  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset('assets/new_images/cai_fu/children/ckcp/wdck.png',)
    );
  }
} 