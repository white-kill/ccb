import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/bill_info_model.dart';

BillInfoModel $BillInfoModelFromJson(Map<String, dynamic> json) {
  final BillInfoModel billInfoModel = BillInfoModel();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    billInfoModel.id = id;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    billInfoModel.bankName = bankName;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    billInfoModel.bankCard = bankCard;
  }
  final String? account = jsonConvert.convert<String>(json['account']);
  if (account != null) {
    billInfoModel.account = account;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    billInfoModel.excerpt = excerpt;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    billInfoModel.amount = amount;
  }
  final double? accountBalance = jsonConvert.convert<double>(
      json['accountBalance']);
  if (accountBalance != null) {
    billInfoModel.accountBalance = accountBalance;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    billInfoModel.transactionTime = transactionTime;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    billInfoModel.oppositeAccount = oppositeAccount;
  }
  final String? oppositeAccount2 = jsonConvert.convert<String>(
      json['oppositeAccount2']);
  if (oppositeAccount2 != null) {
    billInfoModel.oppositeAccount2 = oppositeAccount2;
  }
  final String? accountsTime = jsonConvert.convert<String>(
      json['accountsTime']);
  if (accountsTime != null) {
    billInfoModel.accountsTime = accountsTime;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    billInfoModel.merchantBranch = merchantBranch;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    billInfoModel.oppositeName = oppositeName;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    billInfoModel.type = type;
  }
  return billInfoModel;
}

Map<String, dynamic> $BillInfoModelToJson(BillInfoModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankName'] = entity.bankName;
  data['bankCard'] = entity.bankCard;
  data['account'] = entity.account;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['transactionTime'] = entity.transactionTime;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['oppositeAccount2'] = entity.oppositeAccount2;
  data['accountsTime'] = entity.accountsTime;
  data['merchantBranch'] = entity.merchantBranch;
  data['oppositeName'] = entity.oppositeName;
  data['type'] = entity.type;
  return data;
}

extension BillInfoModelExtension on BillInfoModel {
  BillInfoModel copyWith({
    String? id,
    String? bankName,
    String? bankCard,
    String? account,
    String? excerpt,
    double? amount,
    double? accountBalance,
    String? transactionTime,
    String? oppositeAccount,
    String? oppositeAccount2,
    String? accountsTime,
    String? merchantBranch,
    String? oppositeName,
    String? type,
  }) {
    return BillInfoModel()
      ..id = id ?? this.id
      ..bankName = bankName ?? this.bankName
      ..bankCard = bankCard ?? this.bankCard
      ..account = account ?? this.account
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..transactionTime = transactionTime ?? this.transactionTime
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..oppositeAccount2 = oppositeAccount2 ?? this.oppositeAccount2
      ..accountsTime = accountsTime ?? this.accountsTime
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..oppositeName = oppositeName ?? this.oppositeName
      ..type = type ?? this.type;
  }
}