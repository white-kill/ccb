import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/account_view_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/account_view_model.g.dart';

@JsonSerializable()
class AccountViewModel {
	double balance = 0;
	String currentAmount = '';
	String holdingsAmount = '';
	String digitAmount = '';
	List<AccountViewChartList> chartList = [];
	String beginTime = '';
	String endTime = '';

	AccountViewModel();

	factory AccountViewModel.fromJson(Map<String, dynamic> json) => $AccountViewModelFromJson(json);

	Map<String, dynamic> toJson() => $AccountViewModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccountViewChartList {
	double balance = 0;
	String datetime = '';

	AccountViewChartList();

	factory AccountViewChartList.fromJson(Map<String, dynamic> json) => $AccountViewChartListFromJson(json);

	Map<String, dynamic> toJson() => $AccountViewChartListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}