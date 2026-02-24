import 'package:ccb/pages/tabs/mine/account_preview/children/zxzm/view.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class ManagerPage extends BaseStateless {
  ManagerPage({Key? key}) : super(key: key);

  final ManagerLogic logic = Get.put(ManagerLogic());
  final ManagerState state = Get.find<ManagerLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  // TODO: implement navColor
  Color? get navColor => Colors.white;

  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.black;

  @override
  // TODO: implement navTitleColor
  Color? get navTitleColor => Colors.black;

  @override
  Widget? get leftItem => IconButton(
        icon: Image.asset(
          'assets/new_images/home/back.png',
          width: 12.w,
          height: 18.w,
          color: Colors.black,
        ),
        onPressed: () => Get.back(),
      );

  @override
  List<Widget>? get rightAction => [
        ScalePointWidget(
          icColor: Colors.black,
        ).withPadding(right: 10.w, left: 10.w),
        IconButton(
          icon: Image.asset(
            'assets/new_images/close.png',
            width: 14.w,
            height: 14.w,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        SizedBox(width: 8.w),
      ];

  @override
  Widget? get titleWidget => Text(
        "账户管理",
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
      );

  @override
  Widget initBody(BuildContext context) {
    StackPosition position1 =
        StackPosition(designWidth: 1080, designHeight: 1674, deviceWidth: 1.sw);
    StackPosition position2 =
    StackPosition(designWidth: 1080, designHeight: 1632, deviceWidth: 1.sw);
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/new_images/home/account/manager/segment_1.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              StackPositionGridWidget.custom(
                stackPosition: position1,
                x: 0,
                y: 108,
                bottomMargin: 690,
                crossCount: 1,
                itemCount: 6,
                onItemTap: (index) {
                  if (index == 0) {
                    // 流水打印
                    AppPages.toPrintView();
                  } else if (index == 1) {
                    // 开户行查询
                    Get.toNamed(Routes.khhcx);
                  } else if (index == 2) {
                    // 资信证明
                    Get.to(ZxzmPage());
                  } else if (index == 3) {
                    // 银行卡持有证明
                    Get.toNamed(Routes.holdPagePage);
                  } else if (index == 4) {
                    // 预约换卡
                    Get.toNamed(Routes.yyhk);
                  } else if (index == 5) {
                    // 办卡进度查询
                  }
                }
              ).build(),
              StackPositionGridWidget.custom(
                  stackPosition: position1,
                  x: 0,
                  y: 1087,
                  bottomMargin: 0,
                  crossCount: 1,
                  itemCount: 4,
                  onItemTap: (index) {
                    if (index == 0) {
                      // 添加账户
                      Get.toNamed(Routes.addBank);
                    } else if (index == 1) {
                      // 删除账户
                      Get.toNamed(Routes.sczh);
                    } else if (index == 2) {
                      // 设置首选账户
                    } else if (index == 3) {
                      // 账户展示顺序维护
                    }
                  }
              ).build(),
            ],
          ),
          Stack(
            children: [
              Image.asset(
                'assets/new_images/home/account/manager/segment_2.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              StackPositionGridWidget.custom(
                  stackPosition: position2,
                  x: 0,
                  y: 110,
                  crossCount: 1,
                  itemCount: 10,
                  onItemTap: (index) {
                    if (index == 0) {
                      // 转账限额
                      Get.toNamed(Routes.xesz);
                    } else if (index == 1) {
                      // 账户升降级
                      Get.toNamed(Routes.zhsjj);
                    } else if (index == 2) {
                      // 账户安全锁
                      Get.toNamed(Routes.aqs);
                    } else if (index == 3) {
                      // 管理境外交易
                      Get.toNamed(Routes.gljwjy);
                    } else if (index == 4) {
                      // 解除账户管控
                    } else if (index == 5) {
                      // 账户挂失
                      Get.toNamed(Routes.zhgs);
                    } else if (index == 6) {
                      // 管理附属卡限额
                    } else if (index == 7) {
                      // 借记卡申请
                    } else if (index == 8) {
                      // 账户激活
                    } else if (index == 9) {
                      // 专用账户消费维护
                    }
                  }
              ).build(),
            ],
          ),
        ],
      ),
    );
  }
}
