import 'package:ccb/pages/tabs/mine/turnover_print/paper_print/view.dart';
import 'package:ccb/pages/tabs/mine/turnover_print/print_1/print_1_view.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../routes/app_pages.dart';
import 'turnover_print_state.dart';

class TurnoverPrintLogic extends GetxController {

  var agree = true.obs;
  final TurnoverPrintState state = TurnoverPrintState();

  var showPage = false.obs;

  var showImage = false.obs;


  var ck = false.obs;


  String? type;

  @override
  void onInit()  async{
    super.onInit();

    type = Get.arguments["type"];

    ''.showLoading;
    await Future.delayed(const Duration(milliseconds: 600));
    SmartDialog.dismiss(status: SmartStatus.loading);

    await Future.delayed(const Duration(milliseconds: 200));
    showImage.value = true;

    // await Future.delayed(const Duration(milliseconds: 500));
    // showImage.value = true;

    ''.showLoading;
    await Future.delayed(const Duration(milliseconds: 600));
    SmartDialog.dismiss(status: SmartStatus.loading);

    ''.showLoading;
    await Future.delayed(const Duration(milliseconds: 200));
    SmartDialog.dismiss(status: SmartStatus.loading);
    showPage.value = true;

  }

  void next(){


    state.printData.currency = state.item1title2;
    state.printData.detailType = state.item1title3;
    state.printData.beginTime = state.item1title4;
    state.printData.endTime = state.item1title5;
    state.printData.minAmount = state.controller1.text;
    state.printData.maxAmount = state.controller2.text;
    state.printData.oppositeAccount = state.controller1A.text;
    state.printData.oppositeName = state.controller2N.text;
    // state.printData.fileType = state.item5title2;
    // state.printData.email = state.item5TextController.text;
    state.printData.showType = state.showType;
    state.printData.version = state.item1title3_1;

    print(state.printData.toJson());
    // if(!RegexUtil.isEmail(state.printData.email)){
    //   '请填写正确的邮箱'.showToast;
    //   return;
    // }

    // Get.toNamed(Routes.printInfoPage,arguments: {
    //   'info':state.printData,
    // });

    if (type == "paper") {
      Get.to(() => PaperPrintPage());
    }
    else {
      Get.to(() => Print1Page(),arguments: {
        'info':state.printData,
      });
    }
  }
}
