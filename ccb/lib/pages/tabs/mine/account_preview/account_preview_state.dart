import 'package:flutter/material.dart';

import '../../../../data/model/account_view_model.dart';

class AccountPreviewState {


  late TabController tabController;

  AccountViewModel? accountViewModel;

  String checkTitle = '近一月';

  List checkTitleList = [
    '近一月',
    '近一年',
  ];

  List tabNameList = [
    '财富全景',
    '银行卡',
  ];

  AccountPreviewState() {
    ///Initialize variables
  }
}
