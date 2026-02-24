import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/dio/network.dart';
import '../../../../../config/net_config/apis.dart';
import '../../../../../data/model/transfer_record_model.dart';
import '../component/person_permanent_widget.dart';
import 'person_transfer_state.dart';

class PersonTransferLogic extends GetxController {
  final PersonTransferState state = PersonTransferState();


  TransferRecordModel recordModel = TransferRecordModel();
  List<TransferRecordList> modelList = [];
  @override
  void onInit() {
    super.onInit();
    recordData();
  }


  void recordData(){
    state.redData.maxAmount = state.controller2.text;
    state.redData.minAmount = state.controller1.text;
    state.redData.accountType = state.sx2;
    state.redData.transactionChannel = state.sx3;
    state.redData.oppositeAccount = Get.arguments?['oppositeAccount']??'';
    Map<String, dynamic> queryParameters = state.redData.toJson();
    queryParameters['transactionChannel'] = state.sx3..replaceAll(' ', '');
    Http.get(Apis.transferPage,queryParameters: queryParameters).then((v){
      recordModel = TransferRecordModel.fromJson(v);
      if(state.redData.pageNum == 1){
        modelList = recordModel.list;
      }else{
        modelList = modelList + recordModel.list;
      }
      update(['updateUI']);
    });
  }


  void attachA(BuildContext context,String type) {
    // SmartDialog.showLoading(builder: (_) => WbLoadingWidget(image: 'ic_loading'.png3x,));
    SmartDialog.showAttach(
      targetContext: context,
      alignment: Alignment.bottomCenter,
      highlightBuilder: (Offset targetOffset, Size targetSize) {
        return Positioned(
          child: Container(
            height: targetOffset.dy + targetSize.height,
            width: targetSize.width,
            color: Colors.white,
          ),
        );
      },
      builder: (_) => type == '1'?_listDialog1():_listDialog2(),
    );
  }



  Widget _listDialog1() {
    return Container(
      width: 1.sw,
      height: (state.bankList.length * 45).w,
      color: Colors.white,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return  Divider(
            color: const Color(0xff999999),
            height: 1.w,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return BaseText(
            text:index == 0?state.bankList[index]:state.bankList[index].toString().maskBankCardNumber(),
            fontSize: 12.sp,
            color: state.title1 == state.bankList[index]?const Color(0xff3C6DD3):Colors.black,
          ).withContainer(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12.w),
            height: 45.w,
          ).withOnTap(onTap: (){
            state.title1 = state.bankList[index];
            SmartDialog.dismiss();
            update(['updateTop']);
          });
        }, itemCount: state.bankList.length + 1,
      ),
    );
  }

  Widget _listDialog2() {
    var list = ['当天', '七天', '一个月', '近三个月', '近六个月'];
    return Container(
      width: 1.sw,
      height: (list.length * 45).w + 6.w,
      color: Colors.white,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return  Divider(
            color: const Color(0xff999999),
            height: 1.w,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return BaseText(
            text: list[index],
            fontSize: 12.sp,
            color: state.title2 == list[index]?const Color(0xff3C6DD3):Colors.black,
          ).withContainer(
              alignment: Alignment.centerLeft,
              height: 45.w,
              padding: EdgeInsets.only(left: 12.w)
          ).withOnTap(onTap: (){
            state.title2 = list[index];
            updateTime();
            SmartDialog.dismiss();
            update(['updateTop']);
          });
        }, itemCount: list.length + 1,
      ),
    );
  }

  void updateTime(){
    String bTime = DateUtil.formatDate(state.getDateRange(state.title2).first, format: DateFormats.y_mo_d);
    String eTime = DateUtil.formatDate(state.getDateRange(state.title2).last, format: DateFormats.y_mo_d);
    state.redData.beginTime = bTime;
    state.redData.endTime = eTime;
    recordData();
  }


  void openPermanentDialog() {
    SmartDialog.show(
      permanent: true,
      alignment: Alignment.centerRight,
      usePenetrate: false,
      builder: (_) {
        return const PersonPermanentWidget();
      },
    );
  }
}
