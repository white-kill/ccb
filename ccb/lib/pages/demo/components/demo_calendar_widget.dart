import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';

// 自定义 ScrollBehavior 增大缓存范围
class LargeCacheScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}

class DemoCalendarWidget extends StatefulWidget {
  const DemoCalendarWidget({super.key});

  @override
  State<DemoCalendarWidget> createState() => _DemoCalendarWidgetState();
}

class _DemoCalendarWidgetState extends State<DemoCalendarWidget> {
  List<DateTime?> _rangeDatePickerValue = [];
  int _displayYear = DateTime.now().year; // 当前显示的年份

  // 节流控制
  bool _isUpdating = false;
  DateTime? _lastUpdateTime;

  // 月份 keys 和位置缓存
  final Map<String, GlobalKey> _monthKeys = {};
  final Map<String, double> _monthPositions = {};

  // 计算某个月份需要的行数
  int _getMonthRowCount(DateTime month) {
    // 获取该月的天数
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    // 获取该月1号是星期几（0=周日, 1=周一...6=周六）
    final firstDayOfWeek = DateTime(month.year, month.month, 1).weekday % 7;
    // 总共需要的单元格数
    final totalCells = daysInMonth + firstDayOfWeek;
    // 需要的行数
    return (totalCells / 7).ceil();
  }

  // 处理滚动事件，使用缓存的位置（滚动时会自动更新缓存）
  void _onScrollChanged() {
    // 节流：避免频繁更新
    final now = DateTime.now();
    if (_lastUpdateTime != null && now.difference(_lastUpdateTime!).inMilliseconds < 100) {
      return;
    }

    if (_isUpdating || _monthKeys.isEmpty) return;

    _isUpdating = true;

    try {
      // 找到最接近顶部（y坐标最小）的月份
      String? topMonthKey;
      double? topY;

      for (final entry in _monthKeys.entries) {
        final monthKey = entry.key;
        final key = entry.value;
        final context = key.currentContext;

        if (context != null) {
          try {
            final RenderBox? box = context.findRenderObject() as RenderBox?;
            if (box != null && box.attached) {
              final position = box.localToGlobal(Offset.zero);
              final posY = position.dy;

              // 更新缓存
              _monthPositions[monthKey] = posY;

              // 只考虑可见区域内的月份（相对于星期头部下方）
              if (posY >= 150 && posY <= 400) {
                if (topY == null || posY < topY) {
                  topY = posY;
                  topMonthKey = monthKey;
                }
              }
            }
          } catch (e) {
            // 忽略错误，继续下一个
          }
        }
      }

      // 如果找到了最接近顶部的月份，更新年份
      if (topMonthKey != null) {
        final parts = topMonthKey.split('-');
        if (parts.length == 2) {
          final year = int.tryParse(parts[0]);
          if (year != null && year != _displayYear) {
            _lastUpdateTime = now;
            if (mounted) {
              setState(() {
                _displayYear = year;
              });
            }
          }
        }
      }
    } finally {
      _isUpdating = false;
    }
  }

  // 计算滚动到指定年份需要的偏移量
  void _scrollToYear(int targetYear) {
    final targetMonthKey = '$targetYear-01';

    // 方案1：如果 GlobalKey 已存在，直接使用
    if (_monthKeys.containsKey(targetMonthKey)) {
      final key = _monthKeys[targetMonthKey];
      final context = key?.currentContext;

      if (context != null) {
        // 获取当前元素的位置
        final RenderBox? box = context.findRenderObject() as RenderBox?;
        if (box != null && box.attached) {
          // 滚动到该位置，并额外向上滚动标题的高度（32.h）
          final position = box.localToGlobal(Offset.zero);
          final scrollable = Scrollable.of(context);
          final scrollPosition = scrollable.position;

          // 计算需要滚动到的位置：当前位置 - 星期头部高度 - 月份标题高度 - 额外缓冲
          final targetOffset = scrollPosition.pixels + position.dy - 150.w - 32.w - 15.w;

          scrollPosition.animateTo(
            targetOffset,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );

          setState(() {
            _displayYear = targetYear;
          });
          return;
        }
      }
    }

    // 方案2：GlobalKey 不存在，先更新年份触发重建
    setState(() {
      _displayYear = targetYear;
    });

    // 等待多帧渲染完成后再查找 GlobalKey
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 第一帧渲染完成后再等待
      Future.delayed(const Duration(milliseconds: 100), () {
        _tryScrollToYearWithRetry(targetMonthKey, 0);
      });
    });
  }

  // 重试滚动到目标年份
  void _tryScrollToYearWithRetry(String targetMonthKey, int retryCount) {
    if (retryCount >= 5) {
      print('⚠️ 无法找到 $targetMonthKey 的 GlobalKey，已重试 $retryCount 次');
      return;
    }

    if (_monthKeys.containsKey(targetMonthKey)) {
      final key = _monthKeys[targetMonthKey];
      final context = key?.currentContext;

      if (context != null) {
        print('✅ 找到 GlobalKey，开始滚动');

        // 获取当前元素的位置并手动计算滚动偏移
        final RenderBox? box = context.findRenderObject() as RenderBox?;
        if (box != null && box.attached) {
          final position = box.localToGlobal(Offset.zero);
          final scrollable = Scrollable.of(context);
          final scrollPosition = scrollable.position;

          // 计算需要滚动到的位置：当前位置 - 星期头部高度 - 月份标题高度 - 额外缓冲
          final targetOffset = scrollPosition.pixels + position.dy - 150.h - 32.h - 15.h;

          scrollPosition.animateTo(
            targetOffset,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        return;
      }
    }

    // GlobalKey 还未创建，继续重试
    print('🔄 第 ${retryCount + 1} 次重试查找 $targetMonthKey...');
    Future.delayed(const Duration(milliseconds: 150), () {
      _tryScrollToYearWithRetry(targetMonthKey, retryCount + 1);
    });
  }

  @override
  void initState() {
    super.initState();
    // 打开时不还原选中的数据，保持为空
    _rangeDatePickerValue = [];

    // 在首次构建完成后检查位置
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) _onScrollChanged();
        });
      }
    });
  }

  @override
  void dispose() {
    _isUpdating = false;
    _lastUpdateTime = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navHeight = MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return Container(
      width: 1.sw * 0.78,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8, spreadRadius: 0.2)],
      ),
      child: Column(
        children: [
          // 顶部蓝色标题栏
          Container(
            height: navHeight,
            color: const Color(0xff3C6DD3),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, bottom: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => SmartDialog.dismiss(force: true),
                    child: Icon(Icons.clear, size: 30.h, color: Colors.white),
                  ),
                  Text(
                    "选择时段",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue.first != null && _rangeDatePickerValue.length > 1 && _rangeDatePickerValue[1] != null) {
                        // 关闭弹窗并返回选中的日期范围
                        SmartDialog.dismiss(
                          force: true,
                          result: {
                            'start': _rangeDatePickerValue.first,
                            'end': _rangeDatePickerValue[1],
                          },
                        );
                      } else {
                        // 提示用户选择日期范围
                        SmartDialog.showToast('请选择完整的日期范围');
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: Text(
                        "完成",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 年份控制栏
          _buildYearControl(),
          // 日期范围显示
          _buildDateRangeDisplay(),
          // 星期显示
          _buildWeekHeader(),
          // 日历内容
          Expanded(
            child: _buildCalendar(),
          ),
        ],
      ),
    );
  }

  // 年份控制栏
  Widget _buildYearControl() {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: const Color(0xffE5E5E5), width: 1.w),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: const Color(0xff406CCD),
              size: 35.w,
            ),
            onPressed: () {
              final targetYear = _displayYear - 1;
              if (targetYear >= 2020) {
                _scrollToYear(targetYear);
              }
            },
          ),
          SizedBox(width: 16.w),
          Text(
            '$_displayYear',
            style: TextStyle(
              color: const Color(0xff406CCD),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 16.w),
          IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: const Color(0xff406CCD),
              size: 35.w,
            ),
            onPressed: () {
              final targetYear = _displayYear + 1;
              // 允许滚动到配置的 lastDate 年份（2030）
              if (targetYear <= 2030) {
                _scrollToYear(targetYear);
              }
            },
          ),
        ],
      ),
    );
  }

  // 日期范围显示
  Widget _buildDateRangeDisplay() {
    String startDate = _rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue.first != null ? DateFormat('yyyy-MM-dd').format(_rangeDatePickerValue.first!) : '请选择';

    String endDate = _rangeDatePickerValue.length > 1 && _rangeDatePickerValue[1] != null ? DateFormat('yyyy-MM-dd').format(_rangeDatePickerValue[1]!) : '请选择';

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "开始",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff7C7C7C), height: 1.0),
                  ),
                  Text(
                    startDate,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue.first != null ? const Color(0xff7C7C7C) : const Color(0xff999999),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50.w,
            width: 1.w,
            color: Color(0xffE5E5E5),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "结束",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff7C7C7C), height: 1.0),
                  ),
                  Text(
                    endDate,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue.length == 2 ? const Color(0xff7C7C7C) : const Color(0xff999999),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 星期显示
  Widget _buildWeekHeader() {
    const weekDays = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        color: const Color(0xffEDF1F4),
        border: Border(
          top: BorderSide(
            color: const Color(0xffE5E5E5),
            width: 0.5,
          ),
          bottom: BorderSide(
            color: const Color(0xffE5E5E5),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weekDays.map((day) {
          return Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                day,
                style: TextStyle(
                  color: const Color(0xff666666),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // 日历主体
  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: const Color(0xffE5E5E5), width: 1),
        ),
      ),
      child: ScrollConfiguration(
        behavior: LargeCacheScrollBehavior(),
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            // 只在滚动更新时处理，提高性能
            if (notification is ScrollUpdateNotification) {
              _onScrollChanged();
            } else if (notification is ScrollEndNotification) {
              // 滚动结束时再次检查，确保准确
              Future.delayed(const Duration(milliseconds: 50), () {
                if (mounted) _onScrollChanged();
              });
            }
            return false;
          },
          child: CalendarDatePicker2(
            // 使用 key 确保 displayedMonthDate 改变时日历重建
            key: ValueKey('calendar_$_displayYear'),
            displayedMonthDate: DateTime(_displayYear, DateTime.now().month, DateTime.now().day),
            config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.range,
                calendarViewMode: CalendarDatePicker2Mode.scroll,
                // 固定日期范围，确保所有年份都已加载，避免重建
                firstDate: DateTime(2020, 1, 1),
                lastDate: DateTime(2030, 12, 31),
                // 使用 currentDate 控制显示的年份位置
                currentDate: DateTime(_displayYear, DateTime.now().month, DateTime.now().day),
                dynamicCalendarRows: true,
                hideScrollViewMonthWeekHeader: true,
                hideScrollViewTopHeader: true,
                scrollViewMonthYearBuilder: (DateTime monthDate) {
                  final actualRows = _getMonthRowCount(monthDate);
                  final missingRows = 6 - actualRows;
                  final compensationHeight = missingRows * 10.w;
                  return SizedBox(height: 20.w + compensationHeight);
                },
                selectedDayHighlightColor: const Color(0xff5B7FC8),
                firstDayOfWeek: 0,
                controlsTextStyle: TextStyle(
                  color: const Color(0xff333333),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                dayTextStyle: TextStyle(
                  color: const Color(0xff333333),
                  fontSize: 16.sp,
                ),
                selectedDayTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                todayTextStyle: TextStyle(
                  color: const Color(0xff333333),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                disabledDayTextStyle: TextStyle(
                  color: const Color(0xffCCCCCC),
                  fontSize: 16.sp,
                ),
                yearTextStyle: TextStyle(
                  color: const Color(0xff333333),
                  fontSize: 16.sp,
                ),
                selectedYearTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                centerAlignModePicker: false,
                customModePickerIcon: const SizedBox.shrink(),
                disableModePicker: true,
                dayBuilder: ({
                  required date,
                  textStyle,
                  decoration,
                  isSelected,
                  isDisabled,
                  isToday,
                }) {
                  final today = DateTime.now();
                  final todayOnly = DateTime(today.year, today.month, today.day);
                  final dateOnly = DateTime(date.year, date.month, date.day);
                  final shouldDisable = (isDisabled ?? false) || dateOnly.isAfter(todayOnly);

                  bool isRangeStart = false;
                  bool isRangeEnd = false;
                  bool isInRange = false;

                  if (_rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue[0] != null) {
                    final start = _rangeDatePickerValue[0]!;

                    if (_rangeDatePickerValue.length == 1 || _rangeDatePickerValue[1] == null) {
                      isRangeStart = DateUtils.isSameDay(date, start);
                    } else {
                      final end = _rangeDatePickerValue[1]!;
                      isRangeStart = DateUtils.isSameDay(date, start);
                      isRangeEnd = DateUtils.isSameDay(date, end);
                      isInRange = date.isAfter(start) && date.isBefore(end);
                    }
                  }

                  final isAfterToday = dateOnly.isAfter(todayOnly);

                  Widget dayWidget;
                  if (date.day == 1) {
                    dayWidget = _buildDayWithMonthTitle(
                      date: date,
                      textStyle: textStyle,
                      decoration: decoration,
                      isSelected: isSelected ?? false,
                      isDisabled: shouldDisable,
                      isToday: isToday ?? false,
                      isRangeStart: isRangeStart,
                      isRangeEnd: isRangeEnd,
                      isInRange: isInRange,
                    );
                  } else {
                    dayWidget = _buildDayWithBorder(
                      date: date,
                      textStyle: textStyle,
                      decoration: decoration,
                      isSelected: isSelected ?? false,
                      isDisabled: shouldDisable,
                      isToday: isToday ?? false,
                      isRangeStart: isRangeStart,
                      isRangeEnd: isRangeEnd,
                      isInRange: isInRange,
                    );
                  }

                  if (isAfterToday) {
                    return IgnorePointer(
                      child: dayWidget,
                    );
                  }

                  return dayWidget;
                }),
            value: _rangeDatePickerValue,
            onValueChanged: (dates) {
              setState(() {
                _rangeDatePickerValue = dates;
              });
            },
          ),
        ),
      ),
    );
  }

  // 自定义日期单元格，带分割线
  Widget _buildDayWithBorder({
    required DateTime date,
    TextStyle? textStyle,
    BoxDecoration? decoration,
    required bool isSelected,
    required bool isDisabled,
    required bool isToday,
    required bool isRangeStart,
    required bool isRangeEnd,
    required bool isInRange,
  }) {
    Color textColor = const Color(0xff333333);
    FontWeight? fontWeight;

    if (isDisabled) {
      textColor = const Color(0xffD7D7D7);
    } else if (isSelected) {
      textColor = Colors.white;
      fontWeight = FontWeight.w600;
    } else if (isToday) {
      textColor = const Color(0xff333333);
      fontWeight = FontWeight.w600;
    }

    Widget backgroundWidget = Container(
      decoration: BoxDecoration(
        color: isDisabled ? Color(0xFFE5E5E5) : Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xffE5E5E5),
            width: 0.5,
          ),
        ),
      ),
    );

    if (isRangeStart || isRangeEnd || isInRange) {
      backgroundWidget = Stack(
        children: [
          if (isRangeStart)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff5B7FC8),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(1000.w),
                    right: Radius.zero,
                  ),
                ),
              ),
            ),
          if (isRangeEnd)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff5B7FC8),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.zero,
                    right: Radius.circular(1000.w),
                  ),
                ),
              ),
            ),
          if (isInRange)
            Positioned.fill(
              child: Container(
                color: const Color(0xff5B7FC8),
              ),
            ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: const Color(0xffE5E5E5),
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          backgroundWidget,
          Center(
            child: Text(
              '${date.day}',
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 带月份标题的日期单元格（用于每月1号）
  Widget _buildDayWithMonthTitle({
    required DateTime date,
    TextStyle? textStyle,
    BoxDecoration? decoration,
    required bool isSelected,
    required bool isDisabled,
    required bool isToday,
    required bool isRangeStart,
    required bool isRangeEnd,
    required bool isInRange,
  }) {
    final monthKey = '${date.year}-${date.month.toString().padLeft(2, '0')}';

    if (!_monthKeys.containsKey(monthKey)) {
      _monthKeys[monthKey] = GlobalKey();
    }
    final key = _monthKeys[monthKey];

    Color textColor = const Color(0xff333333);
    FontWeight? fontWeight;

    if (isDisabled) {
      textColor = const Color(0xffD7D7D7);
    } else if (isSelected) {
      textColor = Colors.white;
      fontWeight = FontWeight.w600;
    } else if (isToday) {
      textColor = const Color(0xff5B7FC8);
      fontWeight = FontWeight.w600;
    }

    const monthNames = ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'];

    Widget backgroundWidget = Container(
      decoration: BoxDecoration(
        color: isDisabled ? Color(0xFFE5E5E5) : Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xffE5E5E5),
            width: 0.5,
          ),
        ),
      ),
    );

    if (isRangeStart || isRangeEnd || isInRange) {
      backgroundWidget = Stack(
        children: [
          if (isRangeStart)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff5B7FC8),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(1000.w),
                    right: Radius.zero,
                  ),
                ),
              ),
            ),
          if (isRangeEnd)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff5B7FC8),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.zero,
                    right: Radius.circular(1000.w),
                  ),
                ),
              ),
            ),
          if (isInRange)
            Positioned.fill(
              child: Container(
                color: const Color(0xff5B7FC8),
              ),
            ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: const Color(0xffE5E5E5),
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _cacheMonthPosition(monthKey, key);
        });

        return Stack(
          key: key,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  backgroundWidget,
                  Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.sp,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -32.h,
              left: -200.w,
              right: -200.w,
              child: Center(
                child: Container(
                  height: 32.h,
                  alignment: Alignment.center,
                  child: Text(
                    monthNames[date.month - 1],
                    style: TextStyle(
                      color: const Color(0xff333333),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // 缓存月份位置
  void _cacheMonthPosition(String monthKey, GlobalKey? key) {
    if (key == null) return;
    final context = key.currentContext;
    if (context != null) {
      final RenderBox? box = context.findRenderObject() as RenderBox?;
      if (box != null && box.attached) {
        final position = box.localToGlobal(Offset.zero);
        _monthPositions[monthKey] = position.dy;
      }
    }
  }
}
