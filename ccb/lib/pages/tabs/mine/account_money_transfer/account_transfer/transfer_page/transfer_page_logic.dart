import 'dart:async';

import 'package:ccb/routes/app_pages.dart';
import 'package:get/get.dart';

import 'transfer_page_state.dart';

class TransferPageLogic extends GetxController {
  final TransferPageState state = TransferPageState();

  Timer? timer;
  double secondsRemaining = 0;

  void _startTimer() {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      secondsRemaining = secondsRemaining + 0.1;
      update(['updateUI']);
      if (secondsRemaining.floor() == 10) {
        secondsRemaining = 0; // 倒计时结束时重置为0
        timer.cancel(); // 取消定时器
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _startTimer();

    Future.delayed(const Duration(seconds: 2),(){
      timer?.cancel();
      Get.offNamed(Routes.transferResultPage,arguments: Get.arguments);
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
