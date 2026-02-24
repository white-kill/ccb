import 'package:ccb/data/model/bill_info_model.dart';
import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/bill_list_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/bill_list_model.g.dart';

@JsonSerializable()
class BillListModel {
	List<BillListList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';

	BillListModel();

	factory BillListModel.fromJson(Map<String, dynamic> json) => $BillListModelFromJson(json);

	Map<String, dynamic> toJson() => $BillListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BillListList {
	int id = 0;
	int memberId = 0;
	int bankId = 0;
	String bankCard = '';
	String excerpt = '';
	String amount = '';
	String accountBalance = '';
	String transactionTime = '';
	String accountsTime = '';
	String oppositeAccount = '';
	String merchantBranch = '';
	String oppositeName = '';
	String createTime = '';
	String updateTime = '';
	String createBy = '';
	String updateBy = '';
	String type = '';
	String postscript = '';
	String otherBank = '';
	String day = '';
	BillInfoModel? billDetail;

	BillListList();

	factory BillListList.fromJson(Map<String, dynamic> json) => $BillListListFromJson(json);

	Map<String, dynamic> toJson() => $BillListListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}