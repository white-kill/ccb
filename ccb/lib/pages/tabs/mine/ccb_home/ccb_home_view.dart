import 'package:ccb/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import 'ccb_home_logic.dart';
import 'ccb_home_state.dart';

class CcbHomePage extends BaseStateless {
  CcbHomePage({Key? key}) : super(key: key, title: '建行到家');

  final CcbHomeLogic logic = Get.put(CcbHomeLogic());
  final CcbHomeState state = Get.find<CcbHomeLogic>().state;

  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Widget? get leftItem => const SizedBox.shrink();

  @override
  List<Widget>? get rightAction => [
    Container(
      width: 85.w,
      height: 32.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 'ic_min_right'.png3x,
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: Container().withOnTap(onTap: () {
                BaseBottomSheet.sheetContentWidget(
                    bgColor: const Color.fromARGB(255, 240, 240, 240),
                    topWidget: Image(
                      image: 'ic_jhdj_left1'.png3x,
                    ).withPadding(left: 12.w, right: 12.w).withContainer(
                      height: 68.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 1.sw,
                          height: 0.5.w,
                          color: const Color.fromARGB(255, 235, 235, 235),
                        ),

                        Image(
                          image: 'ic_jhdj_left2'.png3x,
                        ).withPadding(left: 12.w, right: 12.w),

                        Container(
                          height: 42.w,
                          alignment: Alignment.center,
                          child: BaseText(
                            text: "取消",
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ).withOnTap(onTap: () {
                          Get.back();
                        }),
                      ],
                    ));
                // Get
              })),
          Expanded(
              child: Container().withOnTap(onTap: () {
                Get.offAllNamed(Routes.tabs);
              })),
        ],
      ),
    ).withPadding(right: 10.w),
  ];
  void jumpPage(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.mineProvePage);
        return;
      case 1:
        Get.toNamed(Routes.turnoverPrintPage,arguments: {
          'isBack':true,
        });
      case 2:
        Get.toNamed(Routes.holdPagePage);
        return;
      case 3:
        '交易出错，\n[ERRORCODE-YDCA02019628]\n[没有对应的贷款账户]'
            .dialog(title: '提示', showCancel: false,titleColor: Colors.black);
        return;
      case 4:
        '交易出错，\n[ERRORCODE-YDCA02019628]\n[没有对应的贷款账户]'
            .dialog(title: '提示', showCancel: false,titleColor: Colors.black);
        return;
      case 5:
        '交易出错，\n[ERRORCODE-YDCA02813000]\n[@@持卡人信息@@记录不存在]'
            .dialog(title: '提示', showCancel: false,titleColor: Colors.black);
        return;
      case 6:
        '交易出错，\n[ERRORCODE-YDCA02813000]\n[@@持卡人信息@@记录不存在]'
            .dialog(title: '提示', showCancel: false,titleColor: Colors.black);
        return;
      case 7:
        return;
      case 8:
        '交易出错，\n[ERRORCODE-YDCA02813000]\n[@@持卡人信息@@记录不存在]'
            .dialog(title: '提示', showCancel: false,titleColor: Colors.black);
        return;
      default:
        return;
    }
  }

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 120.w,
          margin: EdgeInsets.only(top: 12.w, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
              color: const Color(0xff283CB1),
              borderRadius: BorderRadius.all(Radius.circular(8.w))),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: 'ic_jdcx'.png3x,
                      width: 32.w,
                      height: 32.w,
                    ),
                    SizedBox(
                      height: 16.w,
                    ),
                    BaseText(
                      text: '进度查询',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ).withOnTap(
                  onTap: () {
                    Get.toNamed(Routes.printProgressPage);
                  },
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: 'ic_grzx'.png3x,
                    width: 32.w,
                    height: 32.w,
                  ),
                  SizedBox(
                    height: 16.w,
                  ),
                  BaseText(
                    text: '个人中心',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ).withOnTap(onTap: (){
                Get.toNamed(Routes.personPagePage);
                  })),
            ],
          ),
        ),
        Container(
          height: 50.w,
          margin: EdgeInsets.only(top: 12.w, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.w),
                  topRight: Radius.circular(8.w))),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: 13.w,
                  ),
                  Image(
                    image: 'card_position'.png3x,
                    width: 12.w,
                    height: 16.w,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  BaseText(
                    text: '${AppConfig.config.balanceLogic.memberInfo.city}市',
                    fontSize: 15.sp,
                  ),
                  Image(
                    image: 'ic_zh_mx_next'.png3x,
                    width: 25.w,
                    height: 25.w,
                  )
                ],
              )),
              Container(
                width: 328.w,
                height: 1.w,
                color: Color(0xffDDDDDD),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.w),
                bottomRight: Radius.circular(8.w),
              )),
          margin: EdgeInsets.only(left: 12.w, right: 12.w),
          child: VerticalGridView(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            widgetBuilder: (_, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: 'ic_jhhome_$index'.png3x,
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  BaseText(
                    text: state.fList[index]['name'],
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xff575757),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ).withOnTap(onTap: () => jumpPage(index));
            },
            itemCount: state.fList.length,
            crossCount: 4,
            mainHeight: 90.w,
            spacing: 5.w,
          ).withContainer(padding: EdgeInsets.only(top: 20.w)),
        ),
      ],
    );
  }
}
