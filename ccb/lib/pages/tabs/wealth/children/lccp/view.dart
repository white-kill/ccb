import 'package:ccb/pages/tabs/wealth/children/lccp/logic.dart';
import 'package:ccb/pages/tabs/wealth/children/lccp/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class LccpPage extends BaseStateless {
  LccpPage({Key? key}) : super(key: key);

  final LccpPageLogic logic = Get.put(LccpPageLogic());
  final LccpPageState state = Get
      .find<LccpPageLogic>()
      .state;


  @override
  // TODO: implement titleWidget
  Widget? get titleWidget =>
      Obx(() {
        return BaseText(
            text: "理财产品",
            fontSize: 18.sp,
            color: logic.navTitleColor.value);
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
            onPressed: () {},
            icon: Image.asset('assets/new_images/cai_fu/share.png', width: 14.w,
                height: 14.w,
                color: logic.navActionColor.value),
          );
        }),
        Obx(() {
          return IconButton(
            icon: Image.asset('assets/new_images/cai_fu/ear.png', width: 14.w,
              height: 14.w,
              color: logic.navActionColor.value,),
            onPressed: () => Get.toNamed('/ccbCustomerPage'),
          );
        }),
      ];

  @override
  Function(bool change)? get onNotificationNavChange =>
          (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
        logic.navTitleColor.value = v ? Colors.black : Colors.transparent;
      };

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/cai_fu/children/lccp.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}