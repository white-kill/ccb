import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class XykjymxsqPage extends BaseStateless {
  XykjymxsqPage({Key? key}) : super(key: key, title: "信用卡交易明细申请");

  final XykjymxsqLogic logic = Get.put(XykjymxsqLogic());
  final XykjymxsqState state = Get.find<XykjymxsqLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return Image(image: "xykjymxsq".png3x, width: 1.sw, fit: BoxFit.fitWidth,).withOnTap(onTap: () {
      Get.to(Image(image: "xykjymxsq_1".png3x).withOnTap(onTap: () {
        Get.back();
      }));
    });
  }
}
