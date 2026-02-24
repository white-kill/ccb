import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'card_detail_state.dart';

class CardDetailLogic extends GetxController {
  final CardDetailState state = CardDetailState();


  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    '复制成功'.showToast;
  }


  void changeName(){

    SmartDialog.show(
      usePenetrate: false,
      clickMaskDismiss: false,
      builder: (_) {
        return Container(
          width: 1.sw * 0.88,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8.w),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BaseText(
                text: '设置别名',
                style: TextStyle(
                  fontSize: 15.sp,
                  color:  Colors.blue,
                ),
              ).withPadding(top: 12.w),
              Container(
                height: 42.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  border: Border.all(
                    width: 0.8.w,
                    color: Color(0xffDEDEDE)
                  )
                ),
                padding: EdgeInsets.only(left: 12.w,right: 12.w),
                child: TextFieldWidget(
                  controller: state.textEditingController,
                  hintText: '',
                ),
              ).withPadding(
                  top: 12.w,
                  bottom: 16.w,
                  left: 16.w,
                  right: 16.w),
              Container(
                width: 1.sw * 0.88,
                height: 0.5.w,
                color: const Color(0xffbbbbab),
              ),
              SizedBox(
                height: 42.w,
                width: 1.sw * 0.8,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child:const BaseText(
                            text: '取消',
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
                          child:const BaseText(
                            text: '确定',
                            color: Color(0xFF3040A5),
                          ),
                        ).withOnTap(onTap: () {
                          if(state.textEditingController.text == ''){
                            '请输入别名'.showToast;
                            return;
                          }
                          Http.post(Apis.memberUpdate,data: {
                            'cardAlias':state.textEditingController.text
                          }).then((v){
                            AppConfig.config.balanceLogic.memberInfoData();
                          });
                          SmartDialog.dismiss();
                        })),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

}
