import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/contacts_list_model.dart';

ContactsListModel $ContactsListModelFromJson(Map<String, dynamic> json) {
  final ContactsListModel contactsListModel = ContactsListModel();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    contactsListModel.name = name;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    contactsListModel.bankName = bankName;
  }
  final String? bankId = jsonConvert.convert<String>(json['bankId']);
  if (bankId != null) {
    contactsListModel.bankId = bankId;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    contactsListModel.bankCard = bankCard;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    contactsListModel.icon = icon;
  }
  return contactsListModel;
}

Map<String, dynamic> $ContactsListModelToJson(ContactsListModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['bankName'] = entity.bankName;
  data['bankId'] = entity.bankId;
  data['bankCard'] = entity.bankCard;
  data['icon'] = entity.icon;
  return data;
}

extension ContactsListModelExtension on ContactsListModel {
  ContactsListModel copyWith({
    String? name,
    String? bankName,
    String? bankId,
    String? bankCard,
    String? icon,
  }) {
    return ContactsListModel()
      ..name = name ?? this.name
      ..bankName = bankName ?? this.bankName
      ..bankId = bankId ?? this.bankId
      ..bankCard = bankCard ?? this.bankCard
      ..icon = icon ?? this.icon;
  }
}