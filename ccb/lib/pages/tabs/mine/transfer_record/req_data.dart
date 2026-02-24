class ReqData {
  ReqData({
      this.pageSize = 20,
      this.pageNum = 1,
      this.beginTime = '',
      this.endTime = '',
      this.minAmount = '',
      this.maxAmount = '',
      this.accountType = '',
      this.transactionChannel = '',
      this.oppositeAccount = '',
      this.keyword = '',
      this.dateType = '',});

  ReqData.fromJson(Map<String, dynamic>  json) {
    pageSize = json['pageSize'];
    pageNum = json['pageNum'];
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    minAmount = json['minAmount'];
    maxAmount = json['maxAmount'];
    accountType = json['accountType'];
    transactionChannel = json['transactionChannel'];
    oppositeAccount = json['oppositeAccount'];
    keyword = json['keyword'];
    dateType = json['dateType'];
  }
  ///收款账户类型 全部 建行账户  他行账户 信用卡 手机号
  String accountType = '';

  ///开始时间
  String beginTime = '';

  ///时间类型 (传中文)当天 七天  一个月  近3个月  近6个月
  String dateType = '';

  ///结束时间
  String endTime = '';

  ///关键词搜索
  String keyword = '';

  ///最小交易金额
  String maxAmount = '';

  ///最大交易金额
  String minAmount = '';

  ///对方账号（查看单人转账信息的时候必填）
  String oppositeAccount = '';

  ///页码
  int pageNum = 1;

  ///页大小
  int pageSize = 10;

  ///交易渠道 全部  手机银行 个人网银
  String transactionChannel = '';


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageSize'] = pageSize;
    map['pageNum'] = pageNum;
    map['beginTime'] = beginTime;
    map['endTime'] = endTime;
    map['minAmount'] = minAmount;
    map['maxAmount'] = maxAmount;
    map['accountType'] = accountType;
    map['transactionChannel'] = transactionChannel;
    map['oppositeAccount'] = oppositeAccount;
    map['keyword'] = keyword;
    map['dateType'] = dateType;
    return map;
  }

}