import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'print_progress_state.dart';

class PrintProgressLogic extends GetxController  with GetSingleTickerProviderStateMixin {
  final PrintProgressState state = PrintProgressState();


  @override
  void onInit() {
    super.onInit();
    state.tabController =
        TabController(length: state.tabNameList.length, vsync: this);
  }
}
