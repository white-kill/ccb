import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/scale_point_widget.dart';
import '../../../../index/index_logic.dart';
import 'detaild_info_logic.dart';
import 'detaild_info_state.dart';

class DetailInfoPage extends BaseStateless {
  DetailInfoPage({Key? key}) : super(key: key, title: '明细详情');

  final DetailInfoLogic logic = Get.put(DetailInfoLogic());
  final DetailInfoState state = Get.find<DetailInfoLogic>().state;


  void jumpPage(String name){
    SmartDialog.dismiss();
    if(name == '建行客服'){
      Get.toNamed(Routes.ccbCustomerPage,);
    }
    if(name == '首页'){
      Get.offAllNamed(Routes.tabs);
      final IndexLogic logic = Get.put(IndexLogic());
      logic.selectIndex(0);
    }
    if(name == '消息'){
      Get.toNamed(Routes.mineMessagePage,);
    }

  }

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_mx_search'.png3x,
      width: 18.w,
      height: 18.w,
    ).withOnTap(onTap: () {
      Get.offNamed(Routes.detailSearchPage);
    }).withPadding(
      right: 20.w,
    ),
    ScalePointWidget(
      left:110.w,
      dx: 60.w,
      width: 130.w,
      content:   ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Map<String,dynamic> data = state.rightDataList[index];
            return Row(
              children: [
                Image(
                  image: data['icon'].toString().png3x,
                  width: 16.w,
                  height: 16.w,
                  color: Colors.black,
                ).withPadding(
                  left: 4.w,
                  right: 10.w,
                ),
                BaseText(
                  text: data['name'],
                  color: Colors.black,
                )
              ],
            ).withContainer(
                padding: EdgeInsets.all(10.w),
                height: 40.w, alignment: Alignment.centerLeft).withOnTap(onTap: (){
              jumpPage(data['name']);
            });
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 1.sw,
              height: 0.5.w,
              color: const Color(0xffdedede),
            );
          },
          itemCount: state.rightDataList.length),
    ).withPadding(right: 16.w),
  ];


  Widget replaceAsterisksWithImages(String text) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i], style:TextStyle(
          fontSize: 14.sp,
      ),));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(image: 'ic_ccb_xin'.png3x,width: 6.w,height: 6.w,).withPadding(
            bottom: 4.w
          ),
          alignment: PlaceholderAlignment.middle,
        ));
      }
    }

    return Text.rich(
      maxLines: 10,
      textAlign: TextAlign.right,
      TextSpan(children: spans),
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (DetailInfoLogic c) {
        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.w),
                      topLeft: Radius.circular(8.w)
                  )
              ),
              height: 120.w,
              margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                    text: state.infoModel1.excerpt,
                    fontSize: 16.sp,
                    color: const Color(0xff333333),
                  ),

                  SizedBox(height: 12.w,),

                  RichText(
                    text: TextSpan(children: [
                      // TextSpan(
                      //     text: logic.type(),
                      //     style: TextStyle(
                      //       fontSize: 28.sp,
                      //         color: Colors.black,
                      //       height: 1
                      //     )),
                      TextSpan(
                          text: " ¥",
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1
                          )),
                      TextSpan(
                          text: logic.type() +  state.infoModel1.amount.bankBalance,
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1
                          )),
                    ]),
                  )
                  // BaseText(
                  //   text:
                  //       '${logic.type()} ¥ ${state.infoModel.amount.bankBalance.replaceAll('-', '')}',
                  //   fontSize: 35.sp,
                  // ),
                ],
              ),
            ),
            ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        constraints: BoxConstraints(
                          minHeight: 45.w,
                        ),
                        padding: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseText(text: state.nameLis[index],
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Color(0Xffbfbfbf),fontSize: 14.sp,
                              ),
                            ),
                            if(state.nameLis[index] == '交易账户' || state.nameLis[index] == '对方账户')
                              replaceAsterisksWithImages(logic.valueName(state.nameLis[index])).withContainer(
                                alignment: Alignment.centerRight,
                                width:  220.w,
                              ),

                            if(state.nameLis[index] != '交易账户' && state.nameLis[index] != '对方账户')
                              BaseText(
                                text: logic.valueName(state.nameLis[index]),
                                maxLines: 10,
                                textAlign: TextAlign.right,
                              ).withSizedBox(width: 220.w)


                          ],
                        ),
                      );
                    },
                    itemCount: state.nameLis.length)
                .withContainer(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.w),
                    bottomLeft: Radius.circular(8.w)
                  )
              ),
                    margin: EdgeInsets.only(left: 12.w, right: 12.w),
            ),


            Container(
              width: 1.sw,
              // height: 60.w,
              margin: EdgeInsets.all(12.w),
              padding: EdgeInsets.only(left: 12.w,top: 12.w,bottom: 12.w,right: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.w))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(text: '备注',color: Color(0Xffbfbfbf)),

                  TextFieldWidget(hintText: '记录点什么',hintStyle: TextStyle(
                    color: Color(0xff333333)
                  ),cursorColor: Color(0xff333333),),

                  Container(
                    width: 1.sw,
                    height: 1.w,
                    color: Color(0xffdedede),
                  )
                ],
              ),
            )
          ],
        );
      },
      id: 'updateUI',
    );
  }
}
