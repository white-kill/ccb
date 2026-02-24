import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';

import 'ccb_customer_state.dart';

class CcbCustomerLogic extends GetxController {

  var showView = false.obs;
  final CcbCustomerState state = CcbCustomerState();

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 1),(){
      showView.value = true;
    });
  }
}
