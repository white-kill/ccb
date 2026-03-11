import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/dio/network.dart';
import '../../../../config/net_config/apis.dart';
import '../../../../data/model/account_view_model.dart';
import 'account_preview_state.dart';

class AccountPreviewLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AccountPreviewState state = AccountPreviewState();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    final tabIndex = (args is Map && args['tabIndex'] != null)
        ? args['tabIndex'] as int
        : 1;
    state.tabController = TabController(
      length: state.tabNameList.length,
      initialIndex: tabIndex,
      vsync: this,
    );
    
    // 监听 tab 切换，更新按钮显示
    state.tabController.addListener(() {
      update(['updateTopButton']);
    });

    accountView();
  }

  String selectData = '1';
  changeSelect(String index){
    selectData = index;
    update(['changeSelect']);
  }

  bool showMore = false;
  changeShowMore(bool show){
    showMore = show;
    update(['updateCell']);
  }

  void accountView() async{
    await Http.get(Apis.accountView,queryParameters: {
      'type':state.checkTitle =='近一月'?'0':'1'
    }).then((value) {
      if (value is Map<String, dynamic>) {
        state.accountViewModel = AccountViewModel.fromJson(value);
        update(['updateAccountView','changeSelect']);
      }
    });
  }
}
