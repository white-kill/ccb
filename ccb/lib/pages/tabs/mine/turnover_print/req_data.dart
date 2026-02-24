// To parse this JSON data, do
//
//     final transferData = transferDataFromJson(jsonString);

import 'dart:convert';

PrintData printDataFromJson(String str) => PrintData.fromJson(json.decode(str));

String printDataToJson(PrintData data) => json.encode(data.toJson());

class PrintData {

  ///币种
  String currency;

  ///明细类型
  String detailType;

  ///开始时段
  String beginTime;

  ///邮箱
  String email;

  ///结束查询
  String endTime;

  ///文件类型
  String fileType;

  ///最大交易金额
  String maxAmount;

  ///最小交易金额
  String minAmount;

  ///对方账户
  String oppositeAccount;

  ///对方户名
  String oppositeName;

  ///交易信息显示，（多个逗号分割） 0完整展示对方账号 1完整显示对方户名 2暂时交易地点/附言 3完整显示申请人账号 4完整显示申请人户名
  String showType;
  String version;

  PrintData({
    this.currency = '',
    this.detailType = '',
    this.beginTime = '',
    this.email = '',
    this.endTime = '',
    this.fileType = '',
    this.maxAmount = '',
    this.minAmount = '',
    this.oppositeAccount = '',
    this.oppositeName = '',
    this.showType = '',
    this.version = '',
  });

  factory PrintData.fromJson(Map<String, dynamic> json) => PrintData(
    beginTime: json["beginTime"],
    currency: json["currency"],
    detailType: json["detailType"],
    email: json["email"],
    endTime: json["endTime"],
    fileType: json["fileType"],
    maxAmount: json["maxAmount"],
    minAmount: json["minAmount"],
    oppositeAccount: json["oppositeAccount"],
    oppositeName: json["oppositeName"],
    showType: json["showType"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "detailType": detailType,
    "beginTime": beginTime,
    "endTime": endTime,
    "minAmount": minAmount,
    "maxAmount": maxAmount,
    "oppositeAccount": oppositeAccount,
    "oppositeName": oppositeName,
    "email": email,
    "fileType": fileType,
    "showType": showType,
    "version": version,
  };
}