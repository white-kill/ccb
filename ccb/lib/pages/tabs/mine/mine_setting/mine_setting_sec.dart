import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import '../../../../routes/app_pages.dart';

class MineSettingSecWidget extends StatefulWidget {
  const MineSettingSecWidget({super.key});

  @override
  State<MineSettingSecWidget> createState() => _MineSettingSecWidgetState();
}

class _MineSettingSecWidgetState extends State<MineSettingSecWidget> {
  List<String> nameList = ['登陆密码', '绑定设备', '快捷支付管理', '一键安全检测'];

  void jumpPage(String name) {
    switch (name) {
      case '登陆密码':
        Get.toNamed(Routes.denglumima);
        break;
      case '绑定设备':
        Get.toNamed(Routes.bangxingsheb);
        break;
      case '快捷支付管理': // 合并相同跳转逻辑
        Get.toNamed(Routes.kuaijiezhifu);
        break;
      case '一键安全检测':
        Get.toNamed(Routes.yijiananquan);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 350.w,
      height: 160.w, // 增加总高度以容纳顶部文字
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5.w), // 加大圆角
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 顶部 "更多" 文字
          Padding(
              padding: EdgeInsets.only(left: 16.w, top: 12.w, bottom: 8.w),
              child: Row(
                children: [
                  BaseText(
                    text: "安全中心",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold, // 增加字重
                    ),
                  ).withOnTap(onTap: () {
                    //Get.toNamed(Routes.moreSettingsPage
                  }),
                  Padding(padding: EdgeInsets.only(right: 1.sw - 140.w)),
                  BaseText(
                    text: "更多",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.normal, // 增加字重
                    ),
                  ).withOnTap(onTap: () {
                    //Get.toNamed(Routes.moreSettingsPage
                    Get.toNamed(Routes.changeNavPage, arguments: {
                      'title': '安全中心',
                      'image': 'bg_more_setting',
                    });
                  }),
                ],
              )),
          // 网格内容区域
          Expanded(
            child: VerticalGridView(
              widgetBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: 'ic_setting_tag${index + 1}'.png3x,
                      width: 40.w,
                      height: 40.w, // 统一使用 .w 单位
                    ),
                    SizedBox(height: 6.w),
                    BaseText(
                      text: nameList[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500, // 增加字重
                      ),
                    ),
                  ],
                ).withOnTap(onTap: () => jumpPage(nameList[index]));
              },
              mainHeight: 100.w,
              itemCount: 4,
              //mainAxisSpacing: 8.w, // 增加间距
            ),
          ),
        ],
      ),
    ));
  }
}
