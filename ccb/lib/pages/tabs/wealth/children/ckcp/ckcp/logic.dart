import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../routes/app_pages.dart';
import 'state.dart';

class CkcpLogic extends GetxController {
  final CkcpState state = CkcpState();
  var navActionColor = Colors.white.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // 处理按钮点击事件
  void onTapButton(String title) {
    if (title.isEmpty) return;
    switch (title) {
      case '定期存款':
        Get.toNamed('/wealth/dqck');
        break;
      case '大额存单':
        Get.toNamed('/wealth/decd');
        break;
      case '通知存款':
        Get.toNamed('/wealth/tzck');
        break;
      case '特色存款':
        Get.toNamed('/wealth/tsck');
        break;
      case '结构性存款':
        Get.toNamed('/wealth/jgxck');
        break;
    }
  }

  void onTapDqck() {
    Get.toNamed('/wealth/dqck');
  }

  void onTapDecd() {
    Get.toNamed('/wealth/decd');
  }

  void onTapTzck() {
    Get.toNamed('/wealth/tzck');
  }

  void onTapTsck() {
    Get.toNamed('/wealth/tsck');
  }
} 