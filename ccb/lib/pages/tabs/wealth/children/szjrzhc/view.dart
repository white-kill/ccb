import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

/// 财富热门   数字金融主会场
class SzjrzhcPage extends BaseStateless {
  SzjrzhcPage({Key? key}) : super(key: key);

  final SzjrzhcLogic logic = Get.put(SzjrzhcLogic());
  final SzjrzhcState state = Get.find<SzjrzhcLogic>().state;

  @override
  String? get title => '数字金融主会场';

  @override
  Widget? get leftItem => IconButton(
    icon: Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w),
    onPressed: () => Get.back(),
  );

  @override
  List<Widget>? get rightAction => [
    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
    IconButton(
      icon: Image.asset('assets/new_images/close.png', width: 14.w, height: 14.w),
      onPressed: () => Get.back(),
    ),
    SizedBox(width: 8.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/cai_fu/szjrzhc.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
