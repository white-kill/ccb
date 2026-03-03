import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/data/model/bill_info_model.dart';
import 'package:ccb/pages/subpages/search/search_items.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';

import 'detaild_info_state.dart';

class DetailInfoLogic extends GetxController {
  final DetailInfoState state = DetailInfoState();

  @override
  void onInit() {
    super.onInit();
    // getData();
    state.infoModel1 = Get.arguments['model'];
  }

  // void getData() {
    // print(Get.arguments['id']);
    // Http.get(Apis.billInfo, queryParameters: {
    //   'id': Get.arguments['id'],
    // }).then((v) {
    //   if (v != null) {
    //     state.infoModel = BillInfoModel.fromJson(v);
    //     update(['updateUI']);
    //   }
    // });
  // }

  String type(){
    if(state.infoModel1.type == '1'){
      return '';
    }
    if(state.infoModel1.type == '2'){
      return '-';
    }
    return '';
  }

  String valueName(String name) {
    switch (name) {
      case '交易账户1':
        return  state.infoModel1.bankName;
      case '交易账户2':
        print(state.infoModel1.bankCard);
        return  state.infoModel1.bankCard;
      case '交易子账户':
        return state.infoModel1.account;
      case '交易时间':
        return state.infoModel1.transactionTime;
      case '交易地点/附言':
        return state.infoModel1.merchantBranch;
      case '对方账户1':
        return state.infoModel1.oppositeName;
      case '对方账户2':
        print(state.infoModel1.oppositeAccount);
        return state.infoModel1.oppositeAccount;
      case '记账日':
        return state.infoModel1.accountsTime;
      case '账户余额':
        return '¥ ${state.infoModel1.accountBalance.bankBalance}';
      default:
        return '';
    }
  }
}
