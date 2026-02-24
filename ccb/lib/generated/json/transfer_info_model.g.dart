import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/transfer_info_model.dart';

TransferInfoModel $TransferInfoModelFromJson(Map<String, dynamic> json) {
  final TransferInfoModel transferInfoModel = TransferInfoModel();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    transferInfoModel.id = id;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    transferInfoModel.amount = amount;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    transferInfoModel.transactionTime = transactionTime;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    transferInfoModel.bankCard = bankCard;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    transferInfoModel.bankName = bankName;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    transferInfoModel.oppositeName = oppositeName;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    transferInfoModel.oppositeAccount = oppositeAccount;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    transferInfoModel.icon = icon;
  }
  final String? transactionType = jsonConvert.convert<String>(
      json['transactionType']);
  if (transactionType != null) {
    transferInfoModel.transactionType = transactionType;
  }
  final String? transactionChannel = jsonConvert.convert<String>(
      json['transactionChannel']);
  if (transactionChannel != null) {
    transferInfoModel.transactionChannel = transactionChannel;
  }
  final String? certificateNo = jsonConvert.convert<String>(
      json['certificateNo']);
  if (certificateNo != null) {
    transferInfoModel.certificateNo = certificateNo;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    transferInfoModel.merchantBranch = merchantBranch;
  }
  return transferInfoModel;
}

Map<String, dynamic> $TransferInfoModelToJson(TransferInfoModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['amount'] = entity.amount;
  data['transactionTime'] = entity.transactionTime;
  data['bankCard'] = entity.bankCard;
  data['bankName'] = entity.bankName;
  data['oppositeName'] = entity.oppositeName;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['icon'] = entity.icon;
  data['transactionType'] = entity.transactionType;
  data['transactionChannel'] = entity.transactionChannel;
  data['certificateNo'] = entity.certificateNo;
  data['merchantBranch'] = entity.merchantBranch;
  return data;
}

extension TransferInfoModelExtension on TransferInfoModel {
  TransferInfoModel copyWith({
    String? id,
    double? amount,
    String? transactionTime,
    String? bankCard,
    String? bankName,
    String? oppositeName,
    String? oppositeAccount,
    String? icon,
    String? transactionType,
    String? transactionChannel,
    String? certificateNo,
    String? merchantBranch,
  }) {
    return TransferInfoModel()
      ..id = id ?? this.id
      ..amount = amount ?? this.amount
      ..transactionTime = transactionTime ?? this.transactionTime
      ..bankCard = bankCard ?? this.bankCard
      ..bankName = bankName ?? this.bankName
      ..oppositeName = oppositeName ?? this.oppositeName
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..icon = icon ?? this.icon
      ..transactionType = transactionType ?? this.transactionType
      ..transactionChannel = transactionChannel ?? this.transactionChannel
      ..certificateNo = certificateNo ?? this.certificateNo
      ..merchantBranch = merchantBranch ?? this.merchantBranch;
  }
}