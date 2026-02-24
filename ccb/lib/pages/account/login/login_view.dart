import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../routes/app_pages.dart';
import '../../index/index_view.dart';
import 'login_logic.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  bool get isShowAppBar => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: 1.sh,
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/new_images/login_bg.png',
                width: screenWidth,
                height: screenWidth / 3240 * 7125,
              ),
            ),
            Positioned(
              top: screenWidth / 3240 * 7125 * 0.23,
              left: 0,
              child: Container(
                width: screenWidth,
                height: screenWidth / 3240 * 7125 * 0.05,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: TextField(
                  cursorColor: Color(0xff333333),
                  controller: state.phoneTextController,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'MiSans',
                      fontWeight: FontWeight.w400,
                      // letterSpacing: 0.5,
                      color: Color(0xFF333333)),
                  decoration: InputDecoration(
                    border: InputBorder.none, // 隐藏边框
                    hintText: '请输入账号',
                    hintStyle: TextStyle(
                      color: Color(0xFF8D8D8D),
                      // 设置提示
                      fontFamily: 'PingFangSC',
                      // 文字颜色
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp, // 可选：调整字体大小
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (String text) {
                    if (text.isNotEmpty &&
                        state.psdTextController.text.isNotEmpty) {
                      state.btnEnable.value = true;
                    } else {
                      state.btnEnable.value = false;
                    }
                  },
                ),
              ),
            ),
            Positioned(
              top: screenWidth / 3240 * 7125 * 0.28,
              left: 0,
              child: Container(
                width: screenWidth,
                height: screenWidth / 3240 * 7125 * 0.05,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: TextField(
                  controller: state.psdTextController,
                  obscureText: true,
                  cursorColor: Color(0xff333333),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 4,
                      color: Color(0xFF333333)),
                  decoration: InputDecoration(
                    border: InputBorder.none, // 隐藏边框
                    hintText: '请输入登录密码',
                    hintStyle: TextStyle(
                      color: Color(0xFF8D8D8D),
                      // 设置提示
                      fontFamily: 'PingFangSC',
                      // 文字颜色
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      fontSize: 13.sp, // 可选：调整字体大小
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (String text) {
                    if (text.isNotEmpty &&
                        state.phoneTextController.text.isNotEmpty) {
                      state.btnEnable.value = true;
                    } else {
                      state.btnEnable.value = false;
                    }
                  },
                ),
              ),
            ),
            Obx(() {
              return Positioned(
                  top: screenWidth / 3240 * 7125 * 0.37,
                  left: 20,
                  child: InkWell(
                    onTap: () {
                      if (state.btnEnable.value) {
                        logic.goLogin();
                      }
                    },
                    child: Container(
                      width: screenWidth - 40,
                      height: (screenWidth - 40) / 2859 * 441,
                      child: state.btnEnable.value
                          ? Image.asset(
                              'assets/new_images/login_btn_enable.png',
                            )
                          : Image.asset(
                              'assets/new_images/login_btn_unable.png',
                            ),
                    ),
                  ));
            }),
            Positioned(
                top: screenWidth / 3240 * 7125 * 0.08,
                right: screenWidth * 0.04,
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/ccbCustomerPage');
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                  ),
                )),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Stack(children: [
            Positioned(
              top: 51.w + ScreenUtil().statusBarHeight,
              left: 1.sw / 2 - 58.w / 2,
              child: Image(
                  width: 58.w,
                  height: 58.w,
                  image: ('login_head_holder').png3x),
            ),
            Positioned(
                top: 55.5.w,
                right: 0,
                child: Image(
                    width: 128.w,
                    height: 128.w,
                    image: ('login_head_bg').png3x)),
            Positioned(
                top: 180.w,
                left: 1.sw / 2 - 58.w / 2,
                child: Text("上午好！",
                    style:
                        TextStyle(fontSize: 18.sp, color: Color(0xff666666)))),
            Positioned(
              top: 300.5.w, // 调整垂直位置
              left: 20.w, // 调整水平位置
              right: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: state.phoneTextController,
                    decoration: InputDecoration(
                      border: InputBorder.none, // 隐藏边框
                      hintText: '请输入手机号',
                      hintStyle: TextStyle(
                        color: Color(0xff999999), // 设置提示文字颜色
                        fontSize: 16.0, // 可选：调整字体大小
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  Divider(
                    color: Color(0x668C8C8C),
                    height: 1,
                    thickness: 1,
                  ),

                  SizedBox(
                    height: 15.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: state.psdTextController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none, // 隐藏边框
                            hintText: '请输入密码',
                            hintStyle: TextStyle(
                              color: Color(0xff999999), // 设置提示文字颜色
                              fontSize: 16.0, // 可选：调整字体大小
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // 处理忘记密码点击事件
                          print('点击了忘记密码');
                        },
                        child: Text(
                          '忘记密码',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0x668C8C8C),
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(height: 40.w), // 调整下划线与输入框之间的间距
                  // 添加登录按钮
                  SizedBox(
                    width: double.infinity, // 使按钮宽度和下划线一样长
                    height: 50.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all(0),
                      ),
                      onPressed: () {
                        // 处理登录点击事件
                        print('点击了登录按钮');
                        logic.goLogin();
                      },
                      child: Text('登录'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.w)),
                  SizedBox(
                      width: double.infinity, // 使按钮宽度和下划线一样长
                      height: 20.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        "更多选项｜帮助",
                        style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                      )), // 调整按钮与其他内容之间的间距
                ],
              ),
            ),
          ])),
    );
  }
}
