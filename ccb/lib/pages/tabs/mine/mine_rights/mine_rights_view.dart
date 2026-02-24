import 'package:ccb/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../utils/scale_point_widget.dart';
import 'mine_rights_logic.dart';
import 'mine_rights_state.dart';

class MineRightsPage extends BaseStateless {
  MineRightsPage({Key? key}) : super(key: key,title: '权益中心');

  final MineRightsLogic logic = Get.put(MineRightsLogic());
  final MineRightsState state = Get.find<MineRightsLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Color? get navColor => Get.arguments?['navColor'] ?? Colors.white;



  @override
  List<Widget>? get rightAction => [

    Obx(()=>ScalePointWidget(
      icColor: logic.navActionColor.value,
    ).withPadding(right: 6.w),),


    Obx(()=> Icon(
      Icons.clear,
      color: logic.navActionColor.value,
    ).withOnTap(onTap: () {
      Get.back();
    }).withPadding(
      right: 16.w,
    ))
  ];

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
    logic.navActionColor.value = v
        ? Colors.black
        :  Colors.black;
  };

  @override
  Color? get titleColor => Colors.black;
  
  
  String getData(String name){
    if(name == '综合积分'){
      return AppConfig.config.balanceLogic.memberInfo.points;
    }
    if(name == '优惠券'){
      return AppConfig.config.balanceLogic.memberInfo.couponsNum;
    }
    if(name == '信用卡权益'){
      return AppConfig.config.balanceLogic.memberInfo.credit;
    }
    return '0';
  }

  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Stack(
          children: [
            Image(
              width: 1.sw,
              image: 'bg_xykqy_new'.png3x,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
                left: 0,
                top:navHeight + 10.w,
                child: VerticalGridView(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
                  widgetBuilder: (_, index) {
                    return Column(
                      children: [
                        BaseText(text: getData(state.dataList[index]),style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),),
                        BaseText(text: state.dataList[index]),
                      ],
                    );
                  },
                  itemCount: state.dataList.length,
                  crossCount: 4,
                  mainHeight: 50.w,
                  spacing: 15.w,
                ).withContainer(
                  height: 50.w,
                  width: 1.sw,
                ),
            )
          ],
        )
      ],
    ).withContainer(
      width: 1.sw,
      height: 1.sh,
    );
  }
}
