import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/bill_info_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/bill_info_model.g.dart';

@JsonSerializable()
class BillInfoModel {
	String id = '';
	String bankName = '';
	String bankCard = '';
	String account = '';
	String excerpt = '';
	double amount = 0;
	double accountBalance = 0;
	String transactionTime = '';
	String oppositeAccount = '';
	String accountsTime = '';
	String merchantBranch = '';
	String oppositeName = '';
	String type = '';

	BillInfoModel();

	factory BillInfoModel.fromJson(Map<String, dynamic> json) => $BillInfoModelFromJson(json);

	Map<String, dynamic> toJson() => $BillInfoModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}