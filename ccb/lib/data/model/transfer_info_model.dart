import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/transfer_info_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/transfer_info_model.g.dart';

@JsonSerializable()
class TransferInfoModel {
	String id = '';
	double amount = 0;
	String transactionTime = '';
	String bankCard = '';
	String bankName = '';
	String oppositeName = '';
	String oppositeAccount = '';
	String icon = '';
	String transactionType = '';
	String transactionChannel = '';
	String certificateNo = '';
	String merchantBranch = '';

	TransferInfoModel();

	factory TransferInfoModel.fromJson(Map<String, dynamic> json) => $TransferInfoModelFromJson(json);

	Map<String, dynamic> toJson() => $TransferInfoModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}