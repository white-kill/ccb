import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/bank_data_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/bank_data_model.g.dart';

@JsonSerializable()
class BankDataModel {
	List<BankDataBankList>? bankList = [];
	List<BankDataHotList>? hotList = [];

	BankDataModel();

	factory BankDataModel.fromJson(Map<String, dynamic> json) => $BankDataModelFromJson(json);

	Map<String, dynamic> toJson() => $BankDataModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BankDataBankList {
	int? id = 0;
	String? name = '';
	String? icon = '';
	int? hot = 0;

	BankDataBankList();

	factory BankDataBankList.fromJson(Map<String, dynamic> json) => $BankDataBankListFromJson(json);

	Map<String, dynamic> toJson() => $BankDataBankListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BankDataHotList {
	int? id = 0;
	String? name = '';
	String? icon = '';
	int? hot = 0;

	BankDataHotList();

	factory BankDataHotList.fromJson(Map<String, dynamic> json) => $BankDataHotListFromJson(json);

	Map<String, dynamic> toJson() => $BankDataHotListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}