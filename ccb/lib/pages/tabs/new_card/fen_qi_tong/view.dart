import 'package:ccb/utils/screen_util.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';

class FenQiTongPage extends BaseStateless {
  FenQiTongPage({Key? key}) : super(key: key);

  final FenQiTongLogic logic = Get.put(FenQiTongLogic());

  @override
  String get title => '分期通';
  
  @override
  Color get navColor => Colors.white;

  @override
  Color? get navTitleColor => Colors.black87;
  
  @override
  Color? get leadingColor => Colors.black87;

  @override
  Widget? get leftItem => IconButton(
        icon: Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w),
        onPressed: () => Get.back(),
      );

  @override
  List<Widget>? get rightAction => [
        IconButton(
          icon: Image.asset('assets/new_images/close.png', width: 14.w, height: 14.w),
          onPressed: () => Get.back(),
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xFFECF1F5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildBlueHeader(),
            _buildMiddleSection(),
            SizedBox(height: 10.h),
            _buildMyInstallmentSection(),
            SizedBox(height: 10.h),
            _buildTipsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBlueHeader() {
    return Container(
      color: const Color(0xFF4A77E2),
      height: 170.w,
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(
            right: -5.r,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), bottomLeft:Radius.circular(15.r))
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                      'assets/new_images/card/fen_qi_tong/question_icon.png',
                      width: 14.w),
                  const SizedBox(width: 2,),
                  Text('说明及帮助',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('您的分期通预审批额度',
                    style:
                    TextStyle(fontSize: 14.sp, color: Colors.white70)),
                SizedBox(height: 10.h),
                Text('未能查询到您的额度信息',
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleSection() {
    return Row(
      children: [
        _buildMiddleItem('assets/new_images/card/fen_qi_tong/segment_1_1.png', '申请便捷'),
        const _DashedVerticalDivider(),
        _buildMiddleItem('assets/new_images/card/fen_qi_tong/segment_1_2.png', '专项额度'),
        const _DashedVerticalDivider(),
        _buildMiddleItem('assets/new_images/card/fen_qi_tong/segment_1_3.png', '轻松还款'),
      ],
    );
  }

  Widget _buildMiddleItem(String imagePath, String text) {
    return Container(
        width: screenWidth/3.0,
        child: Image.asset(imagePath));
  }

  Widget _buildMyInstallmentSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('我的分期通', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Color(0xFF3C6DD3))),
          Row(
            children: [
              Text('更多', style: TextStyle(fontSize: 14.sp, color: const Color(0xFF3C6DD3)), strutStyle: StrutStyle(
                fontSize: 14.sp,
                height: 1.0
              ),),
              SizedBox(width: 4.w),
              Padding(
                  padding: EdgeInsets.only(top: 2.w),
                  child: Icon(Icons.arrow_forward_ios, size: 14.sp, color: const Color(0xFF3C6DD3))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('温馨提示', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Color(0xFF666867))),
          SizedBox(height: 15.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.h, right: 8.w),
                child: Icon(Icons.brightness_1, size: 5.sp, color: Colors.grey),
              ),
              Expanded(
                child: Text(
                  '分期通预审批额度是指满足您日常大额消费信贷需求而先预先授予您的专项额度，该额度不会占用您信用卡固定额度。',
                  style: TextStyle(fontSize: 13.sp, color:  Color(0xFF969A9D), height: 1.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('展开', style: TextStyle(fontSize: 14.sp, color: const Color(0xFF4A77E2))),
              Icon(Icons.keyboard_arrow_down, color: const Color(0xFF4A77E2), size: 20)
            ],
          )
        ],
      ),
    );
  }
}

class _DashedVerticalDivider extends StatelessWidget {
  const _DashedVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: DottedDashedLine(
        height: 50.h,
        width: 0,
        axis: Axis.vertical,
        dashColor: Colors.grey.shade300,
      ),
    );
  }
}