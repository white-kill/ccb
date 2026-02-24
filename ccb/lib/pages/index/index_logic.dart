import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../utils/local_notifications.dart';
import 'index_state.dart';

class IndexLogic extends GetxController {
  final IndexState state = IndexState();

  /// 默认选择第一个页面
  var taBarIdx = 0.obs;

  /// 控制底部导航栏显示隐藏
  var showTabBar = true.obs;



  @override
  void onClose() {
    super.onClose();
    NotificationHelper.getInstance().closeSubject();
  }

  @override
  void onInit() {
    super.onInit();
    NotificationHelper.getInstance().initPermission();
    AppConfig.config.balanceLogic.memberInfoData();
    state.item = state.appBarList.map((data) {
      // return BottomNavigationBarItem(
      //   icon: ,
      //   // label: data["title"],
      // );
      return Obx(() => Container(
        padding: EdgeInsets.only(top: 12.h),
        // height: 30.w,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Image(
              image:
              '${data["icon"]}${taBarIdx.value == data["index"] ? '_select${taBarIdx.value}' : '_normal${data["index"]}'}'
                  .png3x,
              width: 18.w,
              height: 18.w,
            ),
            SizedBox(height: 5.h,),
            Text(data["title"], style: TextStyle(
                fontFamily: "PingFangSC",
                fontSize: 12.sp,
                color: taBarIdx.value == data["index"] ? Color(data['selectColor']) :
                Color(0xFF191D20)
            ))
          ],
        ),
      ));
    }).toList();
  }

  /// navigationBar设置
  Widget navigationBar(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        color: Color(0xFFF3FDFF),
        height: 55.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: state.item.asMap().entries.map((entry) {
            int index = entry.key;
            Widget item = entry.value;
            return InkWell(
              onTap: () => selectIndex(index),
              child: item,
            );
          }).toList(),
        ),
      ),
    );
  }

  void selectIndex(int index) {
    if (taBarIdx.value == index) return;
    // if (index == 4) {
    //   FaceUtil.localAuth().then((v){
    //     if(v == true){
    //       Get.to(
    //             () => FacePage(),
    //         fullscreenDialog: true,
    //       )?.then((v) {
    //         if (v == '1') {
    //           taBarIdx.value = index;
    //         }
    //       });
    //     }else{
    //       taBarIdx.value = index;
    //     }
    //   });
    //   return;
    // }
    taBarIdx.value = index;
  }
}
