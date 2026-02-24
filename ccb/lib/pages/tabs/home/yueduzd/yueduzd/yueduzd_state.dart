import 'package:get/get_rx/src/rx_types/rx_types.dart';

class YueduzdState {


  List<String> dataList = [];
  RxString currentTime = ''.obs;
  YueduzdState() {
    ///Initialize variables
    dataList = generateYearMonthList();
  }

  List<String> generateYearMonthList() {
    final DateTime now = DateTime.now();
    final int currentYear = now.year;
    final int currentMonth = now.month;

    List<String> yearMonthList = [];

    currentTime.value = '$currentYear年${currentMonth.toString().padLeft(2, '0')}月';

    for (int year = 2020; year <= currentYear; year++) {
      int monthEnd = (year == currentYear) ? currentMonth : 12;

      for (int month = 1; month <= monthEnd; month++) {
        yearMonthList.add('$year年${month.toString().padLeft(2, '0')}月');
      }
    }

    return yearMonthList;
  }
}
