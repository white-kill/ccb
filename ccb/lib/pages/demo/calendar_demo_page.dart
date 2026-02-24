import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/state_widget/state_ful_widget.dart';

import 'components/demo_calendar_widget.dart';

class CalendarDemoPage extends BaseStateful {
  const CalendarDemoPage({Key? key}) : super(key: key, title: '日历测试');

  @override
  BaseState<BaseStateful> getState() => _CalendarDemoPageState();
}

class _CalendarDemoPageState extends BaseState<CalendarDemoPage> {
  @override
  Widget initBody(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: _showCalendarDrawer,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff5B7FC8),
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w),
            ),
          ),
          child: Text(
            '打开日历边栏',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // 打开右侧日历边栏
  void _showCalendarDrawer() {
    SmartDialog.show(
      tag: 'calendar_drawer',
      alignment: Alignment.centerRight,
      animationBuilder: (controller, child, animationParam) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(controller),
          child: child,
        );
      },
      builder: (_) => const DemoCalendarWidget(),
    );
  }
}
