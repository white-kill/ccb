import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'logic.dart';
import 'state.dart';

class CkcpView extends BaseStateless {
  CkcpView({Key? key}) : super(key: key);

  final CkcpLogic logic = Get.put(CkcpLogic());
  final CkcpState state = Get.find<CkcpLogic>().state;

  @override
  // TODO: implement titleWidget
  Widget? get titleWidget =>
      Obx(() {
        return BaseText(
            text: "存款产品",
            fontSize: 18.sp,
            color: logic.navActionColor.value);
      });


  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem =>
      Obx(() {
        return IconButton(
          icon: Image.asset('assets/new_images/back.png', width: 8.w,
              height: 16.w,
              color: logic.navActionColor.value),
          onPressed: () => Get.back(),
        );
      });


  @override
  Function(bool change)? get onNotificationNavChange =>
          (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };


  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: Color(0xFFF7F9F8),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            // 第一段图片
            Image.asset(
              'assets/new_images/cai_fu/children/ckcp/ckcp_bg.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Container(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: navigateHeight),
              child: Column(
                children: [
                  // 页面顶部按钮组
                  _buildTopButtonRow(),
                  SizedBox(height: 16.w),
                  
                  // 第一段图片 - 使用Stack来在图片上叠加按钮
                  Stack(
                    children: [
                      Image.asset(
                        'assets/new_images/cai_fu/children/ckcp/segment_1.png',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                      // 在segment1图片上添加按钮组
                      Positioned(
                        top: (screenWidth - 32.w)/1035 * 1284 * 0.15,
                        left: 0,
                        right: 0,
                        child: _buildSegment1ButtonRow(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.w,),
                  // 第二段图片
                  Image.asset(
                    'assets/new_images/cai_fu/children/ckcp/segment_2.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: 20.w,),

                  // 第三段图片
                  Image.asset(
                    'assets/new_images/cai_fu/children/ckcp/segment_3.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: 20.w,),
                  // 第四段图片
                  Image.asset(
                    'assets/new_images/cai_fu/children/ckcp/segment_4.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: 50.w,),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  // 构建页面顶部按钮行
  Widget _buildTopButtonRow() {
    final List<Map<String, String>> topButtons = [
      {'icon': 'assets/new_images/cai_fu/children/ckcp/dqck.png', 'label': '定期存款'},
      {'icon': 'assets/new_images/cai_fu/children/ckcp/decd.png', 'label': '大额存单'},
      {'icon': 'assets/new_images/cai_fu/children/ckcp/tzck.png', 'label': '通知存款'},
      {'icon': 'assets/new_images/cai_fu/children/ckcp/tsck.png', 'label': '特色存款'},
      {'icon': 'assets/new_images/cai_fu/children/ckcp/jgxck.png', 'label': '结构性存款'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: topButtons.map((button) {
          return GestureDetector(
            onTap: () => logic.onTapButton(button['label']!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top:
                button['label'] == "结构性存款" ?
                4 : 0),
                  child: Image.asset(
                    button['icon']!,
                    width: 62,
                    height: 58,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // 构建segment1图片上的按钮行
  Widget _buildSegment1ButtonRow() {
    final List<Map<String, String>> segment1Buttons = [
      {'label': '定期存款'},
      {'label': '大额存款'},
      {'label': '通知存款'},
      {'label': '特色存款'},
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: segment1Buttons.map((button) {
          return GestureDetector(
            onTap: () => logic.onTapButton(button['label']!),
            child: Center(
              child: Container(
                // width: (screenWidth - 36.w - 45.w)/4,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
                decoration: BoxDecoration(
                  color: button["label"] == "定期存款" ? Color(0xFF2D80F6) : Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Text(
                  button['label']!,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: button["label"] == "定期存款" ? Colors.white : Color(0xFF5E605F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

} 