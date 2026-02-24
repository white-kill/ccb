import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/data/model/transfer_info_model.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import 'transfer_detail_state.dart';

class TransferDetailLogic extends GetxController {
  final TransferDetailState state = TransferDetailState();
  

  @override
  void onInit() {
    super.onInit();

    state.argMap.addAll(Get.arguments);
    state.argMap['show'] = true;
    state.infoModel = Get.arguments['detail'];
    if(state.infoModel.merchantBranch == ''){
      state.nameLis.remove('附言');
    }
    update(['updateUI']);
    // detailData();
  }

  
  void detailData(){
    Http.get(Apis.transferInfo,queryParameters: {
      'id':Get.arguments['id']
    }).then((v){
      if(v != null){
        state.infoModel = TransferInfoModel.fromJson(v);
        if(state.infoModel.merchantBranch == ''){
          state.nameLis.remove('附言');
        }
      }
      update(['updateUI']);
    });
  }


  String valueName(String name) {
    switch (name) {
      case '交易时间':
        return state.infoModel.transactionTime;
      case '交易类型':
        return state.infoModel.transactionType;
      case '交易渠道':
        return state.infoModel.transactionChannel;
      case '付款账户':
        return state.infoModel.bankCard.maskBankCardNumber2();
      case '凭证号':
        return state.infoModel.certificateNo;
      case '转账进度':
        return '转账完成';
        case '附言':
        return state.infoModel.merchantBranch;
        case '转账方式':
        return '实时转账';
      default:
        return '';
    }
  }
}
