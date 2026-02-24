import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/member_info_entity.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/member_info_entity.g.dart';

@JsonSerializable()
class MemberInfoModel {
	int? id = 0;
	String bankId = '';
	String realName = '';
	double accountBalance = 0;
	String appAccount = '';
	String idCard = '';
	String chapterCode = '';
	String sex = '';
	String city = '';
	String phone = '';
	String account = '';
	String serialNumber = '';
	String certificateBeginTime = '';
	String certificateEndTime = '';
	String loginTime = '';
	String payStatus = '';
	List<MemberInfoBankList> bankList = [];
	String starRating = '';
	String points = '';
	String couponsNum = '';
	String credit = '';
	double incomeTotal = 0;
	double expensesTotal = 0;

	MemberInfoModel();

	factory MemberInfoModel.fromJson(Map<String, dynamic> json) => $MemberInfoModelFromJson(json);

	Map<String, dynamic> toJson() => $MemberInfoModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MemberInfoBankList {
	String bankCard = '';
	String realName = '';
	double accountBalance = 0;
	String bankName = '';
	String openOutlets = '';
	String openTime = '';
	String cardType = '';
	String starRating = '';
	String branchBelongs = '';

	MemberInfoBankList();

	factory MemberInfoBankList.fromJson(Map<String, dynamic> json) => $MemberInfoBankListFromJson(json);

	Map<String, dynamic> toJson() => $MemberInfoBankListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}