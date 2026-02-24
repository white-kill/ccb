import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/bank_data_model.dart';

BankDataModel $BankDataModelFromJson(Map<String, dynamic> json) {
  final BankDataModel bankDataModel = BankDataModel();
  final List<BankDataBankList>? bankList = (json['bankList'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<BankDataBankList>(e) as BankDataBankList)
      .toList();
  if (bankList != null) {
    bankDataModel.bankList = bankList;
  }
  final List<BankDataHotList>? hotList = (json['hotList'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<BankDataHotList>(e) as BankDataHotList)
      .toList();
  if (hotList != null) {
    bankDataModel.hotList = hotList;
  }
  return bankDataModel;
}

Map<String, dynamic> $BankDataModelToJson(BankDataModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bankList'] = entity.bankList?.map((v) => v.toJson()).toList();
  data['hotList'] = entity.hotList?.map((v) => v.toJson()).toList();
  return data;
}

extension BankDataModelExtension on BankDataModel {
  BankDataModel copyWith({
    List<BankDataBankList>? bankList,
    List<BankDataHotList>? hotList,
  }) {
    return BankDataModel()
      ..bankList = bankList ?? this.bankList
      ..hotList = hotList ?? this.hotList;
  }
}

BankDataBankList $BankDataBankListFromJson(Map<String, dynamic> json) {
  final BankDataBankList bankDataBankList = BankDataBankList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bankDataBankList.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bankDataBankList.name = name;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    bankDataBankList.icon = icon;
  }
  final int? hot = jsonConvert.convert<int>(json['hot']);
  if (hot != null) {
    bankDataBankList.hot = hot;
  }
  return bankDataBankList;
}

Map<String, dynamic> $BankDataBankListToJson(BankDataBankList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['icon'] = entity.icon;
  data['hot'] = entity.hot;
  return data;
}

extension BankDataBankListExtension on BankDataBankList {
  BankDataBankList copyWith({
    int? id,
    String? name,
    String? icon,
    int? hot,
  }) {
    return BankDataBankList()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..icon = icon ?? this.icon
      ..hot = hot ?? this.hot;
  }
}

BankDataHotList $BankDataHotListFromJson(Map<String, dynamic> json) {
  final BankDataHotList bankDataHotList = BankDataHotList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bankDataHotList.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bankDataHotList.name = name;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    bankDataHotList.icon = icon;
  }
  final int? hot = jsonConvert.convert<int>(json['hot']);
  if (hot != null) {
    bankDataHotList.hot = hot;
  }
  return bankDataHotList;
}

Map<String, dynamic> $BankDataHotListToJson(BankDataHotList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['icon'] = entity.icon;
  data['hot'] = entity.hot;
  return data;
}

extension BankDataHotListExtension on BankDataHotList {
  BankDataHotList copyWith({
    int? id,
    String? name,
    String? icon,
    int? hot,
  }) {
    return BankDataHotList()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..icon = icon ?? this.icon
      ..hot = hot ?? this.hot;
  }
}