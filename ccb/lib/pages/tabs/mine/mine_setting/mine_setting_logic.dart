import 'package:get/get.dart';

import '../../../../config/app_config.dart';
import 'mine_setting_state.dart';

class MineSettingLogic extends GetxController {
  final MineSettingState state = MineSettingState();



  String sex = '';

  @override
  void onInit() {
    super.onInit();
    if(AppConfig.config.balanceLogic.memberInfo.sex == ''){
      sex = '1';
    }else {
      sex = AppConfig.config.balanceLogic.memberInfo.sex;
    }
  }
}
