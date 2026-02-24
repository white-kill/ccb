import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/flow_list_model.dart';
import 'package:ccb/data/model/flow_deatil_model.dart';


FlowListModel $FlowListModelFromJson(Map<String, dynamic> json) {
  final FlowListModel flowListModel = FlowListModel();
  final List<FlowListList>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<FlowListList>(e) as FlowListList).toList();
  if (list != null) {
    flowListModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    flowListModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    flowListModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    flowListModel.expensesTotal = expensesTotal;
  }
  return flowListModel;
}

Map<String, dynamic> $FlowListModelToJson(FlowListModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  return data;
}

extension FlowListModelExtension on FlowListModel {
  FlowListModel copyWith({
    List<FlowListList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
  }) {
    return FlowListModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal;
  }
}

FlowListList $FlowListListFromJson(Map<String, dynamic> json) {
  final FlowListList flowListList = FlowListList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    flowListList.id = id;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    flowListList.bankCard = bankCard;
  }
  final String? busType = jsonConvert.convert<String>(json['busType']);
  if (busType != null) {
    flowListList.busType = busType;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    flowListList.status = status;
  }
  final String? method = jsonConvert.convert<String>(json['method']);
  if (method != null) {
    flowListList.method = method;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    flowListList.code = code;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    flowListList.createTime = createTime;
  }
  final FlowDeatilModel? detail = jsonConvert.convert<FlowDeatilModel>(
      json['detail']);
  if (detail != null) {
    flowListList.detail = detail;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    flowListList.type = type;
  }
  final List<String>? fileUrlList = (json['fileUrlList'] as List<dynamic>?)
      ?.map((e) => e.toString()).toList();
  if (fileUrlList != null) {
    flowListList.fileUrlList = fileUrlList;
  }
  return flowListList;
}

Map<String, dynamic> $FlowListListToJson(FlowListList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankCard'] = entity.bankCard;
  data['busType'] = entity.busType;
  data['status'] = entity.status;
  data['method'] = entity.method;
  data['code'] = entity.code;
  data['createTime'] = entity.createTime;
  data['detail'] = entity.detail?.toJson();
  data['type'] = entity.type;
  data['fileUrlList'] = entity.fileUrlList;
  return data;
}

extension FlowListListExtension on FlowListList {
  FlowListList copyWith({
    String? id,
    String? bankCard,
    String? busType,
    String? status,
    String? method,
    String? code,
    String? createTime,
    FlowDeatilModel? detail,
    String? type,
    List<String>? fileUrlList,
  }) {
    return FlowListList()
      ..id = id ?? this.id
      ..bankCard = bankCard ?? this.bankCard
      ..busType = busType ?? this.busType
      ..status = status ?? this.status
      ..method = method ?? this.method
      ..code = code ?? this.code
      ..createTime = createTime ?? this.createTime
      ..detail = detail ?? this.detail
      ..type = type ?? this.type
      ..fileUrlList = fileUrlList ?? this.fileUrlList;
  }
}