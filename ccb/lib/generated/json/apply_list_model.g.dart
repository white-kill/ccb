import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/apply_list_model.dart';

ApplyListModel $ApplyListModelFromJson(Map<String, dynamic> json) {
  final ApplyListModel applyListModel = ApplyListModel();
  final List<ApplyListList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ApplyListList>(e) as ApplyListList)
      .toList();
  if (list != null) {
    applyListModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    applyListModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    applyListModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    applyListModel.expensesTotal = expensesTotal;
  }
  return applyListModel;
}

Map<String, dynamic> $ApplyListModelToJson(ApplyListModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  return data;
}

extension ApplyListModelExtension on ApplyListModel {
  ApplyListModel copyWith({
    List<ApplyListList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
  }) {
    return ApplyListModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal;
  }
}

ApplyListList $ApplyListListFromJson(Map<String, dynamic> json) {
  final ApplyListList applyListList = ApplyListList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    applyListList.id = id;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    applyListList.bankCard = bankCard;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    applyListList.email = email;
  }
  final String? dateTimeRange = jsonConvert.convert<String>(
      json['dateTimeRange']);
  if (dateTimeRange != null) {
    applyListList.dateTimeRange = dateTimeRange;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    applyListList.status = status;
  }
  final String? detailType = jsonConvert.convert<String>(json['detailType']);
  if (detailType != null) {
    applyListList.detailType = detailType;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    applyListList.code = code;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    applyListList.createTime = createTime;
  }
  return applyListList;
}

Map<String, dynamic> $ApplyListListToJson(ApplyListList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankCard'] = entity.bankCard;
  data['email'] = entity.email;
  data['dateTimeRange'] = entity.dateTimeRange;
  data['status'] = entity.status;
  data['detailType'] = entity.detailType;
  data['code'] = entity.code;
  data['createTime'] = entity.createTime;
  return data;
}

extension ApplyListListExtension on ApplyListList {
  ApplyListList copyWith({
    String? id,
    String? bankCard,
    String? email,
    String? dateTimeRange,
    String? status,
    String? detailType,
    String? code,
    String? createTime,
  }) {
    return ApplyListList()
      ..id = id ?? this.id
      ..bankCard = bankCard ?? this.bankCard
      ..email = email ?? this.email
      ..dateTimeRange = dateTimeRange ?? this.dateTimeRange
      ..status = status ?? this.status
      ..detailType = detailType ?? this.detailType
      ..code = code ?? this.code
      ..createTime = createTime ?? this.createTime;
  }
}