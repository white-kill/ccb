import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'package:intl/intl.dart';

import '../transfer_record_logic.dart';
import '../transfer_record_state.dart';

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

class CalendarPickerWidget extends StatefulWidget {
  const CalendarPickerWidget({super.key});

  @override
  State<CalendarPickerWidget> createState() => _CalendarPickerWidgetState();
}

class _CalendarPickerWidgetState extends State<CalendarPickerWidget> {
  final TransferRecordLogic logic = Get.find<TransferRecordLogic>();
  final TransferRecordState state = Get.find<TransferRecordLogic>().state;

  List<DateTime?> _rangeDatePickerValue = [];
  int _displayYear = DateTime.now().year; // 当前显示的年份（用于顶部显示）
  int _calendarYear = DateTime.now().year; // 用于控制日历跳转的年份

  // 节流控制
  bool _isUpdating = false;
  DateTime? _lastUpdateTime;

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

    if (_isUpdating || logic.monthKeys.isEmpty) return;

    _isUpdating = true;

    try {
      // 找到最接近顶部（y坐标最小）的月份
      String? topMonthKey;
      double? topY;

      for (final entry in logic.monthKeys.entries) {
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
              logic.monthPositions[monthKey] = posY;

              // 只考虑可见区域内的月份（相对于星期头部下方）
              // 假设星期头部高度约为 150-200
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

  // 滚动到指定年份
  void _scrollToYear(int targetYear) {
    // 更新两个年份变量，_calendarYear 的变化会触发日历重建并跳转
    setState(() {
      _displayYear = targetYear;
      _calendarYear = targetYear;
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
                  Icon(Icons.clear, size: 30.h, color: Colors.white),
                  Text(
                    "选择时段",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: Text(
                      "完成",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ).withOnTap(onTap: () {
                    if (_rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue.first != null && _rangeDatePickerValue.length > 1 && _rangeDatePickerValue[1] != null) {
                      // 更新日期范围
                      String bTime = DateFormat('yyyy-MM-dd').format(_rangeDatePickerValue.first!);
                      String eTime = DateFormat('yyyy-MM-dd').format(_rangeDatePickerValue[1]!);

                      state.redData.beginTime = bTime;
                      state.redData.endTime = eTime;
                      state.redData.pageNum = 1;
                      state.title2 = '自定义';

                      logic.recordData();
                      logic.update(['updateTop']);
                      SmartDialog.dismiss(force: true);
                    } else {
                      // 提示用户选择日期范围
                      SmartDialog.showToast('请选择完整的日期范围');
                    }
                  }),
                ],
              ),
            ).withOnTap(onTap: () {
              SmartDialog.dismiss(force: true);
            }),
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
          // 底部按钮
          // _buildBottomButtons(),
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
              fontWeight: FontWeight.w500,
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
              // 允许滚动到配置的 lastDate 年份（2028）
              if (targetYear <= 2028) {
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
      // padding: EdgeInsets.symmetric(vertical: 15.w),
      decoration: BoxDecoration(
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
                  BaseText(
                    text: startDate,
                    fontSize: 14.sp,
                    color: _rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue.first != null ? const Color(0xff7C7C7C) : const Color(0xff999999),
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
                  BaseText(
                    text: endDate,
                    fontSize: 14.sp,
                    color: _rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue.length == 2 ? const Color(0xff7C7C7C) : const Color(0xff999999),
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
            // 使用 _calendarYear 控制日历跳转，避免滚动时的意外跳转
            key: ValueKey('calendar_$_calendarYear'),
            displayedMonthDate: DateTime(_calendarYear, 1, 1),
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
              calendarViewMode: CalendarDatePicker2Mode.scroll,
              // 固定日期范围，确保所有年份都已加载，避免重建
              firstDate: DateTime(2020, 1, 1),
              lastDate: DateTime(2028, 12, 31),
              currentDate: DateTime(_calendarYear, 1, 1),
              // 使用动态行数，然后通过scrollViewMonthYearBuilder补偿高度差异
              dynamicCalendarRows: true,
              // 隐藏滚动视图的月份和星期标题
              hideScrollViewMonthWeekHeader: true,
              // 隐藏顶部控制栏
              hideScrollViewTopHeader: true,
              // 自定义月份年份构建器（为月份标题预留空间）
              scrollViewMonthYearBuilder: (DateTime monthDate) {
                // 计算这个月的实际行数
                final actualRows = _getMonthRowCount(monthDate);
                // 以6行为基准，补偿缺少的行数
                // 4行：补偿2行 = 2 * 42h
                // 5行：补偿1行 = 1 * 42h
                // 6行：补偿0行 = 0h
                final missingRows = 6 - actualRows;
                final compensationHeight = missingRows * 10.w;
                // 总高度 = 月份标题空间(32h) + 补偿高度
                return SizedBox(height: 20.w + compensationHeight);
              },

              // 选中日期的背景色
              selectedDayHighlightColor: const Color(0xff5B7FC8),
              // // 星期标签
              // weekdayLabels: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
              // weekdayLabelTextStyle: TextStyle(
              //   color: const Color(0xff666666),
              //   fontSize: 14.sp,
              //   fontWeight: FontWeight.w500,
              // ),
              // // 自定义星期标签构建器
              // weekdayLabelBuilder: ({required weekday, isScrollViewTopHeader}) {
              //   const labels = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
              //
              //   // 只在顶部显示星期标签
              //   if (isScrollViewTopHeader == true) {
              //     return Container(
              //       decoration: BoxDecoration(
              //         color: const Color(0xffF7F7F7), // 背景色
              //         border: Border(
              //           top: BorderSide(
              //             color: const Color(0xffE5E5E5),
              //             width: 0.5,
              //           ),
              //         ),
              //       ),
              //       alignment: Alignment.center,
              //       height: 44.h,
              //       child: Text(
              //         labels[weekday % 7],
              //         style: TextStyle(
              //           color: const Color(0xff666666),
              //           fontSize: 14.sp,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     );
              //   }
              //   // // 其他月份不显示星期标签
              //   return const SizedBox.shrink();
              // },
              // 一周从周日开始
              firstDayOfWeek: 0,
              // 年月控制按钮样式
              controlsTextStyle: TextStyle(
                color: const Color(0xff333333),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              // 日期文字样式
              dayTextStyle: TextStyle(
                color: const Color(0xff787877),
                fontSize: 16.sp,
              ),
              // 选中日期文字样式
              selectedDayTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              // 今天的文字样式
              todayTextStyle: TextStyle(
                color: const Color(0xff333333),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              // 禁用日期样式
              disabledDayTextStyle: TextStyle(
                color: const Color(0xffCCCCCC),
                fontSize: 16.sp,
              ),
              // 年份文字样式
              yearTextStyle: TextStyle(
                color: const Color(0xff333333),
                fontSize: 16.sp,
              ),
              selectedYearTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
              // 居中对齐模式选择器
              centerAlignModePicker: false,
              // 隐藏月份选择按钮
              customModePickerIcon: const SizedBox.shrink(),
              // 禁用月份选择器点击
              disableModePicker: true,
              // 监听滚动事件，更新当前显示的年份
              // scrollViewOnScrolling: (double offset) {
              //   _onScrollChanged();
              // },
              // 自定义日期构建器 - 添加分割线和月份标题
              dayBuilder: ({
                required date,
                textStyle,
                decoration,
                isSelected,
                isDisabled,
                isToday,
              }) {
                // 检查日期是否超过今天，如果超过则禁用
                final today = DateTime.now();
                final todayOnly = DateTime(today.year, today.month, today.day);
                final dateOnly = DateTime(date.year, date.month, date.day);
                final shouldDisable = (isDisabled ?? false) || dateOnly.isAfter(todayOnly);

                // 判断日期在范围中的位置
                bool isRangeStart = false;
                bool isRangeEnd = false;
                bool isInRange = false;

                if (_rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue[0] != null) {
                  final start = _rangeDatePickerValue[0]!;

                  // 只选择了开始日期
                  if (_rangeDatePickerValue.length == 1 || _rangeDatePickerValue[1] == null) {
                    isRangeStart = DateUtils.isSameDay(date, start);
                  } else {
                    // 选择了开始和结束日期
                    final end = _rangeDatePickerValue[1]!;
                    isRangeStart = DateUtils.isSameDay(date, start);
                    isRangeEnd = DateUtils.isSameDay(date, end);
                    isInRange = date.isAfter(start) && date.isBefore(end);
                  }
                }

                // 判断是否超过今天，超过则禁用点击
                final isAfterToday = dateOnly.isAfter(todayOnly);

                // 如果是每个月的1号，在上方显示月份标题
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

                // 如果超过今天，用 IgnorePointer 包裹以禁用点击
                if (isAfterToday) {
                  return IgnorePointer(
                    child: dayWidget,
                  );
                }

                return dayWidget;
              },
            ),
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
    Color textColor = const Color(0xff787877);
    FontWeight? fontWeight;

    if (isDisabled) {
      textColor = const Color(0xffD7D7D7);
    } else if (isSelected || isInRange) {
      textColor = Colors.white;
      fontWeight = FontWeight.w500;
    } else if (isToday) {
      textColor = const Color(0xff787877);
      fontWeight = FontWeight.w500;
    }

    // 构建选中范围的背景
    Widget backgroundWidget = Container(
      decoration: BoxDecoration(
        color: isDisabled ? Color(0xFFE5E5E5) : Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xffE5E5E5),  // 上边框灰色
            width: 0.5,
          ),
        ),
      ),
    );

    if (isRangeStart || isRangeEnd || isInRange) {
      backgroundWidget = Stack(
        children: [
          // 背景条（长方形部分）
          if (isRangeStart)
            // 开始日期：左半圆，直径是item的宽度，最右侧在item的最右侧
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff3B6DD1),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(1000.w), // 左侧半圆
                    right: Radius.zero,
                  ),
                ),
              ),
            ),
          if (isRangeEnd)
            // 结束日期：右半圆
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff3B6DD1),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.zero,
                    right: Radius.circular(1000.w), // 右侧半圆
                  ),
                ),
              ),
            ),
          if (isInRange)
            // 范围内日期：整行背景，深蓝色
            Positioned.fill(
              child: Container(
                color: const Color(0xff3B6DD1),
              ),
            ),
          // 边框 - 只有上边框
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
    // 生成月份的唯一key（格式：2025-01）
    final monthKey = '${date.year}-${date.month.toString().padLeft(2, '0')}';

    // 获取或创建该月份的GlobalKey
    if (!logic.monthKeys.containsKey(monthKey)) {
      logic.monthKeys[monthKey] = GlobalKey();
    }
    final key = logic.monthKeys[monthKey];
    Color textColor = const Color(0xff787877);
    FontWeight? fontWeight;

    if (isDisabled) {
      textColor = const Color(0xffD7D7D7);
    } else if (isSelected || isInRange) {
      textColor = Colors.white;
      fontWeight = FontWeight.w500;
    } else if (isToday) {
      textColor = const Color(0xff787877);
      fontWeight = FontWeight.w600;
    }

    const monthNames = ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'];

    // 构建选中范围的背景
    Widget backgroundWidget = Container(
      decoration: BoxDecoration(
        color: isDisabled ? Color(0xFFE5E5E5) : Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xffE5E5E5),  // 上边框灰色
            width: 0.5,
          ),
        ),
      ),
    );

    if (isRangeStart || isRangeEnd || isInRange) {
      backgroundWidget = Stack(
        children: [
          // 背景条（长方形部分）
          if (isRangeStart)
            // 开始日期：左半圆，直径是item的宽度，最右侧在item的最右侧
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff3B6DD1),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(1000.w), // 左侧半圆
                    right: Radius.zero,
                  ),
                ),
              ),
            ),
          if (isRangeEnd)
            // 结束日期：右半圆
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff3B6DD1),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.zero,
                    right: Radius.circular(1000.w), // 右侧半圆
                  ),
                ),
              ),
            ),
          if (isInRange)
            // 范围内日期：整行背景，深蓝色
            Positioned.fill(
              child: Container(
                color: const Color(0xff3B6DD1),
              ),
            ),
          // 边框 - 只有上边框
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
        // 在构建完成后计算并缓存位置
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _cacheMonthPosition(monthKey, key);
        });

        return Stack(
          key: key, // 使用GlobalKey包装，用于获取滚动位置
          clipBehavior: Clip.none,
          children: [
            // 日期单元格（保持正常高度）
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
            // 月份标题（定位在单元格上方）
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
        logic.monthPositions[monthKey] = position.dy;
      }
    }
  }

  // 底部按钮
  Widget _buildBottomButtons() {
    return Container(
      height: 62.w,
      width: 1.sw,
      margin: EdgeInsets.only(top: 10.w, bottom: 10.w + ScreenUtil().bottomBarHeight),
      child: Row(
        children: [
          SizedBox(width: 12.w),
          Expanded(
            child: Container(
              height: 45.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.w)),
                border: Border.all(
                  color: const Color(0xff4A6FCD),
                  width: 1.w,
                ),
              ),
              child: BaseText(
                text: '重置',
                fontSize: 16.sp,
                color: const Color(0xff4A6FCD),
              ),
            ).withOnTap(onTap: () {
              setState(() {
                _rangeDatePickerValue = [];
              });
            }),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Container(
              height: 45.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff4A6FCD),
                    Color(0xff81AEF4),
                  ],
                ),
              ),
              child: BaseText(
                text: '确定',
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ).withOnTap(onTap: () {
              if (_rangeDatePickerValue.isNotEmpty && _rangeDatePickerValue.first != null && _rangeDatePickerValue.length > 1 && _rangeDatePickerValue[1] != null) {
                // 更新日期范围
                String bTime = DateFormat('yyyy-MM-dd').format(_rangeDatePickerValue.first!);
                String eTime = DateFormat('yyyy-MM-dd').format(_rangeDatePickerValue[1]!);

                state.redData.beginTime = bTime;
                state.redData.endTime = eTime;
                state.redData.pageNum = 1;
                state.title2 = '自定义';

                logic.recordData();
                logic.update(['updateTop']);
                SmartDialog.dismiss(force: true);
              } else {
                // 提示用户选择日期范围
                SmartDialog.showToast('请选择完整的日期范围');
              }
            }),
          ),
          SizedBox(width: 12.w),
        ],
      ),
    );
  }
}
