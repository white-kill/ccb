import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/dio/network.dart';
import '../../../config/net_config/apis.dart';
import '../../../data/model/account_view_model.dart';
import '../../../routes/app_pages.dart';
import 'wealth_state.dart';

class WealthLogic extends GetxController {
  final WealthState state = WealthState();

  // 添加一个新的变量来管理眼睛图标的状态
  final isEyeOpen = false.obs;
  final reloadShow = false.obs;
  void toggleEyeState() {
    isEyeOpen.value = !isEyeOpen.value;
    reloadShow.value = isEyeOpen.value;
  }

  void accountView() async{
    await Http.get(Apis.accountView,queryParameters: {
      'type':'0'
    }).then((value) {
      if (value is Map<String, dynamic>) {
        state.accountViewModel = AccountViewModel.fromJson(value);
        update(['updateUI']);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    accountView();
  }

  // 产品点击事件
  void onProductClick(String productName) {
    switch (productName) {
      case '存款产品':
        Get.toNamed(Routes.ckcp);
        break;
      case '理财产品':
        Get.toNamed(Routes.lccp);
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
      case '龙钱宝1号':
        Get.toNamed(Routes.lqb1);
        break;
      case '龙钱宝2号':
        Get.toNamed(Routes.lqb2);
        break;
      case '速盈':
        Get.toNamed(Routes.sy);
        break;
      case '更多':
        Get.toNamed(Routes.more);
        break;
      default:
        break;
    }
  }
}
