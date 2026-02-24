import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:ccb/config/dio/interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../transfer_record_logic.dart';
import '../transfer_record_state.dart';

class RecordPermanentWidget extends StatefulWidget {
  const RecordPermanentWidget({super.key});

  @override
  State<RecordPermanentWidget> createState() => _RecordPermanentWidgetState();
}

class _RecordPermanentWidgetState extends State<RecordPermanentWidget> {
  final TransferRecordLogic logic = Get.put(TransferRecordLogic());
  final TransferRecordState state = Get.find<TransferRecordLogic>().state;

  List<String> data1 = ['1千以下', '1千-5千', '5千-1万', '1万及以上'];
  List<String> data2 = ['全部', '建行账户', '他行账户', '信用卡', '手机号'];
  List<String> data3 = [
    ' 全部 ',
    '手机银行',
    '个人网银',
  ];

  bool selectName(String name) {
    return state.selList.contains(name);
  }

  Color selectColor(String name, {bool bg = false}) {
    if (bg) {
      if (selectName(name)) return const Color(0xff536FCA).withOpacity(0.05);
      return const Color(0xffF2F2F2);
    } else {
      if (selectName(name)) return const Color(0xff536FCA);
      return Colors.black;
    }
  }

  void removeTitle(List<String> data) {
    for (var e in data) {
      state.selList.remove(e);
    }
  }

  void addName(String name) {
    if (name == '1千以下') {
      state.controller1.text = '0';
      state.controller2.text = '1000';
    }
    if (name == '1千-5千') {
      state.controller1.text = '1000';
      state.controller2.text = '5000';
    }
    if (name == '5千-1万') {
      state.controller1.text = '5000';
      state.controller2.text = '10000';
    }
    if (name == '1万及以上') {
      state.controller1.text = '10000';
      state.controller2.text = '';
    }
    if (state.selList.contains(name)) {
      return;
    } else {
      state.selList.add(name);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    clearData();
  }

  void restData() {
    state.selList.clear();
    state.selList.add('全部');
    state.selList.add(' 全部 ');
    state.controller1.text = '';
    state.controller2.text = '';
    setState(() {});
  }

  void clearData() {
    state.selList.clear();
    state.selList.add(state.redData.accountType == ''?'全部':state.redData.accountType);
    state.selList.add(state.redData.transactionChannel==''?' 全部 ':state.redData.transactionChannel);
    state.controller1.text = state.redData.minAmount;
    state.controller2.text = state.redData.maxAmount;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return Container(
      width: 1.sw * 0.78,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 8, spreadRadius: 0.2)
        ],
      ),
      child: Column(
        children: [
          Container(
            height: navHeight,
            color: const Color(0xff3C6DD3),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, bottom: 10.w),
              child: Icon(Icons.clear, size: 30.h, color: Colors.white),
            ).withOnTap(onTap: () {
              clearData();
              SmartDialog.dismiss(force: true);
            }),
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              BaseText(
                text: '交易金额',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.w,
                    height: 32.w,
                    padding: EdgeInsets.only(left: 6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      border: Border.all(
                        color: const Color(0xffCBCBCB),
                        width: 1.w,
                      ),
                    ),
                    child: TextFieldWidget(
                      hintText: '最低金额',
                      controller: state.controller1,
                      textAlign: TextAlign.center,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xffCBCBCB),
                      ),
                    ),
                  ),
                  Container(
                    width: 8.w,
                    height: 1.w,
                    color: Colors.black,
                    margin: EdgeInsets.only(left: 21.w, right: 21.w),
                  ),
                  Container(
                    width: 100.w,
                    height: 32.w,
                    padding: EdgeInsets.only(left: 6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      border: Border.all(
                        color: const Color(0xffCBCBCB),
                        width: 1.w,
                      ),
                    ),
                    child: TextFieldWidget(
                      hintText: '最高金额',
                      controller: state.controller2,
                      textAlign: TextAlign.center,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xffCBCBCB),
                      ),
                    ),
                  )
                ],
              ).withPadding(top: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffd2d2d2), width: 1.w),
                        image: selectName(data1[index])
                            ? DecorationImage(
                                image: 'ic_zzmx_tag'.png3x,
                                alignment: Alignment.bottomRight,
                                fit: BoxFit.none,
                              )
                            : null,
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data1[index],
                      style: TextStyle(
                        fontWeight: selectName(data1[index])
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectColor(data1[index]),
                        fontSize: 10.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    removeTitle(data1);
                    addName(data1[index]);
                  });
                },
                itemCount: data1.length,
                crossCount: 4,
                mainHeight: 28.w,
                spacing: 15.w,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.w),
                color: const Color(0xFFF7F7F7),
                height: 10.w,
              ),
              BaseText(
                text: '收款账户类型',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffd2d2d2), width: 1.w),
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      image: selectName(data2[index])
                          ? DecorationImage(
                              image: 'ic_zzmx_tag'.png3x,
                              alignment: Alignment.bottomRight,
                              fit: BoxFit.none,
                            )
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data2[index],
                      style: TextStyle(
                        fontWeight: selectName(data2[index])
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectColor(data2[index]),
                        fontSize: 10.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.sx2 = data2[index];
                    removeTitle(data2);
                    addName(data2[index]);
                  });
                },
                itemCount: data2.length,
                crossCount: 3,
                mainHeight: 28.w,
                spacing: 15.w,
              ),
              BaseText(
                text: '交易渠道',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xffd2d2d2), width: 1.w),
                        image: selectName(data3[index])
                            ? DecorationImage(
                                image: 'ic_zzmx_tag'.png3x,
                                alignment: Alignment.bottomRight,
                                fit: BoxFit.none,
                              )
                            : null,
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data3[index],
                      style: TextStyle(
                        fontWeight: selectName(data3[index])
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectColor(data3[index]),
                        fontSize: 10.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.sx3 = data3[index];
                    removeTitle(data3);
                    addName(data3[index]);
                  });
                },
                itemCount: data3.length,
                crossCount: 3,
                mainHeight: 28.w,
                spacing: 15.w,
              ),
            ],
          )),
          Container(
            height: 62.w,
            width: 1.sw,
            margin: EdgeInsets.only(
                top: 10.w, bottom: 10.w + ScreenUtil().bottomBarHeight),
            child: Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                    child: Container(
                  height: 45.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.w)),
                    border: Border.all(
                      color: Color(0xff4A6FCD),
                      width: 1.w,
                    ),
                  ),
                  child: BaseText(
                    text: '重置',
                    fontSize: 16.sp,
                    color: Color(0xff4A6FCD),
                  ),
                ).withOnTap(onTap: () {
                  restData();
                })),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                    child: Container(
                  height: 45.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.w),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff4A6FCD),
                            Color(0xff81AEF4),
                          ])),
                  child: BaseText(
                    text: '确定',
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ).withOnTap(onTap: () {
                  logic.state.redData.pageNum = 1;
                  logic.recordData();
                  SmartDialog.dismiss(force: true);
                })),
                SizedBox(
                  width: 12.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
