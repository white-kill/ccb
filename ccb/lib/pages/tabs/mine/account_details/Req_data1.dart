class ReqData1 {
  ReqData1({
    this.pageSize = 20,
    this.pageNum = 1,
    this.beginTime = '',
    this.endTime = '',
    this.minAmount = '',
    this.maxAmount = '',
    this.orderSort = '',
    this.type = '',
    this.transactionType = '',
    this.transactionMethod = '',
    this.keyword = '',
    this.endPageTime = '',
  });

  num pageSize;
  num pageNum;
  String beginTime;
  String endTime;
  String minAmount;
  String maxAmount;

  String orderSort;
  String type;
  String transactionType;
  String transactionMethod;
  String keyword;
  String endPageTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageSize'] = pageSize;
    map['pageNum'] = pageNum;
    map['beginTime'] = beginTime;
    map['endTime'] = endTime;
    map['minAmount'] = minAmount;
    map['maxAmount'] = maxAmount;

    map['orderSort'] = orderSort;
    map['type'] = type;
    map['transactionType'] = transactionType;
    map['transactionMethod'] = transactionMethod;
    map['keyword'] = keyword;
    map['endPageTime'] = endPageTime;
    return map;
  }
}
