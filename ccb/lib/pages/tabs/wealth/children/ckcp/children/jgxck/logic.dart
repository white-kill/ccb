import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class JgxckLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final JgxckState state = JgxckState();

  @override
  void onInit() {
    super.onInit();
    state.tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    state.tabController.dispose();
    super.onClose();
  }
} 