import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/flow_deatil_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/flow_deatil_model.g.dart';

@JsonSerializable()
class FlowDeatilModel {
	int id = 0;
	String bankCard = '';
	String busType = '';
	String status = '';
	String channel = '';
	String currency = '';
	String detailType = '';
	String beginTime = '';
	String endTime = '';
	String amountRange = '';
	String method = '';
	String email = '';
	String code = '';
	String createTime = '';

	FlowDeatilModel();

	factory FlowDeatilModel.fromJson(Map<String, dynamic> json) => $FlowDeatilModelFromJson(json);

	Map<String, dynamic> toJson() => $FlowDeatilModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}