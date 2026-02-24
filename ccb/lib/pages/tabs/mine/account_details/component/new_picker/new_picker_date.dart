import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../account_details_logic.dart';
import '../../account_details_state.dart';
import 'new_picker_header.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime? initialDateTime;
  final DateTime? minDateTime; // 最小时间限制
  final ValueChanged<DateTime>? onDateTimeChanged;
  final NewPickerHeaderNotifier? headerNotifier;

  const DateTimePicker({
    super.key,
    this.initialDateTime,
    this.minDateTime, // 最小时间限制
    this.onDateTimeChanged,
    this.headerNotifier,
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

  final AccountDetailsLogic logic = Get.put(AccountDetailsLogic());
  final AccountDetailsState state = Get.find<AccountDetailsLogic>().state;

  @override
  void initState() {
    super.initState();

    DateTime initialDate = widget.initialDateTime ?? _currentDate;

    // 确保初始时间不早于最小时间
    if (widget.minDateTime != null && initialDate.isBefore(widget.minDateTime!)) {
      initialDate = widget.minDateTime!;
    }

    _selectedYear = initialDate.year;
    _selectedMonth = initialDate.month;
    _selectedDay = initialDate.day;

    // 计算控制器初始位置
    final years = getYears();
    final yearIndex = years.indexOf(_selectedYear);

    _yearController = FixedExtentScrollController(initialItem: yearIndex);
    _monthController = FixedExtentScrollController(initialItem: _selectedMonth - 1);
    _dayController = FixedExtentScrollController(initialItem: _selectedDay - 1);

    widget.headerNotifier?.addListener(_onController);
  }

  _onController() {
    if (mounted) {
      if (widget.headerNotifier?.type == "jumpTime") {
        jumpToDate(widget.headerNotifier?.jTime ?? DateTime.now());
      }
    }
  }

  void jumpToDate(DateTime date) {
    // 确保跳转的时间不早于最小时间
    DateTime targetDate = date;
    if (widget.minDateTime != null && targetDate.isBefore(widget.minDateTime!)) {
      targetDate = widget.minDateTime!;
    }

    final years = getYears();
    final yearIndex = years.indexOf(targetDate.year);
    if (yearIndex != -1) {
      _yearController.jumpToItem(yearIndex);
      _selectedYear = targetDate.year;
    }

    final months = getMonths();
    final monthIndex = months.indexOf(targetDate.month);
    if (monthIndex != -1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _monthController.jumpToItem(monthIndex);
      });
      _selectedMonth = targetDate.month;
    }

    final days = getDays();
    final dayIndex = days.indexOf(targetDate.day);
    if (dayIndex != -1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _dayController.jumpToItem(dayIndex);
      });
      _selectedDay = targetDate.day;
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
    int startYear = widget.minDateTime?.year ?? _currentDate.year - 15;
    return List.generate(
        _currentDate.year - startYear + 1, (index) => startYear + index);
  }

  List<int> getMonths() {
    int minMonth = 1;
    int maxMonth = 12;

    // 如果选中的年份等于最小时间的年份，最小月份为最小时间的月份
    if (widget.minDateTime != null && _selectedYear == widget.minDateTime!.year) {
      minMonth = widget.minDateTime!.month;
    }

    // 如果选中的年份等于当前年份，最大月份为当前月份
    if (_selectedYear == _currentDate.year) {
      maxMonth = _currentDate.month;
    }

    return List.generate(maxMonth - minMonth + 1, (index) => minMonth + index);
  }

  List<int> getDays() {
    int minDay = 1;
    int maxDay;

    // 计算最大天数
    if (_selectedYear == _currentDate.year && _selectedMonth == _currentDate.month) {
      maxDay = _currentDate.day;
    } else {
      maxDay = DateTime(_selectedYear, _selectedMonth + 1, 0).day;
    }

    // 如果选中的年份和月份等于最小时间的年份和月份，最小天数为最小时间的天数
    if (widget.minDateTime != null &&
        _selectedYear == widget.minDateTime!.year &&
        _selectedMonth == widget.minDateTime!.month) {
      minDay = widget.minDateTime!.day;
    }

    return List.generate(maxDay - minDay + 1, (index) => minDay + index);
  }

  void _onYearSelected(int index) {
    final years = getYears();
    setState(() {
      _selectedYear = years[index];

      // 检查月份是否超出范围
      final months = getMonths();
      if (_selectedMonth < months.first) {
        _selectedMonth = months.first;
      } else if (_selectedMonth > months.last) {
        _selectedMonth = months.last;
      }
      _monthController.jumpToItem(_selectedMonth - months.first);

      // 检查日期是否超出范围
      final days = getDays();
      if (_selectedDay < days.first) {
        _selectedDay = days.first;
      } else if (_selectedDay > days.last) {
        _selectedDay = days.last;
      }
      _dayController.jumpToItem(_selectedDay - days.first);
    });
    _notifyDateTimeChanged();
  }

  void _onMonthSelected(int index) {
    final months = getMonths();
    setState(() {
      _selectedMonth = months[index];

      // 检查日期是否超出范围
      final days = getDays();
      if (_selectedDay < days.first) {
        _selectedDay = days.first;
      } else if (_selectedDay > days.last) {
        _selectedDay = days.last;
      }
      _dayController.jumpToItem(_selectedDay - days.first);
    });
    _notifyDateTimeChanged();
  }

  void _onDaySelected(int index) {
    final days = getDays();
    setState(() {
      _selectedDay = days[index];
    });
    _notifyDateTimeChanged();
  }

  void _notifyDateTimeChanged() {
    if (widget.onDateTimeChanged != null) {
      final selectedDate = DateTime(_selectedYear, _selectedMonth, _selectedDay);
      // 确保选择的时间不早于最小时间
      if (widget.minDateTime == null || !selectedDate.isBefore(widget.minDateTime!)) {
        widget.onDateTimeChanged!(selectedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CupertinoPicker(
            scrollController: _yearController,
            itemExtent: 32,
            onSelectedItemChanged: _onYearSelected,
            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
              capStartEdge: false,
              capEndEdge: false,
            ),
            children: getYears().map((year) {
              return Center(
                child: Text(
                  '$year年',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
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
            itemExtent: 32,
            onSelectedItemChanged: _onMonthSelected,
            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
              capStartEdge: false,
              capEndEdge: false,
            ),
            children: getMonths().map((month) {
              return Center(
                child: Text(
                  '$month月',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        // 日选择器
        GetBuilder(builder: (AccountDetailsLogic c) {
          return logic.state.isDay? Expanded(
            child: CupertinoPicker(
              scrollController: _dayController,
              itemExtent: 32,
              onSelectedItemChanged: _onDaySelected,
              selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
                capStartEdge: false,
                capEndEdge: false,
              ),
              children: getDays().map((day) {
                return Center(
                  child: Text(
                    '$day日',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ):SizedBox.shrink();
        },id: 'updateM',),
      ],
    ).withPadding(
      left: 12.w,
      right: 12.w,
    );
  }
}