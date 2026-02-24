import 'package:card_swiper/card_swiper.dart';
import 'package:ccb/config/app_config.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/common_right_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  List list = ['ic_home_gd', 'ic_home_gd', 'ic_home_gd', 'ic_home_gd'];

  /// 构建自定义内容页面
  Widget _buildCustomContent() {
    // 获取手机号和证件号
    String phone = AppConfig.config.balanceLogic.memberInfo.phone ?? '';
    String idCard = AppConfig.config.balanceLogic.memberInfo.idCard ?? '';
    
    // 手机号：前3位 + 星号 + 后4位
    String maskedPhone = '';
    if (phone.length >= 7) {
      maskedPhone = phone.substring(0, 3) + '****' + phone.substring(phone.length - 4);
    }
    
    // 证件号：取后6位，格式化为 XX**XX
    String maskedIdCard = '';
    if (idCard.length >= 6) {
      String last6 = idCard.substring(idCard.length - 6);
      maskedIdCard = last6.substring(0, 2) + '**' + last6.substring(4);
    }
    
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/ic_home_gd2_view@3x.png',
              width: 1.sw,
              fit: BoxFit.fitWidth,
            ),
            // 手机号
            Positioned(
              bottom: 78.w,
              left: 175.w,
              child: BaseText(
                text: maskedPhone,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "PingFang",
                  height: 1.0,
                  color: Color(0xFF8D70D2),
                ),
              ),
            ),
            // 证件号
            Positioned(
              bottom: 58.w,
              left: 215.w,
              child: BaseText(
                text: maskedIdCard,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "PingFang",
                  height: 1.0,
                  color: Color(0xFF8D70D2),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image(
          image: '${list[index]}$index'.png3x,
          width: 350.w,
          height: 110.w,
          fit: BoxFit.fill,
        ).withOnTap(onTap: () {
          if (index == 0) {
            // Get.toNamed(Routes.changeNavPage, arguments: {
            //   'title': '任务详情',
            //   'image': 'ic_home_gd0_view',
            // });
            Get.toNamed(Routes.fixedNavPage, arguments: {
              'title': '2025年度账单',
              'image': 'ic_home_gd3_view',
              'rightWidget': Row(
                children: CommonRightButton.build([RightButtonConfig(type: RightButtonType.close)]),
              ),
            });
          }
          else if (index == 1) {
            Get.toNamed(Routes.yyhk);
          }
          else if (index == 2) {
            Get.toNamed(Routes.fixedNavPage, arguments: {
              'title': '',
              'navColor': Colors.white,
              'titleColor': Colors.black,
              'bodyWidget': _buildCustomContent(),
              'leftWidget': IconButton(
                icon: Image.asset(
                  'assets/new_images/close.png',
                  width: 14.w,
                  height: 14.w,
                  color: Colors.black,
                ),
                onPressed: () => Get.back(),
              ),
              'rightWidget': Row(
                children: CommonRightButton.build([RightButtonConfig(type: RightButtonType.more)]),
              ),
            });
          }
          else if (index == 3) {
            Get.toNamed(Routes.yjbk);


          }

        });
      },
      itemCount: list.length,
      autoplay: true,
    ).withContainer(
      width: 1.sw,
      height: 90.w,
    );
  }
}
