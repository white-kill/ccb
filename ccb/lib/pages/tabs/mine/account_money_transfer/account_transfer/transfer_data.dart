// To parse this JSON data, do
//
//     final apifoxModel = apifoxModelFromJson(jsonString);

import 'dart:convert';

TransferData transferDataFromJson(String str) => TransferData.fromJson(json.decode(str));

String transferDataToJson(TransferData data) => json.encode(data.toJson());

class TransferData {

  ///转账金额
  String amount;

  ///银行id
  String bankId;

  ///银行名称
  String? bankName;

  ///卡号
  String cardNo;

  ///转账用途
  String purpose;

  ///真实姓名
  String realName;

  TransferData({
    this.amount = '',
    this.bankId = '',
    this.bankName = '',
    this.cardNo = '',
    this.purpose = '',
    this.realName = '',
  });

  factory TransferData.fromJson(Map<String, dynamic> json) => TransferData(
    amount: json["amount"],
    bankId: json["bankId"],
    bankName: json["bankName"],
    cardNo: json["cardNo"],
    purpose: json["purpose"],
    realName: json["realName"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "bankId": bankId,
    "bankName": bankName,
    "cardNo": cardNo,
    "purpose": purpose,
    "realName": realName,
  };
}