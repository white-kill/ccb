import 'package:ccb/config/app_config.dart';
import 'package:get/get.dart';

import 'print_result_state.dart';

class PrintResultLogic extends GetxController {
  final PrintResultState state = PrintResultState();

  @override
  void onInit() {
    super.onInit();
    state.printData = Get.arguments['info'];

    Map<String, dynamic> data = state.printData.toJson();
    state.keyList.add('申请账户');
    state.valueList.add('${AppConfig.config.balanceLogic.card()}');
    if (Get.arguments['type'] != "在线查看") {
      data.forEach((k,v){
        if (state.titleMap[k] == "电子邮箱") {
          state.keyList.add('获取方式');
          state.valueList.add('电子邮件');
        }
        if (state.titleMap[k] == "文件类型" || state.titleMap[k] == "获取方式") {
          return;
        }
        state.keyList.add(state.titleMap[k]);
        state.valueList.add(v);
      });

      state.keyList.add('解压密码');
      state.valueList.add(Get.arguments['code']);
    }
    else {
      data.forEach((k,v){
        if (state.titleMap[k] == "电子邮箱") {
          return;
        }
        if (state.titleMap[k] == "文件类型" || state.titleMap[k] == "获取方式") {
          return;
        }
        state.keyList.add(state.titleMap[k]);
        state.valueList.add(v);
      });
      state.keyList.add('获取方式');
      state.valueList.add(Get.arguments['type']);
    }


  }
}
