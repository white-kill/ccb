import 'package:get/get.dart';
import '../../logic.dart';
import 'state.dart';

class JiJinFollowLogic extends GetxController {
  final JiJinFollowState state = JiJinFollowState();

  void goToHomePage() {
    // 切换到首页tab
    final mainLogic = Get.find<JiJinTouZiMainLogic>();
    mainLogic.changeTab(0);
  }
} 