import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ccb/utils/event_bus_util.dart';

import 'state.dart';

class WdckLogic extends GetxController {
  final WdckState state = WdckState();
  var navActionColor = Colors.white.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // 切换到存款产品tab
  void goToCkcpTab() {
    // 发送事件切换到第一个tab
    EventBusUtil.fire(SwitchTabEvent('ckcp'));
  }
}

// 定义切换tab事件
class SwitchTabEvent extends Event {
  final String tabName;
  SwitchTabEvent(this.tabName);
} 