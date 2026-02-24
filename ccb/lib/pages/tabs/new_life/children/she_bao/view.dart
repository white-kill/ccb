import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';

class SheBaoPage extends BaseStateless {
  final logic = Get.put(SheBaoLogic());

  SheBaoPage({super.key});

  @override
  String? get title => '社保';

  @override
  Widget? get leftItem =>
      IconButton(
        icon: Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w),
        onPressed: () => Get.back(),
      );

  @override
  List<Widget>? get rightAction =>
      [
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
      child: Stack(
        children: [
          Image.asset(
            'assets/new_images/life/children/she_bao.png',
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              left: screenWidth * 0.06,
              top: 0,
              child: Row(
            children: [
              GetBuilder(builder: (BalanceLogic c) {
                return Text(
                  AppConfig.config.balanceLogic.memberInfo.city,
                  style: TextStyle(
                      fontSize: 13.sp,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    fontFamily: "PingFangSC"
                  ),
                );
              },id: 'updateUI',),
              Icon(Icons.arrow_drop_down,color: Colors.black,)
            ],
          ))
        ],
      ),
    );
  }
} 