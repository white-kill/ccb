import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/scale_point_widget.dart';
import 'seal_select_logic.dart';
import 'seal_select_state.dart';

class SealSelectView extends BaseStateless {
  SealSelectView({Key? key}) : super(key: key, title: '印章查验');

  final SealSelectLogic logic = Get.put(SealSelectLogic());
  final SealSelectState state = Get.find<SealSelectLogic>().state;

  @override
  List<Widget>? get rightAction => [
        ScalePointWidget(
          icColor: Colors.black,
        ).withPadding(right: 6.w),
        Icon(
          Icons.clear,
          color: Colors.black,
        ).withOnTap(onTap: () {
          Get.back();
        }).withPadding(
          right: 16.w,
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 12.w,
            top: 10.w,
            bottom: 6.w,
            right: 12.w,
          ),
          height: 115.w,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: '电子印章',
                      fontSize: 18.sp,
                    ),


                    SizedBox(
                      height: 5.w,
                    ),
                    BaseText(
                      text: '查验交易与业务办理凭证、回单等资料加盖的电子印章',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff656565),
                          height: 2
                      ),
                      maxLines: 3,
                    )
                  ],
                ).withPadding(left: 12.w),
              ),
              Container(
                width: 64.w,
                height: 25.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.w),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff4274D5),
                      Color(0xff3982F6),
                    ],
                  ),
                ),
                child: BaseText(text: '去查验',fontSize: 12.sp,color: Colors.white,),
              ).withPadding(left: 60.w, right: 12.w).withOnTap(onTap: (){
                Get.toNamed(Routes.sealPage);
              })
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 12.w,
            top: 10.w,
            bottom: 6.w,
            right: 12.w,
          ),
          height: 115.w,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: '合同专用章',
                      fontSize: 18.sp,
                    ),

                    SizedBox(
                      height: 5.w,
                    ),
                    BaseText(
                      text: '查验协议(合同)文本加盖的电子合同专用章',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff656565),
                        height: 2
                      ),
                      maxLines: 3,
                    )
                  ],
                ).withPadding(left: 12.w),
              ),
              Container(
                width: 64.w,
                height: 25.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.w),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff4274D5),
                      Color(0xff3982F6),
                    ],
                  ),
                ),
                child: BaseText(text: '去查验',fontSize: 12.sp,color: Colors.white,),
              ).withPadding(left: 60.w, right: 12.w).withOnTap(onTap: (){
                Get.toNamed(Routes.sealReviewPage);
              })
            ],
          ),
        ),
      ],
    );
  }
}
