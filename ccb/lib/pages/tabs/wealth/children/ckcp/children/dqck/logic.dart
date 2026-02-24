import 'package:get/get.dart';

import 'state.dart';

class DqckLogic extends GetxController {
  final DqckState state = DqckState();
  
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

  // 分享按钮点击
  void onShareClick() {
  }

  // 帮助按钮点击
  void onHelpClick() {
  }
} 