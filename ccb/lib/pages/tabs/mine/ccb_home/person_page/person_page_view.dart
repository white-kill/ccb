import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/app_config.dart';
import '../../../../../routes/app_pages.dart';
import 'person_page_logic.dart';
import 'person_page_state.dart';

class Person_pagePage extends BaseStateless {
  Person_pagePage({Key? key}) : super(key: key,title: '个人中心');

  final Person_pageLogic logic = Get.put(Person_pageLogic());
  final Person_pageState state = Get.find<Person_pageLogic>().state;

  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;


  List titleName = [
    '姓名',
    '邮寄地址',
  ];

  List valueList = [
    AppConfig.config.balanceLogic.memberInfo.bankList.first.realName,
    AppConfig.config.balanceLogic.memberInfo.city,
  ];


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
                Get.back();
              })),
        ],
      ),
    ).withPadding(right: 10.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BaseText(text: titleName[index],).withContainer(
                        width: 100.w,
                      ),

                      BaseText(text:valueList[index])
                    ],
                  ),

                  index == 2?SizedBox.shrink():Icon(Icons.navigate_next,size: 18.w,color: Color(0xff999999),)
                ],
              ).withContainer(
                  height: 50.w,
                  padding: EdgeInsets.only(left: 12.w,right: 12.w)
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1.w,
                margin: EdgeInsets.only(left: 11.w, right: 11.w),
                color: const Color(0xffDDDDDD),
              );
            },
            itemCount: titleName.length).withContainer(
            margin: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.w))
            )
        ),

      ],
    );
  }
}
