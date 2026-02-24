import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../utils/sp_util.dart';
import '../../../../turnover_print/component/alter_widget.dart';
import 'khhxc_info_state.dart';

class Khhxc_infoLogic extends GetxController {
  final Khhxc_infoState state = Khhxc_infoState();


  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    String content = editKhhxcContent;
    if(content != ''){
      Map<String, dynamic> map = json.decode(content);
      controller1.text = map['c1']??'';
      controller2.text = map['c2']??'';
      controller3.text = map['c3']??'';
      controller4.text = map['c4']??'';
    }
  }
  void longWidget(){
    AlterWidget.alterWidget(clickMaskDismiss: false,builder: (context) {
      return Container(
        width: 1.sw,
        height: 1.sh,
        padding: EdgeInsets.only(bottom: 60.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1.sw * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.w))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 12.w,),
                  BaseText(text: '编辑信息',style: TextStyle(
                      fontSize: 15.w
                  ),),
                  SizedBox(height: 8.w,),
                  TextFieldWidget(
                    hintText: '请输入网点',
                    controller: controller1,
                  ).withContainer(
                      margin: EdgeInsets.only(left: 12.w,right: 12.w),
                      padding: EdgeInsets.only(left: 12.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffdedede),
                              width: 0.5.w
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      )
                  ),
                  SizedBox(height: 10.w,),
                  TextFieldWidget(
                    hintText: '请输入支付系统号',
                    controller: controller2,
                  ).withContainer(
                      margin: EdgeInsets.only(left: 12.w,right: 12.w),
                      padding: EdgeInsets.only(left: 12.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffdedede),
                              width: 0.5.w
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      )
                  ),
                  SizedBox(height: 10.w,),
                  TextFieldWidget(
                    hintText: '请输入网点地址',
                    controller: controller3,
                  ).withContainer(
                      margin: EdgeInsets.only(left: 12.w,right: 12.w),
                      padding: EdgeInsets.only(left: 12.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffdedede),
                              width: 0.5.w
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      )
                  ),
                  SizedBox(height: 10.w,),
                  TextFieldWidget(
                    hintText: '请输入联系电话',
                    controller: controller4,
                  ).withContainer(
                      margin: EdgeInsets.only(left: 12.w,right: 12.w),
                      padding: EdgeInsets.only(left: 12.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffdedede),
                              width: 0.5.w
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      )
                  ),
                  SizedBox(height: 10.w,),
                  Container(
                    width: 1.sw * 0.88,
                    height: 0.5.w,
                    color: const Color(0xffbbbbab),
                  ),
                  SizedBox(
                    height: 46.w,
                    width: 1.sw * 0.8,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: BaseText(
                                text: '取消',
                                fontSize: 16.sp,
                                color: Color(0xFF666666),
                              ),
                            ).withOnTap(onTap: () {
                              SmartDialog.dismiss();
                            })),
                        Container(
                          width: 0.5.w,
                          height: 42.w,
                          color: const Color(0xffbbbbab),
                        ),
                        Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: BaseText(
                                text: '确定',
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ).withOnTap(onTap: () {
                              Map<String,dynamic> data = {
                                'c1':controller1.text,
                                'c2':controller2.text,
                                'c3':controller3.text,
                                'c4':controller4.text,
                              };
                              String d = json.encode(data);
                              d.saveEditKhhxc;
                              update(['updateUI']);
                              SmartDialog.dismiss();
                            })),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
