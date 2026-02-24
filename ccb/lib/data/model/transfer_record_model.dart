import 'package:ccb/data/model/transfer_info_model.dart';
import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/transfer_record_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/transfer_record_model.g.dart';

@JsonSerializable()
class TransferRecordModel {
	List<TransferRecordList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';

	TransferRecordModel();

	factory TransferRecordModel.fromJson(Map<String, dynamic> json) => $TransferRecordModelFromJson(json);

	Map<String, dynamic> toJson() => $TransferRecordModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TransferRecordList {
	String id = '';
	double amount = 0;
	String transactionTime = '';
	String dateTime = '';
	String oppositeName = '';
	String oppositeAccount = '';
	String icon = '';
	String currency = '';
	TransferInfoModel? detail;

	TransferRecordList();

	factory TransferRecordList.fromJson(Map<String, dynamic> json) => $TransferRecordListFromJson(json);

	Map<String, dynamic> toJson() => $TransferRecordListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}