import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

class CardPackagePage extends BaseStateless {
  CardPackagePage({Key? key}) : super(key: key);

  final CardPackageLogic logic = Get.put(CardPackageLogic());
  final CardPackageState state = Get.find<CardPackageLogic>().state;

  @override
  String get title => '信用卡包';

  @override
  Color get navColor => Colors.white;

  @override
  Color? get navTitleColor => Colors.black87;

  @override
  Color? get leadingColor => Colors.black87;

  @override
  Widget? get leftItem => IconButton(
        icon: Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w),
        onPressed: () => Get.back(),
      );

  @override
  List<Widget>? get rightAction => [
        IconButton(
          icon: Image.asset('assets/new_images/close.png', width: 14.w, height: 14.w),
          onPressed: () => Get.back(),
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    // According to your requirement, the body is a single static image.
    // I am assuming the image path is as follows.
    // Please replace it with the correct path if it's different.
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Image.asset(
          'assets/new_images/card/card_package/card_package.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
