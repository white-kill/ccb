import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

/// 财富体检
class CftjPage extends BaseStateless {
  CftjPage({Key? key}) : super(key: key);

  final CftjLogic logic = Get.put(CftjLogic());
  final CftjState state = Get.find<CftjLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  String? get title => "财富体检";

  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.black;

  @override
  Widget? get leftItem => IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: 30.w,
          minHeight: 30.w,
        ),
        onPressed: () => Get.back(),
        icon: Image.asset(
          'assets/new_images/back.png',
          width: 8.w,
          height: 16.w,
          color: Colors.black,
        ),
      );

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            "assets/new_images/home/cfty.png",
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              top: screenWidth / 1125 * 2820 * 0.36,
              left: screenWidth * 0.108,
              child: Text(
                AppConfig.config.balanceLogic.balance(),
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              )),
          Positioned(
              top: screenWidth / 1125 * 2820 * 0.6208,
              left: screenWidth * 0.108,
              child: Row(
                children: [
                  Text(
                   AppConfig.config.balanceLogic.balance(),
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal, height: 1.1),
                  ),
      SizedBox(width: 0.5,),
      Text("元", style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, height: 1.1),)
                ],
              ))
        ],
      ),
    );
  }
}
