import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../config/app_config.dart';
import '../Req_data.dart';

class PersonTransferState {

  List selList = [];
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String sx1 = '';
  String sx2 = '全部';
  String sx3 = ' 全部 ';

  String title1 = '全部付款账户';
  String title2 = '一个月';
  ReqData redData =  ReqData();

  List bankList = ['全部付款账户'];

  PersonTransferState() {
    ///Initialize variables
    String bTime = DateUtil.formatDate(getDateRange(title2).first, format: DateFormats.y_mo_d);
    String eTime = DateUtil.formatDate(getDateRange(title2).last, format: DateFormats.y_mo_d);
    redData.beginTime = bTime;
    redData.endTime = eTime;

    AppConfig.config.balanceLogic.memberInfo.bankList.forEach((e){
      bankList.add(e.bankCard);
    });
  }

  List<DateTime> getDateRange(String rangeType) {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);

    switch (rangeType) {
      case '当天':
        return [todayStart, todayStart.add(const Duration(days: 1))];
      case '七天':
        return [todayStart.subtract(const Duration(days: 6)), todayStart.add(const Duration(days: 1))];
      case '一个月':
        return [DateTime(now.year, now.month - 1, now.day), todayStart.add(const Duration(days: 1))];
      case '近3月':
        return [DateTime(now.year, now.month - 3, now.day), todayStart.add(const Duration(days: 1))];
      case '近6月':
        return [DateTime(now.year, now.month - 6, now.day), todayStart.add(const Duration(days: 1))];
      default:
        throw ArgumentError('不支持的日期范围类型: $rangeType');
    }
  }
}
