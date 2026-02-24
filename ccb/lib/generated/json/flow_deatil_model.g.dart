import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/flow_deatil_model.dart';

FlowDeatilModel $FlowDeatilModelFromJson(Map<String, dynamic> json) {
  final FlowDeatilModel flowDeatilModel = FlowDeatilModel();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    flowDeatilModel.id = id;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    flowDeatilModel.bankCard = bankCard;
  }
  final String? busType = jsonConvert.convert<String>(json['busType']);
  if (busType != null) {
    flowDeatilModel.busType = busType;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    flowDeatilModel.status = status;
  }
  final String? channel = jsonConvert.convert<String>(json['channel']);
  if (channel != null) {
    flowDeatilModel.channel = channel;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    flowDeatilModel.currency = currency;
  }
  final String? detailType = jsonConvert.convert<String>(json['detailType']);
  if (detailType != null) {
    flowDeatilModel.detailType = detailType;
  }
  final String? beginTime = jsonConvert.convert<String>(json['beginTime']);
  if (beginTime != null) {
    flowDeatilModel.beginTime = beginTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    flowDeatilModel.endTime = endTime;
  }
  final String? amountRange = jsonConvert.convert<String>(json['amountRange']);
  if (amountRange != null) {
    flowDeatilModel.amountRange = amountRange;
  }
  final String? method = jsonConvert.convert<String>(json['method']);
  if (method != null) {
    flowDeatilModel.method = method;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    flowDeatilModel.email = email;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    flowDeatilModel.code = code;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    flowDeatilModel.createTime = createTime;
  }
  return flowDeatilModel;
}

Map<String, dynamic> $FlowDeatilModelToJson(FlowDeatilModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankCard'] = entity.bankCard;
  data['busType'] = entity.busType;
  data['status'] = entity.status;
  data['channel'] = entity.channel;
  data['currency'] = entity.currency;
  data['detailType'] = entity.detailType;
  data['beginTime'] = entity.beginTime;
  data['endTime'] = entity.endTime;
  data['amountRange'] = entity.amountRange;
  data['method'] = entity.method;
  data['email'] = entity.email;
  data['code'] = entity.code;
  data['createTime'] = entity.createTime;
  return data;
}

extension FlowDeatilModelExtension on FlowDeatilModel {
  FlowDeatilModel copyWith({
    int? id,
    String? bankCard,
    String? busType,
    String? status,
    String? channel,
    String? currency,
    String? detailType,
    String? beginTime,
    String? endTime,
    String? amountRange,
    String? method,
    String? email,
    String? code,
    String? createTime,
  }) {
    return FlowDeatilModel()
      ..id = id ?? this.id
      ..bankCard = bankCard ?? this.bankCard
      ..busType = busType ?? this.busType
      ..status = status ?? this.status
      ..channel = channel ?? this.channel
      ..currency = currency ?? this.currency
      ..detailType = detailType ?? this.detailType
      ..beginTime = beginTime ?? this.beginTime
      ..endTime = endTime ?? this.endTime
      ..amountRange = amountRange ?? this.amountRange
      ..method = method ?? this.method
      ..email = email ?? this.email
      ..code = code ?? this.code
      ..createTime = createTime ?? this.createTime;
  }
}