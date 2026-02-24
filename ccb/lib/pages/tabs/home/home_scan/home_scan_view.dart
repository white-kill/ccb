import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'home_scan_logic.dart';
import 'home_scan_state.dart';

class HomeScanPage extends BaseStateless {
  HomeScanPage({Key? key}) : super(key: key,title: '扫一扫');

  final HomeScanLogic logic = Get.put(HomeScanLogic());
  final HomeScanState state = Get.find<HomeScanLogic>().state;


  @override
  Widget initBody(BuildContext context) {
    return Container();
  }
}
