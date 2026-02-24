import 'package:get/get.dart';

import 'state.dart';

class DecdLogic extends GetxController {
  final DecdState state = DecdState();
  
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // 选择tab
  void selectTab(int index) {
    selectedIndex.value = index;
  }

  // 立即存入按钮点击
  void onDepositClick() {
  }
} 