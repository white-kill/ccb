import 'dart:ui';

import 'package:get/get.dart';

import '../../../../../data/model/month_bill_model.dart';

class Jh_ydzdState {


  MonthBillModel billModel = MonthBillModel();


  List<ChartData> chartData1 = [
    // ChartData('2024/11', 123),
    // ChartData('2024/12', 281),
    // ChartData('2025/01', 232),
    // ChartData('2025/02', 221),
    // ChartData('2025/03', 232),
    // ChartData('2025/04', 212)
  ];

  List<SalesData> data1 = [
    // _SalesData('Jan', 60, Colors.red),
  ];


  List<ChartData> chartData2 = [
    // ChartData('2024/11', 123),
    // ChartData('2024/12', 281),
    // ChartData('2025/01', 232),
    // ChartData('2025/02', 221),
    // ChartData('2025/03', 232),
    // ChartData('2025/04', 212)
  ];

  List<SalesData> data2 = [
    // _SalesData('Jan', 60, Colors.red),
  ];



  Jh_ydzdState() {}
  final isSelected1 = false.obs;

  final isSelected2 = false.obs;

}


class SalesData {
  SalesData(this.year, this.sales, this.color);

  final String year;
  final double sales;
  final Color color;
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
