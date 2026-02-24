import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/transfer_record_model.dart';
import 'package:ccb/data/model/transfer_info_model.dart';


TransferRecordModel $TransferRecordModelFromJson(Map<String, dynamic> json) {
  final TransferRecordModel transferRecordModel = TransferRecordModel();
  final List<TransferRecordList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<TransferRecordList>(e) as TransferRecordList)
      .toList();
  if (list != null) {
    transferRecordModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    transferRecordModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    transferRecordModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    transferRecordModel.expensesTotal = expensesTotal;
  }
  return transferRecordModel;
}

Map<String, dynamic> $TransferRecordModelToJson(TransferRecordModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  return data;
}

extension TransferRecordModelExtension on TransferRecordModel {
  TransferRecordModel copyWith({
    List<TransferRecordList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
  }) {
    return TransferRecordModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal;
  }
}

TransferRecordList $TransferRecordListFromJson(Map<String, dynamic> json) {
  final TransferRecordList transferRecordList = TransferRecordList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    transferRecordList.id = id;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    transferRecordList.amount = amount;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    transferRecordList.transactionTime = transactionTime;
  }
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    transferRecordList.dateTime = dateTime;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    transferRecordList.oppositeName = oppositeName;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    transferRecordList.oppositeAccount = oppositeAccount;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    transferRecordList.icon = icon;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    transferRecordList.currency = currency;
  }
  final TransferInfoModel? detail = jsonConvert.convert<TransferInfoModel>(
      json['detail']);
  if (detail != null) {
    transferRecordList.detail = detail;
  }
  return transferRecordList;
}

Map<String, dynamic> $TransferRecordListToJson(TransferRecordList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['amount'] = entity.amount;
  data['transactionTime'] = entity.transactionTime;
  data['dateTime'] = entity.dateTime;
  data['oppositeName'] = entity.oppositeName;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['icon'] = entity.icon;
  data['currency'] = entity.currency;
  data['detail'] = entity.detail?.toJson();
  return data;
}

extension TransferRecordListExtension on TransferRecordList {
  TransferRecordList copyWith({
    String? id,
    double? amount,
    String? transactionTime,
    String? dateTime,
    String? oppositeName,
    String? oppositeAccount,
    String? icon,
    String? currency,
    TransferInfoModel? detail,
  }) {
    return TransferRecordList()
      ..id = id ?? this.id
      ..amount = amount ?? this.amount
      ..transactionTime = transactionTime ?? this.transactionTime
      ..dateTime = dateTime ?? this.dateTime
      ..oppositeName = oppositeName ?? this.oppositeName
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..icon = icon ?? this.icon
      ..currency = currency ?? this.currency
      ..detail = detail ?? this.detail;
  }
}