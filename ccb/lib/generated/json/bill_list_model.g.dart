import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/bill_list_model.dart';
import 'package:ccb/data/model/bill_info_model.dart';


BillListModel $BillListModelFromJson(Map<String, dynamic> json) {
  final BillListModel billListModel = BillListModel();
  final List<BillListList>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BillListList>(e) as BillListList).toList();
  if (list != null) {
    billListModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    billListModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    billListModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    billListModel.expensesTotal = expensesTotal;
  }
  return billListModel;
}

Map<String, dynamic> $BillListModelToJson(BillListModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  return data;
}

extension BillListModelExtension on BillListModel {
  BillListModel copyWith({
    List<BillListList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
  }) {
    return BillListModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal;
  }
}

BillListList $BillListListFromJson(Map<String, dynamic> json) {
  final BillListList billListList = BillListList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    billListList.id = id;
  }
  final int? memberId = jsonConvert.convert<int>(json['memberId']);
  if (memberId != null) {
    billListList.memberId = memberId;
  }
  final int? bankId = jsonConvert.convert<int>(json['bankId']);
  if (bankId != null) {
    billListList.bankId = bankId;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    billListList.bankCard = bankCard;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    billListList.excerpt = excerpt;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    billListList.amount = amount;
  }
  final String? accountBalance = jsonConvert.convert<String>(
      json['accountBalance']);
  if (accountBalance != null) {
    billListList.accountBalance = accountBalance;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    billListList.transactionTime = transactionTime;
  }
  final String? accountsTime = jsonConvert.convert<String>(
      json['accountsTime']);
  if (accountsTime != null) {
    billListList.accountsTime = accountsTime;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    billListList.oppositeAccount = oppositeAccount;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    billListList.merchantBranch = merchantBranch;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    billListList.oppositeName = oppositeName;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    billListList.createTime = createTime;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    billListList.updateTime = updateTime;
  }
  final String? createBy = jsonConvert.convert<String>(json['createBy']);
  if (createBy != null) {
    billListList.createBy = createBy;
  }
  final String? updateBy = jsonConvert.convert<String>(json['updateBy']);
  if (updateBy != null) {
    billListList.updateBy = updateBy;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    billListList.type = type;
  }
  final String? postscript = jsonConvert.convert<String>(json['postscript']);
  if (postscript != null) {
    billListList.postscript = postscript;
  }
  final String? otherBank = jsonConvert.convert<String>(json['otherBank']);
  if (otherBank != null) {
    billListList.otherBank = otherBank;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    billListList.day = day;
  }
  final BillInfoModel? billDetail = jsonConvert.convert<BillInfoModel>(
      json['billDetail']);
  if (billDetail != null) {
    billListList.billDetail = billDetail;
  }
  return billListList;
}

Map<String, dynamic> $BillListListToJson(BillListList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['memberId'] = entity.memberId;
  data['bankId'] = entity.bankId;
  data['bankCard'] = entity.bankCard;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['transactionTime'] = entity.transactionTime;
  data['accountsTime'] = entity.accountsTime;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['merchantBranch'] = entity.merchantBranch;
  data['oppositeName'] = entity.oppositeName;
  data['createTime'] = entity.createTime;
  data['updateTime'] = entity.updateTime;
  data['createBy'] = entity.createBy;
  data['updateBy'] = entity.updateBy;
  data['type'] = entity.type;
  data['postscript'] = entity.postscript;
  data['otherBank'] = entity.otherBank;
  data['day'] = entity.day;
  data['billDetail'] = entity.billDetail?.toJson();
  return data;
}

extension BillListListExtension on BillListList {
  BillListList copyWith({
    int? id,
    int? memberId,
    int? bankId,
    String? bankCard,
    String? excerpt,
    String? amount,
    String? accountBalance,
    String? transactionTime,
    String? accountsTime,
    String? oppositeAccount,
    String? merchantBranch,
    String? oppositeName,
    String? createTime,
    String? updateTime,
    String? createBy,
    String? updateBy,
    String? type,
    String? postscript,
    String? otherBank,
    String? day,
    BillInfoModel? billDetail,
  }) {
    return BillListList()
      ..id = id ?? this.id
      ..memberId = memberId ?? this.memberId
      ..bankId = bankId ?? this.bankId
      ..bankCard = bankCard ?? this.bankCard
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..transactionTime = transactionTime ?? this.transactionTime
      ..accountsTime = accountsTime ?? this.accountsTime
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..oppositeName = oppositeName ?? this.oppositeName
      ..createTime = createTime ?? this.createTime
      ..updateTime = updateTime ?? this.updateTime
      ..createBy = createBy ?? this.createBy
      ..updateBy = updateBy ?? this.updateBy
      ..type = type ?? this.type
      ..postscript = postscript ?? this.postscript
      ..otherBank = otherBank ?? this.otherBank
      ..day = day ?? this.day
      ..billDetail = billDetail ?? this.billDetail;
  }
}