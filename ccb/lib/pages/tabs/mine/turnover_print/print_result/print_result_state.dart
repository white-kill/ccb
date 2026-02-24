import '../req_data.dart';

class PrintResultState {
  late PrintData printData;

  List<String> keyList = [];
  List<String> valueList = [];

  Map<String, dynamic> titleMap = {};

  PrintResultState() {
    ///Initialize variables

    titleMap = {
      'beginTime': '明细开始日期',
      'currency': '',
      'detailType': '明细类型',
      'email': '电子邮箱',
      'endTime': '明细结束日期',
      'fileType': '获取方式',
      'maxAmount': '',
      'minAmount': '',
      'oppositeAccount': '',
      'oppositeName': '',
      'showType': '',
      'version': ''
    };
  }
}
