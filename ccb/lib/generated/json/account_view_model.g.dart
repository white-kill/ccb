import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/account_view_model.dart';

AccountViewModel $AccountViewModelFromJson(Map<String, dynamic> json) {
  final AccountViewModel accountViewModel = AccountViewModel();
  final double? balance = jsonConvert.convert<double>(json['balance']);
  if (balance != null) {
    accountViewModel.balance = balance;
  }
  final String? currentAmount = jsonConvert.convert<String>(
      json['currentAmount']);
  if (currentAmount != null) {
    accountViewModel.currentAmount = currentAmount;
  }
  final String? holdingsAmount = jsonConvert.convert<String>(
      json['holdingsAmount']);
  if (holdingsAmount != null) {
    accountViewModel.holdingsAmount = holdingsAmount;
  }
  final String? digitAmount = jsonConvert.convert<String>(json['digitAmount']);
  if (digitAmount != null) {
    accountViewModel.digitAmount = digitAmount;
  }
  final List<AccountViewChartList>? chartList = (json['chartList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<AccountViewChartList>(e) as AccountViewChartList)
      .toList();
  if (chartList != null) {
    accountViewModel.chartList = chartList;
  }
  final String? beginTime = jsonConvert.convert<String>(json['beginTime']);
  if (beginTime != null) {
    accountViewModel.beginTime = beginTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    accountViewModel.endTime = endTime;
  }
  return accountViewModel;
}

Map<String, dynamic> $AccountViewModelToJson(AccountViewModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['balance'] = entity.balance;
  data['currentAmount'] = entity.currentAmount;
  data['holdingsAmount'] = entity.holdingsAmount;
  data['digitAmount'] = entity.digitAmount;
  data['chartList'] = entity.chartList.map((v) => v.toJson()).toList();
  data['beginTime'] = entity.beginTime;
  data['endTime'] = entity.endTime;
  return data;
}

extension AccountViewModelExtension on AccountViewModel {
  AccountViewModel copyWith({
    double? balance,
    String? currentAmount,
    String? holdingsAmount,
    String? digitAmount,
    List<AccountViewChartList>? chartList,
    String? beginTime,
    String? endTime,
  }) {
    return AccountViewModel()
      ..balance = balance ?? this.balance
      ..currentAmount = currentAmount ?? this.currentAmount
      ..holdingsAmount = holdingsAmount ?? this.holdingsAmount
      ..digitAmount = digitAmount ?? this.digitAmount
      ..chartList = chartList ?? this.chartList
      ..beginTime = beginTime ?? this.beginTime
      ..endTime = endTime ?? this.endTime;
  }
}

AccountViewChartList $AccountViewChartListFromJson(Map<String, dynamic> json) {
  final AccountViewChartList accountViewChartList = AccountViewChartList();
  final double? balance = jsonConvert.convert<double>(json['balance']);
  if (balance != null) {
    accountViewChartList.balance = balance;
  }
  final String? datetime = jsonConvert.convert<String>(json['datetime']);
  if (datetime != null) {
    accountViewChartList.datetime = datetime;
  }
  return accountViewChartList;
}

Map<String, dynamic> $AccountViewChartListToJson(AccountViewChartList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['balance'] = entity.balance;
  data['datetime'] = entity.datetime;
  return data;
}

extension AccountViewChartListExtension on AccountViewChartList {
  AccountViewChartList copyWith({
    double? balance,
    String? datetime,
  }) {
    return AccountViewChartList()
      ..balance = balance ?? this.balance
      ..datetime = datetime ?? this.datetime;
  }
}