import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/month_bill_model.dart';

MonthBillModel $MonthBillModelFromJson(Map<String, dynamic> json) {
  final MonthBillModel monthBillModel = MonthBillModel();
  final MonthBillIncome? income = jsonConvert.convert<MonthBillIncome>(
      json['income']);
  if (income != null) {
    monthBillModel.income = income;
  }
  final MonthBillAppUsageRate? appUsageRate = jsonConvert.convert<
      MonthBillAppUsageRate>(json['appUsageRate']);
  if (appUsageRate != null) {
    monthBillModel.appUsageRate = appUsageRate;
  }
  final MonthBillExpenses? expenses = jsonConvert.convert<MonthBillExpenses>(
      json['expenses']);
  if (expenses != null) {
    monthBillModel.expenses = expenses;
  }
  return monthBillModel;
}

Map<String, dynamic> $MonthBillModelToJson(MonthBillModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['income'] = entity.income?.toJson();
  data['appUsageRate'] = entity.appUsageRate?.toJson();
  data['expenses'] = entity.expenses?.toJson();
  return data;
}

extension MonthBillModelExtension on MonthBillModel {
  MonthBillModel copyWith({
    MonthBillIncome? income,
    MonthBillAppUsageRate? appUsageRate,
    MonthBillExpenses? expenses,
  }) {
    return MonthBillModel()
      ..income = income ?? this.income
      ..appUsageRate = appUsageRate ?? this.appUsageRate
      ..expenses = expenses ?? this.expenses;
  }
}

MonthBillIncome $MonthBillIncomeFromJson(Map<String, dynamic> json) {
  final MonthBillIncome monthBillIncome = MonthBillIncome();
  final List<MonthBillIncomeTrend>? trend = (json['trend'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<MonthBillIncomeTrend>(e) as MonthBillIncomeTrend)
      .toList();
  if (trend != null) {
    monthBillIncome.trend = trend;
  }
  final MonthBillIncomeCategory? category = jsonConvert.convert<
      MonthBillIncomeCategory>(json['category']);
  if (category != null) {
    monthBillIncome.category = category;
  }
  return monthBillIncome;
}

Map<String, dynamic> $MonthBillIncomeToJson(MonthBillIncome entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['trend'] = entity.trend?.map((v) => v.toJson()).toList();
  data['category'] = entity.category?.toJson();
  return data;
}

extension MonthBillIncomeExtension on MonthBillIncome {
  MonthBillIncome copyWith({
    List<MonthBillIncomeTrend>? trend,
    MonthBillIncomeCategory? category,
  }) {
    return MonthBillIncome()
      ..trend = trend ?? this.trend
      ..category = category ?? this.category;
  }
}

MonthBillIncomeTrend $MonthBillIncomeTrendFromJson(Map<String, dynamic> json) {
  final MonthBillIncomeTrend monthBillIncomeTrend = MonthBillIncomeTrend();
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillIncomeTrend.amount = amount;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    monthBillIncomeTrend.day = day;
  }
  return monthBillIncomeTrend;
}

Map<String, dynamic> $MonthBillIncomeTrendToJson(MonthBillIncomeTrend entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['day'] = entity.day;
  return data;
}

extension MonthBillIncomeTrendExtension on MonthBillIncomeTrend {
  MonthBillIncomeTrend copyWith({
    double? amount,
    String? day,
  }) {
    return MonthBillIncomeTrend()
      ..amount = amount ?? this.amount
      ..day = day ?? this.day;
  }
}

MonthBillIncomeCategory $MonthBillIncomeCategoryFromJson(
    Map<String, dynamic> json) {
  final MonthBillIncomeCategory monthBillIncomeCategory = MonthBillIncomeCategory();
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    monthBillIncomeCategory.dateTime = dateTime;
  }
  final List<
      MonthBillIncomeCategoryChartList>? chartList = (json['chartList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MonthBillIncomeCategoryChartList>(
          e) as MonthBillIncomeCategoryChartList).toList();
  if (chartList != null) {
    monthBillIncomeCategory.chartList = chartList;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillIncomeCategory.amount = amount;
  }
  final String? contrastMoney = jsonConvert.convert<String>(
      json['contrastMoney']);
  if (contrastMoney != null) {
    monthBillIncomeCategory.contrastMoney = contrastMoney;
  }
  final double? fundMoney = jsonConvert.convert<double>(json['fundMoney']);
  if (fundMoney != null) {
    monthBillIncomeCategory.fundMoney = fundMoney;
  }
  return monthBillIncomeCategory;
}

Map<String, dynamic> $MonthBillIncomeCategoryToJson(
    MonthBillIncomeCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dateTime'] = entity.dateTime;
  data['chartList'] = entity.chartList.map((v) => v.toJson()).toList();
  data['amount'] = entity.amount;
  data['contrastMoney'] = entity.contrastMoney;
  data['fundMoney'] = entity.fundMoney;
  return data;
}

extension MonthBillIncomeCategoryExtension on MonthBillIncomeCategory {
  MonthBillIncomeCategory copyWith({
    String? dateTime,
    List<MonthBillIncomeCategoryChartList>? chartList,
    double? amount,
    String? contrastMoney,
    double? fundMoney,
  }) {
    return MonthBillIncomeCategory()
      ..dateTime = dateTime ?? this.dateTime
      ..chartList = chartList ?? this.chartList
      ..amount = amount ?? this.amount
      ..contrastMoney = contrastMoney ?? this.contrastMoney
      ..fundMoney = fundMoney ?? this.fundMoney;
  }
}

MonthBillIncomeCategoryChartList $MonthBillIncomeCategoryChartListFromJson(
    Map<String, dynamic> json) {
  final MonthBillIncomeCategoryChartList monthBillIncomeCategoryChartList = MonthBillIncomeCategoryChartList();
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillIncomeCategoryChartList.amount = amount;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    monthBillIncomeCategoryChartList.name = name;
  }
  return monthBillIncomeCategoryChartList;
}

Map<String, dynamic> $MonthBillIncomeCategoryChartListToJson(
    MonthBillIncomeCategoryChartList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['name'] = entity.name;
  return data;
}

extension MonthBillIncomeCategoryChartListExtension on MonthBillIncomeCategoryChartList {
  MonthBillIncomeCategoryChartList copyWith({
    double? amount,
    String? name,
  }) {
    return MonthBillIncomeCategoryChartList()
      ..amount = amount ?? this.amount
      ..name = name ?? this.name;
  }
}

MonthBillAppUsageRate $MonthBillAppUsageRateFromJson(
    Map<String, dynamic> json) {
  final MonthBillAppUsageRate monthBillAppUsageRate = MonthBillAppUsageRate();
  final String? month = jsonConvert.convert<String>(json['month']);
  if (month != null) {
    monthBillAppUsageRate.month = month;
  }
  final String? timeSlot = jsonConvert.convert<String>(json['timeSlot']);
  if (timeSlot != null) {
    monthBillAppUsageRate.timeSlot = timeSlot;
  }
  final String? count = jsonConvert.convert<String>(json['count']);
  if (count != null) {
    monthBillAppUsageRate.count = count;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    monthBillAppUsageRate.time = time;
  }
  final String? contrastPoints = jsonConvert.convert<String>(
      json['contrastPoints']);
  if (contrastPoints != null) {
    monthBillAppUsageRate.contrastPoints = contrastPoints;
  }
  final String? continuousTime = jsonConvert.convert<String>(
      json['continuousTime']);
  if (continuousTime != null) {
    monthBillAppUsageRate.continuousTime = continuousTime;
  }
  final String? points = jsonConvert.convert<String>(json['points']);
  if (points != null) {
    monthBillAppUsageRate.points = points;
  }
  return monthBillAppUsageRate;
}

Map<String, dynamic> $MonthBillAppUsageRateToJson(
    MonthBillAppUsageRate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['month'] = entity.month;
  data['timeSlot'] = entity.timeSlot;
  data['count'] = entity.count;
  data['time'] = entity.time;
  data['contrastPoints'] = entity.contrastPoints;
  data['continuousTime'] = entity.continuousTime;
  data['points'] = entity.points;
  return data;
}

extension MonthBillAppUsageRateExtension on MonthBillAppUsageRate {
  MonthBillAppUsageRate copyWith({
    String? month,
    String? timeSlot,
    String? count,
    String? time,
    String? contrastPoints,
    String? continuousTime,
    String? points,
  }) {
    return MonthBillAppUsageRate()
      ..month = month ?? this.month
      ..timeSlot = timeSlot ?? this.timeSlot
      ..count = count ?? this.count
      ..time = time ?? this.time
      ..contrastPoints = contrastPoints ?? this.contrastPoints
      ..continuousTime = continuousTime ?? this.continuousTime
      ..points = points ?? this.points;
  }
}

MonthBillExpenses $MonthBillExpensesFromJson(Map<String, dynamic> json) {
  final MonthBillExpenses monthBillExpenses = MonthBillExpenses();
  final List<MonthBillExpensesTrend>? trend = (json['trend'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<MonthBillExpensesTrend>(e) as MonthBillExpensesTrend)
      .toList();
  if (trend != null) {
    monthBillExpenses.trend = trend;
  }
  final MonthBillExpensesCategory? category = jsonConvert.convert<
      MonthBillExpensesCategory>(json['category']);
  if (category != null) {
    monthBillExpenses.category = category;
  }
  return monthBillExpenses;
}

Map<String, dynamic> $MonthBillExpensesToJson(MonthBillExpenses entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['trend'] = entity.trend?.map((v) => v.toJson()).toList();
  data['category'] = entity.category?.toJson();
  return data;
}

extension MonthBillExpensesExtension on MonthBillExpenses {
  MonthBillExpenses copyWith({
    List<MonthBillExpensesTrend>? trend,
    MonthBillExpensesCategory? category,
  }) {
    return MonthBillExpenses()
      ..trend = trend ?? this.trend
      ..category = category ?? this.category;
  }
}

MonthBillExpensesTrend $MonthBillExpensesTrendFromJson(
    Map<String, dynamic> json) {
  final MonthBillExpensesTrend monthBillExpensesTrend = MonthBillExpensesTrend();
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillExpensesTrend.amount = amount;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    monthBillExpensesTrend.day = day;
  }
  return monthBillExpensesTrend;
}

Map<String, dynamic> $MonthBillExpensesTrendToJson(
    MonthBillExpensesTrend entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['day'] = entity.day;
  return data;
}

extension MonthBillExpensesTrendExtension on MonthBillExpensesTrend {
  MonthBillExpensesTrend copyWith({
    double? amount,
    String? day,
  }) {
    return MonthBillExpensesTrend()
      ..amount = amount ?? this.amount
      ..day = day ?? this.day;
  }
}

MonthBillExpensesCategory $MonthBillExpensesCategoryFromJson(
    Map<String, dynamic> json) {
  final MonthBillExpensesCategory monthBillExpensesCategory = MonthBillExpensesCategory();
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    monthBillExpensesCategory.dateTime = dateTime;
  }
  final List<
      MonthBillExpensesCategoryChartList>? chartList = (json['chartList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MonthBillExpensesCategoryChartList>(
          e) as MonthBillExpensesCategoryChartList).toList();
  if (chartList != null) {
    monthBillExpensesCategory.chartList = chartList;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillExpensesCategory.amount = amount;
  }
  final String? contrastMoney = jsonConvert.convert<String>(
      json['contrastMoney']);
  if (contrastMoney != null) {
    monthBillExpensesCategory.contrastMoney = contrastMoney;
  }
  final double? fundMoney = jsonConvert.convert<double>(json['fundMoney']);
  if (fundMoney != null) {
    monthBillExpensesCategory.fundMoney = fundMoney;
  }
  return monthBillExpensesCategory;
}

Map<String, dynamic> $MonthBillExpensesCategoryToJson(
    MonthBillExpensesCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dateTime'] = entity.dateTime;
  data['chartList'] = entity.chartList.map((v) => v.toJson()).toList();
  data['amount'] = entity.amount;
  data['contrastMoney'] = entity.contrastMoney;
  data['fundMoney'] = entity.fundMoney;
  return data;
}

extension MonthBillExpensesCategoryExtension on MonthBillExpensesCategory {
  MonthBillExpensesCategory copyWith({
    String? dateTime,
    List<MonthBillExpensesCategoryChartList>? chartList,
    double? amount,
    String? contrastMoney,
    double? fundMoney,
  }) {
    return MonthBillExpensesCategory()
      ..dateTime = dateTime ?? this.dateTime
      ..chartList = chartList ?? this.chartList
      ..amount = amount ?? this.amount
      ..contrastMoney = contrastMoney ?? this.contrastMoney
      ..fundMoney = fundMoney ?? this.fundMoney;
  }
}

MonthBillExpensesCategoryChartList $MonthBillExpensesCategoryChartListFromJson(
    Map<String, dynamic> json) {
  final MonthBillExpensesCategoryChartList monthBillExpensesCategoryChartList = MonthBillExpensesCategoryChartList();
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillExpensesCategoryChartList.amount = amount;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    monthBillExpensesCategoryChartList.name = name;
  }
  return monthBillExpensesCategoryChartList;
}

Map<String, dynamic> $MonthBillExpensesCategoryChartListToJson(
    MonthBillExpensesCategoryChartList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['name'] = entity.name;
  return data;
}

extension MonthBillExpensesCategoryChartListExtension on MonthBillExpensesCategoryChartList {
  MonthBillExpensesCategoryChartList copyWith({
    double? amount,
    String? name,
  }) {
    return MonthBillExpensesCategoryChartList()
      ..amount = amount ?? this.amount
      ..name = name ?? this.name;
  }
}