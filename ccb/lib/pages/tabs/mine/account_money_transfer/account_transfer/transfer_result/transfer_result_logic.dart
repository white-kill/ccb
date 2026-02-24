import 'package:get/get.dart';

import 'transfer_result_state.dart';

class TransferResultLogic extends GetxController {
  final TransferResultState state = TransferResultState();

  var isShow = true.obs;

  Map<String,dynamic> argData = {};

  @override
  void onInit() {
    super.onInit();
    argData = Get.arguments;
  }
}
