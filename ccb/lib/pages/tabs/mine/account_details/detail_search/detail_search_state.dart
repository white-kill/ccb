import 'package:flutter/cupertino.dart';

class DetailSearchState {

  List nameList = [];
  TextEditingController? textController = TextEditingController();
  DetailSearchState() {
    ///Initialize variables

    nameList = [
      '支付宝',
      '微信',
      '财付通',
      '工资',
      '转账',
      '还款',
      '龙支付',
      '理财',
      '基金',
    ];
  }
}
