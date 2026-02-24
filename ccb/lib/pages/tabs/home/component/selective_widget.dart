import 'package:card_swiper/card_swiper.dart';
import 'package:ccb/utils/common_right_button.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';

class SelectiveWidget extends StatefulWidget {
  const SelectiveWidget({super.key});

  @override
  State<SelectiveWidget> createState() => _SelectiveWidgetState();
}

class _SelectiveWidgetState extends State<SelectiveWidget> {



  void jumpPage(String name){
    if(name == '2' || name == '3' ){
      Get.toNamed(Routes.changeNavPage, arguments: {
        'title': '龙钱包2号',
        'image': 'bg_lqb2h',
        'defTitleColor': Colors.black
      });
    }

    if(name == '财富活动'){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '主会场',
        'image': 'cfhd_1',
      });
    }

    if(name == '养老规划' ){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': name,
        'image': 'ylgh_1',
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375.w,
          height: 334.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffF6FCFF).withOpacity(0.2),
                blurRadius: 12,
                spreadRadius: 0.5,
                offset: const Offset(0, 1),
              ),
            ],
            image: DecorationImage(
              image: 'bg_home_selective'.png3x,
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 75.w,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(
                    left: 16.w,
                  ),child: Container(
                    width: 172.w,
                    height: 196.w,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image(
                          image: 'cfjx_$index'.png3x,
                          width: 172.w,
                          height: 196.w,
                          fit: BoxFit.fill,
                        ).withOnTap(onTap: () {
                          if (index == 0) {
                            Get.toNamed(Routes.changeNavPage, arguments: {
                              'title': '龙钱包2号',
                              'image': 'bg_lqb2h',
                              'defTitleColor': Colors.black,
                              'rightWidget': Row(
                                children: [
                                  CommonRightButton.build([
                                    RightButtonConfig(
                                      type: RightButtonType.more,
                                      iconColor: Colors.black,
                                    ),

                                  ]).first,
                                  CommonRightButton.build([
                                    RightButtonConfig(
                                      type: RightButtonType.customer,
                                      iconColor: Colors.black,
                                    ),
                                  ]).first,
                                ]


                              ),
                            });
                          } else if (index == 1) {
                            Get.toNamed(Routes.changeNavPage, arguments: {
                              'title': '理财产品',
                              'image': 'home_ad_banner_1_view',
                              'bottomImage': 'home_ad_banner_1_bottom',
                              'defTitleColor': Colors.black,
                              'rightWidget': CommonRightButton.build([
                                RightButtonConfig(
                                  type: RightButtonType.customer,
                                  iconColor: Colors.black,
                                ),
                              ]).first,
                            });
                          } else if (index == 2) {
                            Get.toNamed(Routes.changeNavPage, arguments: {
                              'title': '理财产品',
                              'image': 'home_ad_banner_2_view',
                              'bottomImage': 'home_ad_banner_2_bottom',
                              'defTitleColor': Colors.black,
                              'rightWidget': CommonRightButton.build([
                                RightButtonConfig(
                                  type: RightButtonType.customer,
                                  iconColor: Colors.black,
                                ),
                              ]).first,
                            });
                          } else if (index == 3) {
                            Get.toNamed(Routes.changeNavPage, arguments: {
                              'title': '理财产品',
                              'image': 'home_ad_banner_3_view',
                              'bottomImage': 'home_ad_banner_3_bottom',
                              'defTitleColor': Colors.black,
                              'rightWidget': CommonRightButton.build([
                                RightButtonConfig(
                                  type: RightButtonType.customer,
                                  iconColor: Colors.black,
                                ),
                              ]).first,
                            });
                          }
                        });
                      },
                      itemCount: 4,
                      autoplay: true,
                    ),
                  ),).withOnTap(onTap: (){
                    jumpPage('1');
                  }),

                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10.w,bottom: 5.w),
                        child:  Container(
                          width: 160.w,
                          height: 85.w,
                        ),
                      ).withOnTap(onTap: (){
                        jumpPage('2');
                      }),
                      Padding(padding: EdgeInsets.only(left: 10.w),
                        child: Container(
                          width: 160.w,
                          height: 85.w,
                        ),
                      ).withOnTap(onTap: (){
                        jumpPage('3');
                      }),

                    ],
                  )
                ],
              ),

              Padding(padding: EdgeInsets.only(left: 30.w,right: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      width: 100.w,
                      height: 34.w,
                    ).withOnTap(onTap: (){
                      jumpPage('财富体检');
                    }),

                    SizedBox(
                      width: 100.w,
                      height: 34.w,
                    ).withOnTap(onTap: (){
                      jumpPage('养老规划');
                    }),

                    SizedBox(
                      width: 100.w,
                      height: 34.w,
                    ).withOnTap(onTap: (){
                      jumpPage('财富活动');
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: screenWidth/1125 * 1002 * 0.05,
          left: screenWidth * 0.1,
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.cftj);
            },
            child: Container(
              width: screenWidth / 12 * 3,
              height: 50,
            ),
          ),
        )

      ],
    );
  }


  Widget _tagWidget(String path,String name){

    return Row(
      children: [
        Image(image: path.png3x,width: 17.w,height: 17.w,),
        SizedBox(width: 2.w,),
        BaseText(text: name,fontSize: 13.sp,)
      ],
    );
  }


  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
}){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}
