import 'package:ccb/pages/tabs/mine/account_preview/card_detail/children/khhxc_info/khhxc_info_view.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';


class KhhcxPage extends BaseStateless {
  KhhcxPage({Key? key}) : super(key: key);

  final KhhcxLogic logic = Get.put(KhhcxLogic());
  final KhhcxState state = Get.find<KhhcxLogic>().state;
  @override
  bool get isChangeNav => false;

  @override
  // TODO: implement navColor
  Color? get navColor => Color(0xFF006CBE);

  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.white;

  @override
  // TODO: implement navTitleColor
  Color? get navTitleColor => Colors.white;


  @override
  Widget? get leftItem => IconButton(
    icon: Image.asset(
      'assets/new_images/home/back.png',
      width: 12.w,
      height: 18.w,
      color: Colors.white,
    ),
    onPressed: () => Get.back(),
  );

  @override
  List<Widget>? get rightAction => [

    ScalePointWidget(
      icColor: Colors.white,
    ).withPadding(right: 10.w, left: 10.w),
    IconButton(
      icon: Image.asset('assets/new_images/close.png', width: 14.w, height: 14.w, color: Colors.white,),
      onPressed: () => Get.back(),
    ),
    SizedBox(width: 8.w),
  ];


  @override
  Widget? get titleWidget => Text(
    "开户行查询",
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.white,
    ),
  );

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/new_images/home/account/detail/children/khhcx.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top: screenWidth/3240 * 6102 * 0.035,
                left: screenWidth * 0.3,
                child: Text(getBankNo(), style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black.withAlpha(200),
                ),),
              ),

              Positioned(top: 170.w,left:( 1.sw*0.4)/2,child: Container(
                width: 1.sw *0.6,
                height: 50.w,
              ).withOnTap(onTap: (){
                Get.to(() => KhhxcInfoPage());
              }))
            ],
          ),

        ],
      ),
    );
  }
}