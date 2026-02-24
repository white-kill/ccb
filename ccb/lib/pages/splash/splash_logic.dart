import 'package:ccb/pages/account/login/login_view.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../utils/sp_util.dart';
import '../index/index_view.dart';
import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 1),(){
      Get.to(() => token.isNullOrEmpty ? LoginPage() :IndexPage(),transition: Transition.noTransition);
    });
  }
}
