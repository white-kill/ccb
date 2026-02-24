import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navi_offset_state.dart';

class NaviOffsetLogic extends GetxController {
  var navActionColor = Colors.black.obs;
  final NaviOffsetState state = NaviOffsetState();
  @override
  void onInit() {
    super.onInit();
    navActionColor.value = Colors.black;
    state.assetsImagePath = Get.arguments?['image'] ?? '';
  }
}
