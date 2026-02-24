import 'package:get/get.dart';
import 'state.dart';

class SyLogic extends GetxController {
  final SyState state = SyState();

  void onButtonClick() {
    // 立即上车按钮点击事件
    Get.snackbar('提示', '立即上车功能');
  }
} 