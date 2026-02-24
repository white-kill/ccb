import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/data/model/apply_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'print_record_state.dart';

class PrintRecordLogic extends GetxController {
  final PrintRecordState state = PrintRecordState();




  @override
  void onInit() {
    super.onInit();
    applyPage();
  }


  void applyPage({bool isRef = true}){
    var data =  {
      'pageNum':state.pageNum,
      'pageSize':10,
      'detailType':state.title3 == '全部类型'?'':state.title3,
      'dateTime':state.title1
    };
    Http.get(Apis.applyPage,queryParameters:data).then((v){
      if(v != null){
        state.listModel = ApplyListModel.fromJson(v);
        if(isRef){
          state.list = state.listModel.list;
          state.refreshController.refreshCompleted();
        }else{
          if(state.listModel.list.isEmpty){
            state.refreshController.loadNoData();
          }else {
            state.refreshController.loadComplete();
          }
          state.list = state.list + state.listModel.list;
        }

        update(['updateUI']);
      }
    });
  }

  String valueName(String name,ApplyListList model) {
    switch (name) {
      case '当前状态':
        return model.status;
      case '申请时间':
        return model.createTime;
      case '申请账户':
        return model.bankCard;
      case '明细类型':
        return model.detailType;
      case '查询时段':
        return model.dateTimeRange;
      case '解压密码':
        return model.code;
      case '接收邮箱':
        return model.email;
      default:
        return '';
    }
  }

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    '复制成功'.showToast;
  }
  void attachA(BuildContext context,String type) {
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
      builder: (_) {
        if(type == '1'){
          return _listDialog1();
        }
        if(type == '2'){
          return _listDialog2();
        }
        if(type == '3'){
          return _listDialog3();
        }
        return Container();
      },
    );
  }



  Widget _listDialog1() {
    var list = [ '一个月', '三个月', '六个月', '一年', '两年', '五年'];
    return Container(
      width: 1.sw,
      height: (list.length * 45).w,
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
            state.title1 = list[index];
            applyPage();
            SmartDialog.dismiss();
            update(['updateTop']);
          });
        }, itemCount: list.length + 1,
      ),
    );
  }

  Widget _listDialog2() {
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
            state.title2 = state.bankList[index];
            applyPage();
            SmartDialog.dismiss();
            update(['updateTop']);
          });
        }, itemCount: state.bankList.length + 1,
      ),
    );
  }


  Widget _listDialog3() {
    var list = [ '全部类型', '全部明细', '工资明细', '收入明细', '支出明细'];
    return Container(
      width: 1.sw,
      height: (list.length * 45).w,
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
            state.title3 = list[index];
            applyPage();
            SmartDialog.dismiss();
            update(['updateTop']);
          });
        }, itemCount: list.length + 1,
      ),
    );
  }

}
