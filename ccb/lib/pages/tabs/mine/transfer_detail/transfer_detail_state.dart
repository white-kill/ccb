import 'package:ccb/data/model/transfer_info_model.dart';

class TransferDetailState {


  List nameLis = [
    '交易时间',
    '交易类型',
    '交易渠道',
    '付款账户',
    '附言',
    '转账方式',
    '凭证号',
    '转账进度'
  ];

  Map<String,dynamic> argMap = {};

  TransferInfoModel infoModel = TransferInfoModel();

  TransferDetailState() {
    ///Initialize variables
  }
}
