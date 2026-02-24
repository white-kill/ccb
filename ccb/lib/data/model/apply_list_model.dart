import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/apply_list_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/apply_list_model.g.dart';

@JsonSerializable()
class ApplyListModel {
	List<ApplyListList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';

	ApplyListModel();

	factory ApplyListModel.fromJson(Map<String, dynamic> json) => $ApplyListModelFromJson(json);

	Map<String, dynamic> toJson() => $ApplyListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ApplyListList {
	String id = '';
	String bankCard = '';
	String email = '';
	String dateTimeRange = '';
	String status = '';
	String detailType = '';
	String code = '';
	String createTime = '';

	ApplyListList();

	factory ApplyListList.fromJson(Map<String, dynamic> json) => $ApplyListListFromJson(json);

	Map<String, dynamic> toJson() => $ApplyListListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}