import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_pages.dart';
import 'state.dart';

class MoreLogic extends GetxController {
  final MoreState state = MoreState();
  
  // 滚动控制器
  final ScrollController scrollController = ScrollController();
  
  // 各个分类区域的Global Key
  final GlobalKey featuredKey = GlobalKey();
  final GlobalKey fundKey = GlobalKey();
  final GlobalKey depositKey = GlobalKey();
  final GlobalKey metalKey = GlobalKey();
  final GlobalKey privateKey = GlobalKey();
  final GlobalKey otherKey = GlobalKey();

  void onTabChanged(int index) {
    state.selectedTabIndex = index;
    update();
    
    // 滚动到对应的分类区域
    _scrollToSection(index);
  }
  
  void _scrollToSection(int index) {
    GlobalKey? targetKey;
    
    switch (index) {
      case 0: // 基金/证券/理财
        targetKey = fundKey;
        break;
      case 1: // 存款/保险/外汇
        targetKey = depositKey;
        break;
      case 2: // 贵金属
        targetKey = metalKey;
        break;
      case 3: // 私募产品
        targetKey = privateKey;
        break;
      case 4: // 其他
        targetKey = otherKey;
        break;
    }
    
    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.0, // 滚动到顶部
      );
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void onProductClick(String label) {
    switch (label) {
      case '理财产品':
        Get.toNamed(Routes.lc);
        break;
      case '基金投资':
        Get.toNamed(Routes.jjtz);
        break;
      case '保险':
        Get.toNamed(Routes.bx);
        break;
      case '贵金属':
        Get.toNamed(Routes.gjs);
        break;
      case '建行严选':
        Get.toNamed(Routes.jhyx);
        break;
      case '龙钱宝2号':
        Get.toNamed(Routes.lqb2);
        break;
      case '速盈':
        Get.toNamed(Routes.sy);
        break;
      default:
        // Get.snackbar('提示', '功能开发中：$label');
        break;
    }
  }
} 