import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';

class LianHeHuiYuanShouQuanPage extends BaseStateless {
  final logic = Get.put(LianHeHuiYuanShouQuanLogic());

  LianHeHuiYuanShouQuanPage({super.key});

  @override
  String? get title => '联合会员授权';

  @override
  Color? get background => Colors.grey.withOpacity(0.6);

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
    return Container(
      child: Image.asset(
        'assets/new_images/life/children/lian_he_hui_yuan_shou_quan.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 