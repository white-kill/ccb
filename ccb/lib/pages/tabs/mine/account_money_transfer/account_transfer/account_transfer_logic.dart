import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import '../../../../../data/model/contacts_list_model.dart';
import '../../../wealth/wealth_logic.dart';
import 'account_transfer_state.dart';



class AccountTransferLogic extends GetxController {
  final AccountTransferState state = AccountTransferState();

  ContactsListModel? model;
  @override
  void onInit() {
    super.onInit();

    if(Get.arguments?['bankModel'] != null){
      model = Get.arguments['bankModel'];
      state.accountTextController.text = model?.bankCard??'';
      state.nameTextController.text = model?.name??'';
      state.bankData = {
        'url': model?.icon, 'name': model?.bankName, 'id': model?.bankId
      };
    }
    // var formatter = NumberFormat();
    // var formattedNumber = formatter.format(12345.6789);
    // print(formattedNumber);
    // print(formatter.parse(formattedNumber));
  }

  void selectCon(Map<String,dynamic> data){
    state.bankData = data['bank'];
    state.accountTextController.text = model?.bankCard??'';
    state.nameTextController.text = data['name'];
    state.accountTextController.text = data['bankCard'];
    update(['updateBottom']);
  }

  void transfer(){
    state.reqData.bankName = state.bankData['name'];
    state.reqData.realName = state.nameTextController.text;
    state.reqData.cardNo = state.accountTextController.text;
    state.reqData.bankId = state.bankData['id'].toString();
    state.reqData.amount = state.moneyStr;
    state.reqData.purpose = state.remarksTextController.text;
    Map<String, dynamic> data = state.reqData.toJson();
    Http.post(Apis.transfer,data: data).then((value){
      SmartDialog.dismiss().then((v){
        final WealthLogic logic = Get.put(WealthLogic());
        logic.accountView();
        AppConfig.config.balanceLogic.memberInfoData().then((v){
          Get.offNamed(Routes.transferPagePage,arguments: {
            'money':state.moneyTextController.text,
            'account':'${state.reqData.realName } ${state.reqData.cardNo.maskBankCardNumber()}',
            'bank':state.bankData['name'],
            'fkAccount':AppConfig.config.balanceLogic.card(),
            'yue':AppConfig.config.balanceLogic.balance(),
            'id':value.toString(),
          });
        });
      });
    });
  }
}
