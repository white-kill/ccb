import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

class WdlcPage extends BaseStateless {
  WdlcPage({Key? key}) : super(key: key);


  final WdlcLogic logic = Get.put(WdlcLogic());
  final WdlcState state = Get.find<WdlcLogic>().state;


  @override
  // TODO: implement titleWidget
  Widget? get titleWidget =>
      Obx(() {
        return BaseText(
            text: "我的理财",
            fontSize: 18.sp,
            color: logic.navActionColor.value);
      });


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
  List<Widget>? get rightAction =>
      [
        Obx(() {
          return IconButton(
            onPressed: () {
              Get.toNamed('/ccbCustomerPage');
            },
            icon: Image.asset('assets/new_images/cai_fu/ear.png', width: 14.w,
                height: 14.w,
                color: logic.navActionColor.value),
          );
        }),
      ];

  @override
  Function(bool change)? get onNotificationNavChange =>
          (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/cai_fu/children/wdlc.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}