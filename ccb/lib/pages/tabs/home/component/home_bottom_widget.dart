import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';

class HomeBottomWidget extends StatefulWidget {
  const HomeBottomWidget({super.key});

  @override
  State<HomeBottomWidget> createState() => _HomeBottomWidgetState();
}

class _HomeBottomWidgetState extends State<HomeBottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.w,
      width: 1.sw,
      color: Color(0xffF2FBFD),
      child: Column(
        children: [

          Container(
            width: 350.w,
            height: 48.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: 'ic_bottom_xx'.png3x,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image(image: 'ic_bottom_add'.png3x,width: 14.w,height: 14.w,),
              SizedBox(width: 5.w,),
              BaseText(text: '定制服务',fontSize: 15.sp,color: Color(0xff2641A8 ),)
            ],),
          ).withOnTap(onTap: (){
            Get.toNamed(Routes.fixedNavPage, arguments: {
              'title': '投诉指南',
              'image': 'home_dz',
              'rightTitle':"保存"
            });
          }),

          Row(
            children: [
              SizedBox(width: 65.w,),
              Column(
                children: [
                  BaseText(text: '多彩消保',fontSize:15.sp ,color: Color(0xff2E3231),),
                  BaseText(text: '学习金融知识',fontSize:10.sp ,color: Color(0xff5F6467),),
                ],
              ).withOnTap(onTap: (){

                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '多彩消保',
                  'image': 'home_dc',
                  'rightItem':"1"
                });
              }),
              SizedBox(width: 65.w,),

              Container(
                width: 1.w,
                height: 30.w,
                color: Color(0xffD8DDE0),
              ),
              SizedBox(width: 65.w,),

              Column(
                children: [
                  BaseText(text: '投诉指南',fontSize:15.sp ,color: Color(0xff2E3231),),
                  BaseText(text: '多种投诉渠道',fontSize:10.sp ,color: Color(0xff5F6467),),
                ],
              ).withOnTap(onTap: (){
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '投诉指南',
                  'image': 'home_tx',
                  'rightItem':"0"
                });
              }),

            ],
          ).withContainer(
            width: 1.sw,
            padding: EdgeInsets.only(top: 25.w)
          )
        ],
      ),
    );
  }
}
