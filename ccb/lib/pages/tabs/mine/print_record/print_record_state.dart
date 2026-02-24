import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../config/app_config.dart';
import '../../../../data/model/apply_list_model.dart';

class PrintRecordState {
  String title1 = '一个月';
  String title2 = '全部账户';
  String title3 = '全部类型';
  List bankList = ['全部付款账户'];

  int pageNum = 1;

  RefreshController refreshController = RefreshController();

  late ApplyListModel listModel;
  List<ApplyListList> list = [];


  List nameLis = [
    '当前状态',
    '申请时间',
    '申请账户',
    '明细类型',
    '查询时段',
    '解压密码',
    '接收邮箱',
  ];
  PrintRecordState() {
    ///Initialize variables

    AppConfig.config.balanceLogic.memberInfo.bankList.forEach((e){
      bankList.add(e.bankCard);
    });
  }
}
