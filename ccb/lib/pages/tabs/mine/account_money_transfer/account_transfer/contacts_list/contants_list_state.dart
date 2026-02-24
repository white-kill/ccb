
import 'package:ccb/config/app_config.dart';

import '../../../../../../data/model/member_info_entity.dart';
import '../bank_list/bank_list_model.dart';

class ContactsListState {
  late MemberInfoModel infoModel;
  ContactsListState() {
    ///Initialize variables

    infoModel = AppConfig.config.balanceLogic.memberInfo;
  }
}
