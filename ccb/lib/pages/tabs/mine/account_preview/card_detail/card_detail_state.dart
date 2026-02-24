import 'package:flutter/cupertino.dart';

import '../../../../../config/app_config.dart';
import '../../../../../data/model/member_info_entity.dart';

class CardDetailState {

  late MemberInfoBankList infoModel;

  TextEditingController textEditingController = TextEditingController();

  CardDetailState() {
    ///Initialize variables
    infoModel =  AppConfig.config.balanceLogic.memberInfo.bankList.first;
  }
}
