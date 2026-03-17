import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/pages/tabs/mine/transfer_record/component/calendar_picker_widget.dart';
import 'package:ccb/pages/tabs/mine/transfer_record/component/record_permanent_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/wb_loading_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../data/model/transfer_record_model.dart';
import 'transfer_record_state.dart';

class TransferRecordLogic extends GetxController {
  final TransferRecordState state = TransferRecordState();


  TransferRecordModel recordModel = TransferRecordModel();
  List<TransferRecordList> modelList = [];
  List<TransferRecordList> originalList = []; // 保存原始数据用于筛选
  
  // 存储每个月份1号的GlobalKey，用于获取滚动位置
  final Map<String, GlobalKey> monthKeys = {};
  // 缓存每个月份的位置信息（月份key -> y坐标）
  final Map<String, double> monthPositions = {};
  
  // 获取显示的时间文本（用于顶部显示）
  String get displayTimeText {
    if (state.title2 == '自定义' && 
        state.redData.beginTime.isNotEmpty && 
        state.redData.endTime.isNotEmpty) {
      String beginTime = state.redData.beginTime.replaceAll('-', '/');
      String endTime = state.redData.endTime.replaceAll('-', '/');
      return '$beginTime\n-$endTime';
    }
    return state.title2;
  }
  
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
    Map<String, dynamic> queryParameters = state.redData.toJson();
    queryParameters['transactionChannel'] = state.sx3..replaceAll(' ', '');
    Http.get(Apis.transferPage,queryParameters: queryParameters).then((v){
      recordModel = TransferRecordModel.fromJson(v);
      state.refreshController.loadComplete();
      if(!recordModel.list.isNotEmpty){
        state.refreshController.loadNoData();
      }
      if(state.redData.pageNum == 1){
        originalList = recordModel.list;
        modelList = recordModel.list;
      }else{
        originalList = originalList + recordModel.list;
        modelList = modelList + recordModel.list;
      }
      // 应用当前搜索条件
      filterData(state.searchController.text);
    });
  }
  
  /// 本地数据筛选
  void filterData(String keyword) {
    if (keyword.isEmpty) {
      modelList = List.from(originalList);
    } else {
      String lowerKeyword = keyword.toLowerCase();
      modelList = originalList.where((item) {
        // 搜索收款户名
        bool matchName = item.oppositeName.toLowerCase().contains(lowerKeyword);
        // 搜索账号
        bool matchAccount = item.oppositeAccount.replaceAll(' ', '').contains(keyword.replaceAll(' ', ''));
        // 如果有手机号字段，可以添加: bool matchPhone = item.phone?.contains(keyword) ?? false;
        // 如果有附言字段，可以添加: bool matchRemark = item.remark?.toLowerCase().contains(lowerKeyword) ?? false;
        
        return matchName || matchAccount;
      }).toList();
    }
    update(['updateUI']);
  }
  
  /// 搜索框输入变化
  void onSearchChanged(String value) {
    filterData(value);
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
    var list = ['当天', '七天', '一个月', '近3月', '近6月', '自定义'];
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
          ).withOnTap(onTap: () {
            print(index);
            // 如果点击的是"自定义"，弹出日历选择器
            if (index == 5) {
              SmartDialog.dismiss();
              openCalendarPicker();
            } else {
              state.title2 = list[index];
              updateTime();
              SmartDialog.dismiss();
              update(['updateTop']);
            }
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
    state.redData.pageNum = 1;
    recordData();
  }


  void openPermanentDialog() {
    SmartDialog.show(
      permanent: true,
      alignment: Alignment.bottomCenter,
      usePenetrate: false,
      builder: (_) {
        return const RecordPermanentWidget();
      },
    );
  }

  void openCalendarPicker() {
    SmartDialog.show(
      permanent: true,
      alignment: Alignment.centerRight,
      usePenetrate: false,
      builder: (_) {
        return const CalendarPickerWidget();
      },
    );
  }
}
