import 'package:ccb/generated/json/base/json_field.dart';
import 'package:ccb/generated/json/month_bill_model.g.dart';
import 'dart:convert';
export 'package:ccb/generated/json/month_bill_model.g.dart';

@JsonSerializable()
class MonthBillModel {
	MonthBillIncome? income;
	MonthBillAppUsageRate? appUsageRate;
	MonthBillExpenses? expenses;

	MonthBillModel();

	factory MonthBillModel.fromJson(Map<String, dynamic> json) => $MonthBillModelFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillIncome {
	List<MonthBillIncomeTrend>? trend = [];
	MonthBillIncomeCategory? category;

	MonthBillIncome();

	factory MonthBillIncome.fromJson(Map<String, dynamic> json) => $MonthBillIncomeFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillIncomeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillIncomeTrend {
	double amount = 0;
	String day = '';

	MonthBillIncomeTrend();

	factory MonthBillIncomeTrend.fromJson(Map<String, dynamic> json) => $MonthBillIncomeTrendFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillIncomeTrendToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillIncomeCategory {
	String dateTime = '';
	List<MonthBillIncomeCategoryChartList> chartList = [];
	double amount = 0;
	String contrastMoney = '';
	double fundMoney = 0;

	MonthBillIncomeCategory();

	factory MonthBillIncomeCategory.fromJson(Map<String, dynamic> json) => $MonthBillIncomeCategoryFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillIncomeCategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillIncomeCategoryChartList {
	double amount = 0;
	String name = '';

	MonthBillIncomeCategoryChartList();

	factory MonthBillIncomeCategoryChartList.fromJson(Map<String, dynamic> json) => $MonthBillIncomeCategoryChartListFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillIncomeCategoryChartListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillAppUsageRate {
	String month = '';
	String timeSlot = '';
	String count = '';
	String time = '';
	String contrastPoints = '';
	String continuousTime = '';
	String points = '';

	MonthBillAppUsageRate();

	factory MonthBillAppUsageRate.fromJson(Map<String, dynamic> json) => $MonthBillAppUsageRateFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillAppUsageRateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillExpenses {
	List<MonthBillExpensesTrend>? trend = [];
	MonthBillExpensesCategory? category;

	MonthBillExpenses();

	factory MonthBillExpenses.fromJson(Map<String, dynamic> json) => $MonthBillExpensesFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillExpensesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillExpensesTrend {
	double amount = 0;
	String day = '';

	MonthBillExpensesTrend();

	factory MonthBillExpensesTrend.fromJson(Map<String, dynamic> json) => $MonthBillExpensesTrendFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillExpensesTrendToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillExpensesCategory {
	String dateTime = '';
	List<MonthBillExpensesCategoryChartList> chartList = [];
	double amount = 0;
	String contrastMoney = '';
	double fundMoney = 0;

	MonthBillExpensesCategory();

	factory MonthBillExpensesCategory.fromJson(Map<String, dynamic> json) => $MonthBillExpensesCategoryFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillExpensesCategoryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillExpensesCategoryChartList {
	double amount = 0;
	String name = '';

	MonthBillExpensesCategoryChartList();

	factory MonthBillExpensesCategoryChartList.fromJson(Map<String, dynamic> json) => $MonthBillExpensesCategoryChartListFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillExpensesCategoryChartListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}