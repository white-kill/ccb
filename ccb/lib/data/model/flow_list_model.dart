import 'package:ccb/data/model/flow_deatil_model.dart';
import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/flow_list_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/flow_list_model.g.dart';

@JsonSerializable()
class FlowListModel {
	List<FlowListList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';

	FlowListModel();

	factory FlowListModel.fromJson(Map<String, dynamic> json) => $FlowListModelFromJson(json);

	Map<String, dynamic> toJson() => $FlowListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FlowListList {
	String id = '';
	String bankCard = '';
	String busType = '';
	String status = '';
	String method = '';
	String code = '';
	String createTime = '';
	FlowDeatilModel? detail;
	String type = '';
	List<String> fileUrlList = [];

	FlowListList();

	factory FlowListList.fromJson(Map<String, dynamic> json) => $FlowListListFromJson(json);

	Map<String, dynamic> toJson() => $FlowListListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}