import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';


class DateTimePicker extends StatefulWidget {
  final DateTime? initialDateTime;
  final ValueChanged<DateTime>? onDateTimeChanged;
  final ValueChanged<DateTime>? onDateTime;
  const DateTimePicker({
    super.key,
    this.initialDateTime,
    this.onDateTimeChanged,
    this.onDateTime,
  });

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late FixedExtentScrollController _yearController;
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _dayController;

  late int _selectedYear;
  late int _selectedMonth;
  late int _selectedDay;

  final DateTime _currentDate = DateTime.now();
  final int _startYear = 2010;

  late DateTime backDateTime;
  @override
  void initState() {
    super.initState();


    final initialDate = widget.initialDateTime ?? _currentDate;
    _selectedYear = initialDate.year;
    _selectedMonth = initialDate.month;
    _selectedDay = initialDate.day;

    backDateTime = initialDate;

    _yearController =
        FixedExtentScrollController(initialItem: _selectedYear - _startYear);
    _monthController =
        FixedExtentScrollController(initialItem: _selectedMonth - 1);
    _dayController = FixedExtentScrollController(initialItem: _selectedDay - 1);


  }
  void jumpToDate(DateTime date) {
    final years = getYears();
    final yearIndex = years.indexOf(date.year);
    if (yearIndex != -1) {
      _yearController.jumpToItem(yearIndex);
      _selectedYear = date.year;
    }

    final months = getMonths();
    final monthIndex = months.indexOf(date.month);
    if (monthIndex != -1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _monthController.jumpToItem(monthIndex);
      });
      _selectedMonth = date.month;
    }

    final days = getDays();
    final dayIndex = days.indexOf(date.day);
    if (dayIndex != -1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _dayController.jumpToItem(dayIndex);
      });
      _selectedDay = date.day;
    }

    _notifyDateTimeChanged();
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    super.dispose();
  }

  List<int> getYears() {
    return List.generate(
        _currentDate.year - _startYear + 1, (index) => _startYear + index);
  }

  List<int> getMonths() {
    int maxMonth = 12;
    if (_selectedYear == _currentDate.year) {
      maxMonth = _currentDate.month;
    }
    return List.generate(maxMonth, (index) => index + 1);
  }

  List<int> getDays() {
    int maxDay;
    if (_selectedYear == _currentDate.year &&
        _selectedMonth == _currentDate.month) {
      maxDay = _currentDate.day;
    } else {
      maxDay = DateTime(_selectedYear, _selectedMonth + 1, 0).day;
    }
    return List.generate(maxDay, (index) => index + 1);
  }

  void _onYearSelected(int index) {
    final years = getYears();
    setState(() {
      _selectedYear = years[index];
      // 检查月份是否超出范围
      final months = getMonths();
      if (_selectedMonth > months.length) {
        _selectedMonth = months.last;
        _monthController.jumpToItem(_selectedMonth - 1);
      }
      // 检查日期是否超出范围
      final days = getDays();
      if (_selectedDay > days.length) {
        _selectedDay = days.last;
        _dayController.jumpToItem(_selectedDay - 1);
      }
    });
    _notifyDateTimeChanged();
  }

  void _onMonthSelected(int index) {
    setState(() {
      _selectedMonth = index + 1;
      // 检查日期是否超出范围
      final days = getDays();
      if (_selectedDay > days.length) {
        _selectedDay = days.last;
        _dayController.jumpToItem(_selectedDay - 1);
      }
    });
    _notifyDateTimeChanged();
  }

  void _onDaySelected(int index) {
    setState(() {
      _selectedDay = index + 1;
    });
    _notifyDateTimeChanged();
  }


  void _notifyDateTimeChanged() {
    backDateTime = DateTime(_selectedYear, _selectedMonth, _selectedDay);
    if (widget.onDateTimeChanged != null) {
      widget.onDateTimeChanged!(
          DateTime(_selectedYear, _selectedMonth, _selectedDay));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.w,),
        Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CupertinoPicker(
                scrollController: _yearController,
                itemExtent: 42.w,
                onSelectedItemChanged: _onYearSelected,
                selectionOverlay: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)),
                      bottom:
                      BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)), // 下边框
                    ),
                  ),
                ),
                children: getYears().map((year) {
                  return Center(
                    child: Text(
                      '$year年',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // 月选择器
            Expanded(
              child: CupertinoPicker(
                scrollController: _monthController,
                itemExtent: 42.w,
                onSelectedItemChanged: _onMonthSelected,
                selectionOverlay: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)),
                      bottom:
                      BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)), // 下边框
                    ),
                  ),
                ),
                children: getMonths().map((month) {
                  return Center(
                    child: Text(
                      '$month月',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // 日选择器
            Expanded(
              child: CupertinoPicker(
                scrollController: _dayController,
                itemExtent: 42.w,
                onSelectedItemChanged: _onDaySelected,
                selectionOverlay: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)),
                      bottom:
                      BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)), // 下边框
                    ),
                  ),
                ),
                children: getDays().map((day) {
                  return Center(
                    child: Text(
                      '$day日',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        )),
        Row(
          children: [
            SizedBox(
              width: 24.w,
            ),
            Expanded(
                child: Container(
                  height: 40.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      color: Colors.white,
                      border: Border.all(
                          width: 0.5,
                          color: const Color(0xffdedede)
                      )
                  ),
                  child: BaseText(
                    text: '取消',
                    fontSize: 16.sp,
                  ),
                ).withOnTap(onTap: (){
                  Get.back();
                })),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
                child: Container(
                  height: 40.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 130, 248),
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                  child: BaseText(
                    text: '确定',
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ).withOnTap(onTap: (){
                  Get.back();
                  widget.onDateTime?.call(backDateTime);
                })),

            SizedBox(
              width: 24.w,
            ),
          ],
        ).withPadding(
            bottom: ScreenUtil().bottomBarHeight + 12.w
        )
      ],
    );
  }
}
