import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class JiJinTouZiMainLogic extends GetxController {
  final JiJinTouZiMainState state = JiJinTouZiMainState();
  
  final currentIndex = 0.obs;
  final navActionColor = Colors.white.obs;
  final navTitleColor = Colors.transparent.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
