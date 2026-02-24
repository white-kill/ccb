import 'package:ccb/config/app_config.dart';
import 'package:ccb/pages/tabs/mine/turnover_print/req_data.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../data/model/member_info_entity.dart';

class TurnoverPrintState {

  String item1title1 = '请选择';
  String item1title2 = '人民币';
  String item1title3_1 = '中文版';
  String item1title3 = '全部明细';
  String item1title4 = '';
  String item1title5 = '';
  String item1title6 = '近半年';

  String item5title1 = '请选择';
  String item5title1_1 = '点击选择邮箱地址';
  String item5title2 = '请选择';
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();


  TextEditingController controller1A = TextEditingController();
  TextEditingController controller2N = TextEditingController();

   String showType = '3,4';
  TextEditingController item5TextController = TextEditingController();
  late MemberInfoModel infoModel;


  PrintData printData = PrintData();


  TurnoverPrintState() {
    ///Initialize variables
    DateTime currentDate = DateTime.now();
    DateTime sixMonthsAgo = DateTime(currentDate.year, currentDate.month - 6, currentDate.day);
    item1title4 =  DateUtil.formatDate(sixMonthsAgo, format: 'yyyy/MM/dd');
    item1title5 =  DateUtil.formatDate(currentDate, format: 'yyyy/MM/dd');
    infoModel = AppConfig.config.balanceLogic.memberInfo;
    if(infoModel.bankList.isNotEmpty){
      item1title1 = infoModel.bankList.first.bankCard;

    }
  }
}
