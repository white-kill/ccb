import 'package:ccb/config/app_config.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../data/model/member_info_entity.dart';
import 'transfer_data.dart';

class AccountTransferState {


  TextEditingController nameTextController = TextEditingController();

  TextEditingController accountTextController = TextEditingController();
  FocusNode accountFocusNode = FocusNode();
  bool showAccountTextField = false;


  TextEditingController moneyTextController = TextEditingController();
  FocusNode moneyFocusNode = FocusNode();
  String moneyStr = '';

  FocusNode phoneFocusNode = FocusNode();
  bool showPhoneTextField = false;

  TextEditingController remarksTextController = TextEditingController();

  Map<String, dynamic> bankData = {'url': '', 'name': '', 'id': ''};

  TransferData reqData = TransferData();

  late MemberInfoModel infoModel;

  AccountTransferState() {
    ///Initialize variables

    infoModel = AppConfig.config.balanceLogic.memberInfo;
  }
}
