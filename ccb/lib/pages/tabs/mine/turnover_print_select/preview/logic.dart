import 'dart:async';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import 'state.dart';

class PrintPreviewLogic extends GetxController {
  final PrintPreviewState state = PrintPreviewState();
  @override
  void onInit() {
    super.onInit();
    
    // 1秒后跳转到realturnoverPrintSelectPage页面
    Timer(const Duration(milliseconds: 500), () {
      Get.offNamed(Routes.printNewSelectPage);
    });
  }
}
