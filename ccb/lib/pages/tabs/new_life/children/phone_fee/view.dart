import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';

class PhoneFeePage extends BaseStateless {
  final logic = Get.put(PhoneFeeLogic());

  PhoneFeePage({super.key});

  @override
  String? get title => '手机充值';

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
    SizedBox(width: 8.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            'assets/new_images/life/children/phone_fee.png',
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            top: screenWidth/1125 * 2319 * 0.066,
            left: screenWidth * 0.05,
            child: Container(
              child: Text(
                formatPhoneNumber(AppConfig.config.balanceLogic.memberInfo.phone),
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}