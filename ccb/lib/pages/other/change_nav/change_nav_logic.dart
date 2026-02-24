import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'change_nav_state.dart';

class ChangeNavLogic extends GetxController {
  var navActionColor = Colors.white.obs;

  final ChangeNavState state = ChangeNavState();

  @override
  void onInit() {
    super.onInit();
    navActionColor.value = Get.arguments?['defTitleColor']??Colors.white;
    state.assetsImagePath = Get.arguments?['image']??'';
    state.fullImagePath = Get.arguments?['fullImagePath']??'';

  }
}
