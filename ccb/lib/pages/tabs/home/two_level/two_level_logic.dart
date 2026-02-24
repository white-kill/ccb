import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import 'two_level_state.dart';

class TwoLevelLogic extends GetxController {
  final TwoLevelState state = TwoLevelState();

  @override
  void onClose() {
    super.onClose();
    state.dispose();
  }

  // 切换页面
  void changePage(int index) {
    state.currentPage = index;
    update(['pageIndicator']);
  }

  // 跳转到指定页面
  void jumpToPage(int index) {
    state.pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // 处理前4个点击 - 显示全屏图片
  void handleImageClick(int index) {
    final imageNames = [
      'home_two_caifu',
      'home_two_card',
      'home_two_life',
      'home_two_mine',
    ];
    
    if (index < imageNames.length) {
      state.showFullImage = true;
      state.fullImageName = imageNames[index];
      update(['fullImage']);
    }
  }

  // 隐藏全屏图片
  void hideFullImage() {
    state.showFullImage = false;
    update(['fullImage']);
  }

  // 切换总资产显示/隐藏
  void toggleBalance() {
    state.showBalance = !state.showBalance;
    update(['balanceDisplay']);
  }

  // 处理后4个点击 - 跳转页面
  void handlePageNavigation(int index) {
    switch (index) {
      case 4: // 账户查询
        Get.toNamed(Routes.accountPreview);
        break;
      case 5: // 账户明细
        Get.toNamed(Routes.accountDetail);
        break;
      case 6: // 我要转账 - 跳转到转账汇款页面
        Get.toNamed(Routes.accountMoneyTransferView);
        break;
      case 7: // 个人养老金
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '个人养老金',
          'image': 'bg_grylj',
        });
        break;
    }
  }

  // 统一处理点击
  void onItemTap(int index) {
    if (index < 4) {
      // 前4个显示图片
      handleImageClick(index);
    } else {
      // 后4个跳转页面
      handlePageNavigation(index);
    }
  }
}

