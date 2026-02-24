import 'package:ccb/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../utils/long_press_five_seconds.dart';
import '../../../../../../../utils/scale_point_widget.dart';
import 'khhxc_info_logic.dart';
import 'khhxc_info_state.dart';

class KhhxcInfoPage extends BaseStateless {
  KhhxcInfoPage({Key? key}) : super(key: key);

  final Khhxc_infoLogic logic = Get.put(Khhxc_infoLogic());
  final Khhxc_infoState state = Get.find<Khhxc_infoLogic>().state;


  @override
  Widget? get titleWidget => LongPressFiveSeconds(onLongPressCompleted: () {
    logic.longWidget();
  }, child: BaseText(
      text: '开户行查询',
      fontSize: 18.sp,
      color:  navTitleColor ?? titleColor ?? Colors.black),);

  @override
  List<Widget>? get rightAction => [
    const ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
    IconButton(
      icon: Image.asset('assets/new_images/close.png',
          width: 14.w, height: 14.w),
      onPressed: () => Get.back(),
    ),
    SizedBox(width: 8.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(builder: (Khhxc_infoLogic c){
      return ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Image(image: 'khhcx_info'.png3x),
              Column(
                children: [
                  Container(
                    width: 1.sw - 180.w,
                    height: 60.w,
                    alignment: Alignment.centerLeft,
                    child: BaseText(
                      text: AppConfig.config.balanceLogic.card(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                        fontFamily: 'PingFangSC',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 1.sw - 185.w,
                    height: 116.w,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: 20.w),
                    child: BaseText(
                      text:logic.controller1.text == ''?AppConfig.config.balanceLogic.openOutlets():logic.controller1.text,
                      maxLines: 4,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                        fontFamily: 'PingFangSC',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 1.sw - 185.w,
                    height: 60.w,
                    alignment: Alignment.centerLeft,
                    child:  BaseText(
                      text: logic.controller2.text == ''?'105791011846':logic.controller2.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                        fontFamily: 'PingFangSC',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 1.sw - 185.w,
                    height: 60.w,
                    alignment: Alignment.centerLeft,
                    child: BaseText(
                      text:logic.controller3.text == ''?AppConfig.config.balanceLogic.openOutlets():logic.controller3.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                        fontFamily: 'PingFangSC',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 1.sw - 185.w,
                    height: 60.w,
                    alignment: Alignment.centerLeft,
                    child: BaseText(
                      text: logic.controller4.text == ''?'86-029-85656704':logic.controller4.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                        fontFamily: 'PingFangSC',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ).withContainer(
                margin: EdgeInsets.only(left: 125.w),
              )
            ],
          )
        ],
      );
    },id: 'updateUI',);
  }
}
