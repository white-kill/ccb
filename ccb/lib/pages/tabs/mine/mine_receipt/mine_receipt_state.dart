import 'package:flutter/cupertino.dart';

import '../../../../data/model/transfer_info_model.dart';

class MineReceiptState {


  GlobalKey shareGoodsGlobalKey = GlobalKey();


  bool fistClick = true;

  List<String> nameList = [
    '交易时间',
    '交易类型',
    '交易渠道',
    '转账金额',
    '大写金额',
    '附言',
    '凭证号',
    '收款方',
    '户名',
    '账号',
    '收款银行',
    '付款方',
    '户名',
    '账号 ',
    '此回单说明转账交易受理成功，不代表资金已转入收款账户不作为收付方交易确认的最终依据。交易结果请以收款账户实际入账为准。'
  ];


  List<String> imageList = [
    'hd_0',
    'hd_1',
    'hd_2',
    'hd_3',
    'hd_4',
    'hd_2',
    'hd_3',
    'hd_4',
  ];

  TransferInfoModel infoModel = TransferInfoModel();

  MineReceiptState() {
    ///Initialize variables
  }
}
