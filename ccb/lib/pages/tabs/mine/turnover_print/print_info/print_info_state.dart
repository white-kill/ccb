import 'package:wb_base_widget/component/count_down_btn.dart';

import '../req_data.dart';

class PrintInfoState {
  late PrintData printData;

  List<String> keyList = [];
  List<String> valueList = [];

  Map<String, dynamic> titleMap = {};

  CountDownBtnController downBtnController = CountDownBtnController();

  PrintInfoState() {
    ///Initialize variables
    titleMap = {
      'beginTime': '明细开始日期',
      'currency': '币种',
      'detailType': '明细类型',
      'email': '电子邮箱',
      'endTime': '明细结束日期',
      'fileType': '文件类型',
      'maxAmount': '交易最大金额',
      'minAmount': '交易最小金额',
      'oppositeAccount': '对方账户',
      'oppositeName': '对方户名',
      'showType': '',
      'version':''
    };
  }
}
