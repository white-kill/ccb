import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/contacts_list_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/contacts_list_model.g.dart';

@JsonSerializable()
class ContactsListModel {
	String name = '';
	String bankName = '';
	String bankId = '';
	String bankCard = '';
	String icon = '';

	ContactsListModel();

	factory ContactsListModel.fromJson(Map<String, dynamic> json) => $ContactsListModelFromJson(json);

	Map<String, dynamic> toJson() => $ContactsListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}