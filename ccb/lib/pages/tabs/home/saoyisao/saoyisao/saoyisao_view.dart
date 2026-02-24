import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'saoyisao_logic.dart';
import 'saoyisao_state.dart';

class SaoyisaoPage extends BaseStateless {
  SaoyisaoPage({Key? key}) : super(key: key);

  final SaoyisaoLogic logic = Get.put(SaoyisaoLogic());
  final SaoyisaoState state = Get.find<SaoyisaoLogic>().state;
  @override
  bool get isChangeNav => false;
  @override
  Widget? get leftItem => InkWell(
    child:Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Icon(
        Icons.navigate_before,
        size: 30.h,
      ),
    ),
    onTap: () => Get.back(),
  );
  @override
  Color? get navColor =>  Colors.blue;

  _popView(){
    '此功能需要使用【相机】权限，用于选取图片、扫码、人脸识别、拍照录像等。'.dialog(
        title: '权限申请',
        titleColor: Colors.black,
        sure: Text('同意',style: TextStyle(color: Colors.blue),),
        cancel: Text('取消',style: TextStyle(color: Colors.grey),),

        onBack: (v){
          //TODO: 如何点击之后再弹对话框？
          Future.delayed(Duration(milliseconds: 200),(){
            _popView2();
          });

    });
  }

  _popView2(){
    '在设置-应用-中国建设银行-权限中开启相机权限，以正常使用中国建设银行功能'.dialog(
        title: '',
        sure: Text('去设置',style: TextStyle(color: Colors.blue),),
        cancel: Text('取消',style: TextStyle(color: Colors.grey),),
        onBack: (v){
          Get.back();
        });
  }

  @override
  Widget? get titleWidget => Text(
    "扫一扫",
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.white,
    ),
  );
  @override
  List<Widget>? get rightAction => [
    Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 18.w,right: 15.w),
          child: Text('选取本地图',style: TextStyle(color: Colors.white,fontSize: 13.sp),)
        ),
      ],
    )
  ];

  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    _popView();
    return Stack(
      children: [
        Container(
          color: Colors.grey,
        ),
        Positioned(
            top: 10.w, right: 10.w,
            child:
            Column(
              children: [
                Image(image: 'sao_ai'.png3x,width: 80.w,height: 80.w,),
                //Text(' AR识物',style: TextStyle(color: Colors.black,fontSize: 12.sp),)
              ],
            )

        ),
        Positioned(
            left: 48.w, bottom: 34.w,
            child: Column(
    children: [
      Image(image: 'sao_fk'.png3x,width: 32.w,height: 32.w,),
      Text('付款码',style: TextStyle(color: Colors.black,fontSize: 12.sp),)
    ],
    )
        ),
        Positioned(
            right: 48.w, bottom: 34.w,
            child:
          Column(
        children: [
          Image(image: 'sao_sao'.png3x,width: 32.w,height: 32.w,),
        Text('扫一扫',style: TextStyle(color: Colors.black,fontSize: 12.sp),)
      ],
    )
        ),
      ],
    );
  }
}
