import 'package:ccb/data/model/bill_info_model.dart';

class DetailInfoState {

  BillInfoModel infoModel1 = BillInfoModel();

  List rightDataList = [
    {
      'name':'建行客服',
      'icon':'ic_home_customer',
    },
    {
      'name':'首页',
      'icon':'tabbar_normal0',
    },
    {
      'name':'消息',
      'icon':'ic_home_message',
    },
  ];



  List nameLis = [
    '交易账户',
    // '交易子账户',
    '交易时间',
    '交易地点/附言',
    '对方账户',
    '记账日',
    '账户余额',
  ];


  DetailInfoState() {
    ///Initialize variables
  }
}
