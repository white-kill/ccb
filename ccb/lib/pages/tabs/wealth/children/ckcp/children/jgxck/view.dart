import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../../../routes/app_pages.dart';
import 'logic.dart';
import 'state.dart';

class JgxckView extends BaseStateless {
  JgxckView({Key? key}) : super(key: key);

  final JgxckLogic logic = Get.put(JgxckLogic());
  final JgxckState state = Get.find<JgxckLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  String? get title => "结构性存款";

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get navColor => Color(0xFF2B56C9);

  @override
  Widget? get leftItem => IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: 30.w,
          minHeight: 30.w,
        ),
        onPressed: () => Get.back(),
        icon: Image.asset(
          'assets/new_images/back.png',
          width: 8.w,
          height: 16.w,
          color: Colors.white,
        ),
      );

  @override
  List<Widget>? get rightAction => [
    Center(
      child: InkWell(
        onTap: () {
          // 处理说明按钮点击
          Get.toNamed(Routes.sm);
        },
        child: Container(
          padding: EdgeInsets.only(right: 16.w),
          child: Text(
            '说明',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(top: 3.sp),
      margin: const EdgeInsets.only(right: 10),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: 30.w,
          minHeight: 30.w,
        ),
        onPressed: () => Get.back(),
        icon: Image.asset(
          'assets/new_images/cai_fu/children/jgxck/circle_close.png',
          width: 16.w,
          height: 16.w,
          color: Colors.white,
        ),
      ),
    ),
  ];

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        // Tab栏
        Container(
          color: Colors.white,
          child: TabBar(
            controller: state.tabController,
            labelColor: Color(0xFF292929),
            unselectedLabelColor: Color(0xFF606060),
            indicatorColor: Color(0xFF2B56C9),
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            tabs: [
              Tab(text: '产品购买'),
              Tab(text: '我的持仓'),
              Tab(text: '交易查询'),
            ],
          ),
        ),
        // Tab内容区域
        Expanded(
          child: TabBarView(
            controller: state.tabController,
            children: [
              // 产品购买
              _buildEmptyView('1'),
              // 我的持仓
              _buildEmptyView('2'),
              // 交易查询
              _buildEmptyView('3'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyView(String text) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/new_images/cai_fu/children/jgxck/jgxck_$text.png',
            ),
          ],
        ),
      ),
    );
  }
}
