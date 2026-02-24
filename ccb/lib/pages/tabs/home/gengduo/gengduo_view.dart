import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/scale_point_widget.dart';
import 'gengduo_logic.dart';
import 'gengduo_state.dart';

class GengduoPage extends BaseStateless {
  GengduoPage({Key? key}) : super(key: key);

  final GengduoLogic logic = Get.put(GengduoLogic());
  final GengduoState state = Get.find<GengduoLogic>().state;


  @override
  Color? get backColor => Colors.black;

  @override
  List<Widget>? get rightAction => [

    ScalePointWidget(
      icColor: Colors.black,
      dx: 35.w,
      left: 80.w,
    ).withPadding(right: 18.w),
  ];

  @override
  Widget? get titleWidget => PlaceholderSearchWidget(
    contentList: ['请输入功能名称进行查询'],
    bgColor: Colors.white,
    border: Border.all(
        width: 1.w,
        color: Color(0xff666666)
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
                Image(image: ('bg_gengduo').png3x),

                Positioned(top: 250.w,left: 85.w,child: Container(
                  width: 1.sw - 85.w,
                  height: 60.w,
                  child: Row(
                    children: [
                      SizedBox(width: 15.w,),
                      Expanded(child: Container().withOnTap(onTap: (){
                        Get.toNamed(Routes.accountPreview);
                      })),
                      Expanded(child: Container().withOnTap(onTap: (){
                        Get.toNamed(Routes.accountDetail);
                      })),
                      Expanded(child: Container().withOnTap(onTap: (){
                        AppPages.toPrintView();
                      })),
                      SizedBox(width: 15.w,)
                    ],
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
