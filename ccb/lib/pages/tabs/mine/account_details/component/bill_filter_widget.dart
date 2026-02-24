import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_details_logic.dart';
import '../account_details_state.dart';

class BillFilterWidget extends StatefulWidget {
  const BillFilterWidget({super.key});

  @override
  State<BillFilterWidget> createState() => _BillFilterWidgetState();
}

class _BillFilterWidgetState extends State<BillFilterWidget> {
  final AccountDetailsLogic logic = Get.put(AccountDetailsLogic());
  final AccountDetailsState state = Get.find<AccountDetailsLogic>().state;

  List<String> data1 = ['1千以下', '1千-5千', '5千-1万', '1万及以上'];

  List<String> data2 = ['全部', '收入', '支出'];

  List<String> data3 = [];

  List<String> data3_1 = [
    '工资',
    '报销',
    '转账存入',
    '消费',
    '转出',
    '还款',
    '利息',
    '退货',
    '存款',
    '转账支取',
    '取款',
  ];
  List<String> data3_2 = [
    '工资',
    '报销',
    '转账存入',
    '利息',
    '退货',
    '存款',
  ];
  List<String> data3_3 = [
    '转出',
    '还款',
    '消费',
    '转账支取',
    '取款',
  ];

  // List<String> data4 = ['银行', '支付宝', '微信'];
  List<String> data4 = ['支付宝', '微信','美团','京东','抖音','拼多多',];

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
    state.handleSelList.clear();
    state.handleSelList.addAll(state.selList);
    state.handleSelList.remove('全部');
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
    state.handleSelList.clear();
    state.handleSelList.addAll(state.selList);
    state.handleSelList.remove('全部');
    setState(() {});
  }

  void selectData2(String name) {
    for (var e in data2) {
      state.selList.remove(e);
    }
    if (name == '收入') {
      if (data3_3.contains(state.transactionType)) {
        state.transactionType = '';
      }
      for (var e in data3_3) {
        state.selList.remove(e);
      }
      state.type = name;
      data3.clear();
      data3.addAll(data3_2);
    }
    if (name == '支出') {
      if (data3_2.contains(state.transactionType)) {
        state.transactionType = '';
      }
      for (var e in data3_2) {
        state.selList.remove(e);
      }
      state.type = name;
      data3.clear();
      data3.addAll(data3_3);
    }
    state.selList.add(name);
    state.handleSelList.clear();
    state.handleSelList.addAll(state.selList);
    if (name == '全部') {
      state.type = '';
      state.handleSelList.remove(name);
      data3.clear();
      data3.addAll(data3_1);
    }
    setState(() {});
  }



  @override
  void initState() {
    super.initState();
    if(state.selList.isEmpty){
      state.selList.add('全部');
    }
    if(state.type == ''){
      data3.addAll(data3_1);
    }

    if(state.type == '收入'){
      data3.addAll(data3_2);
    }

    if(state.type == '支出'){
      data3.addAll(data3_3);
    }
  }

  void restData() {
    state.type = '';
    state.transactionType = '';
    state.transactionMethod = '';
    data3.clear();
    data3.addAll(data3_1);
    state.selList.clear();
    state.handleSelList.clear();
    state.selList.add('全部');
    state.controller1.text = '';
    state.controller2.text = '';
    setState(() {});
  }

  clearData(String name){
    if(name == '收入' || name == '支出'){
      state.type = '';
      state.selList.add('全部');
    }
    if(data1.contains(name)){
      state.controller1.text = '';
      state.controller2.text = '';
    }
    if(data3_1.contains(name)){
      state.transactionType = '';
    }
    if(data4.contains(name)){
      state.transactionMethod = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh * 0.68,
      width: 1.sw,
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
                widgetBuilder: (_, index) {
                  String name = state.handleSelList[index];

                  return Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF2F2F2),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: BaseText(
                          textAlign: TextAlign.center,
                          text: state.handleSelList[index],
                          fontSize: 13.sp,
                        )),
                        Icon(
                          Icons.clear,
                          size: 16.w,
                        ).withPadding(right: 12.w).withOnTap(onTap: () {
                          state.handleSelList.remove(name);
                          state.selList.remove(name);
                          clearData(name);
                          setState(() {});
                        })
                      ],
                    ),
                  );
                },
                itemCount: state.handleSelList.length,
                crossCount: 3,
                mainHeight: 34.w,
                spacing: 15.w,
              ),
              BaseText(
                text: '交易金额',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).withPadding(top: 6.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data1[index], bg: true),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data1[index],
                      style: TextStyle(
                        fontWeight: selectName(data1[index])
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectColor(data1[index]),
                        fontSize: 13.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    removeTitle(data1);
                    addName(data1[index]);
                  });
                },
                itemCount: data1.length,
                crossCount: 4,
                mainHeight: 34.w,
                spacing: 15.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.w,
                    height: 36.w,
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
                    width: 150.w,
                    height: 36.w,
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
              ).withPadding(top: 15.w),
              BaseText(
                text: '收支类型',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data2[index], bg: true),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data2[index],
                      style: TextStyle(
                        fontWeight: selectName(data2[index])
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectColor(data2[index]),
                        fontSize: 13.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    selectData2(data2[index]);
                    // removeTitle(data2);
                    // addName(data2[index]);
                  });
                },
                itemCount: data2.length,
                crossCount: 3,
                mainHeight: 34.w,
                spacing: 15.w,
              ),
              BaseText(
                text: '交易类型',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data3[index], bg: true),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data3[index],
                      style: TextStyle(
                        fontWeight: selectName(data3[index])
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectColor(data3[index]),
                        fontSize: 13.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.transactionType = data3[index];
                    removeTitle(data3);
                    addName(data3[index]);
                  });
                },
                itemCount: data3.length,
                crossCount: 3,
                mainHeight: 34.w,
                spacing: 15.w,
              ),
              BaseText(
                text: '交易方式',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data4[index], bg: true),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data4[index],
                      style: TextStyle(
                        fontWeight: selectName(data4[index])
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectColor(data4[index]),
                        fontSize: 13.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.transactionMethod = data4[index];
                    removeTitle(data4);
                    addName(data4[index]);
                  });
                },
                itemCount: data4.length,
                crossCount: 3,
                mainHeight: 34.w,
                spacing: 15.w,
              ),
            ],
          )),
          Container(
            height: 62.w,
            width: 1.sw,
            margin: EdgeInsets.only(
              top: 10.w,
            ),
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
                        color: Colors.black,
                        width: 1.w,
                      ),
                    ),
                    child: BaseText(
                      text: '重置清空',
                      fontSize: 16.sp,
                    ),
                  ).withOnTap(
                    onTap: () {
                      restData();
                    },
                  ),
                ),
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
                  ).withOnTap(
                    onTap: () {
                      Get.back();
                      logic.update(['updateFilter']);
                      logic.getListData(isRef: true);
                    },
                  ),
                ),
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
