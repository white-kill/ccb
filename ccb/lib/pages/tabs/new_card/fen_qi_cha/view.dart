import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

class InstallmentInquiryPage extends BaseStateless {
  InstallmentInquiryPage({Key? key}) : super(key: key);

  final InstallmentInquiryLogic logic = Get.put(InstallmentInquiryLogic());
  final InstallmentInquiryState state = Get.find<InstallmentInquiryLogic>().state;

  @override
  String get title => '分期查询';
  
  @override
  Color get navColor => const Color(0xFFF6F6F6);

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
      color: const Color(0xFFF6F6F6),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFDCDCDC)),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: logic.state.inquiryItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = logic.state.inquiryItems[index];
                  return _buildListItem(item['icon']!, item['title']!);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFE0E0E0),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String iconPath, String title) {
    return InkWell(
      onTap: () {
        // Handle item tap
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          children: [
            Image.asset(iconPath, width: 24.w, height: 24.w),
            SizedBox(width: 12.w),
            Text(title, style: TextStyle(fontSize: 16.sp)),
            const Spacer(),
            Image.asset('assets/new_images/card/fen_qi_cha/right_arrow.png', width: 16.w, height: 16.w),
          ],
        ),
      ),
    );
  }
}
