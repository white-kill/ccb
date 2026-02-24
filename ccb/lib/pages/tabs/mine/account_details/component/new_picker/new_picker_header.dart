import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../account_details_logic.dart';
import '../../account_details_state.dart';

class NewPickerHeader extends StatefulWidget {
  final NewPickerHeaderNotifier? headerNotifier;
  const NewPickerHeader({super.key,this.headerNotifier});

  @override
  State<NewPickerHeader> createState() => _NewPickerHeaderState();
}

class _NewPickerHeaderState extends State<NewPickerHeader> {


  final AccountDetailsLogic logic = Get.put(AccountDetailsLogic());
  final AccountDetailsState state = Get.find<AccountDetailsLogic>().state;


  @override
  void initState() {
    super.initState();
    widget.headerNotifier?.addListener(_onController);

    restData();
  }
  _onController() {
    if (mounted) {
      if (widget.headerNotifier?.type == "changeTime") {
        if (state.isDay) {
          if (state.isSelectB) {
            String time = DateUtil.formatDate(widget.headerNotifier?.time, format: "yyyy年MM月dd日");
            state.temBeginTime1 = time;
            setState(() {});
          } else {
            String time = DateUtil.formatDate(widget.headerNotifier?.time, format: "yyyy年MM月dd日");
            state.temEndTime1 = time;
            setState(() {});
          }
        } else {
          String time = DateUtil.formatDate(widget.headerNotifier?.time, format: "yyyy年MM月");
          state.temMonthTime1 = time;
        }
      }
    }
  }

  void restData({int milliseconds = 200}){

    if(milliseconds != 0){
      state.temBeginTime1 = state.beginTime1;
      state.temSelectBeginList1.clear();
      state.temSelectBeginList1.addAll(state.selectBeginList1);

      state.temEndTime1 = state.endTime1;
      state.temSelectEndList1.clear();
      state.temSelectEndList1.addAll(state.selectEndList1);

      state.temMonthTime1 = state.monthTime1;
      state.temSelectMonthList1.clear();
      state.temSelectMonthList1.addAll(state.selectMonthList1);
    }



    Future.delayed(Duration(milliseconds: milliseconds),(){

      if(state.isDay) {
        if(state.isSelectB){
          DateFormat format = DateFormat('yyyy年MM月dd日');
          DateTime dateTime = format.parse(state.temBeginTime1);
          widget.headerNotifier?.jumpTime(dateTime);
        }else {
          DateFormat format = DateFormat('yyyy年MM月dd日');
          DateTime dateTime = format.parse(state.temEndTime1);
          widget.headerNotifier?.jumpTime(dateTime);
        }
      }else {
        DateFormat format = DateFormat('yyyy年MM月');
        DateTime dateTime = format.parse(state.temMonthTime1);
        widget.headerNotifier?.jumpTime(dateTime);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Icon(
                Icons.clear,
                size: 24.w,
              ).withOnTap(onTap: () {
                Get.back();
              }).withContainer(
                  alignment: Alignment.centerLeft
              )),
              Expanded(child: BaseText(
                text: '自定义时间',
                fontSize: 16.sp,
              )),

              // Expanded(child: BaseText(
              //   text: '查询更长时间',
              //   style: TextStyle(
              //     color: const Color(0xff4A6FCD),
              //     fontSize: 14.sp,
              //   ),
              // ).withContainer(
              //     alignment: Alignment.centerRight
              // ).withOnTap(onTap: (){
              //   Get.back();
              //   Get.toNamed(Routes.detailMoreTimePage);
              // })),
            ],
          ).withPadding(all: 12.w),
          Container(
            width: 1.sw,
            height: 0.5.w,
            color: Color(0xffd2d2d2),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 34.w,
                  child: Column(
                    children: [
                      BaseText(
                        text: '按日选择',
                        color: state.isDay
                            ? const Color(0xff4A6FCD)
                            : Colors.black,
                      ),
                      state.isDay
                          ? Container(
                        width: 30.w,
                        height: 5.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.w),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xff4A6FCD),
                                  Color(0xff81AEF4),
                                ])),
                      )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ).withOnTap(onTap: () {
                  state.isDay = true;
                  // widget.callBack.call(state.isDay);
                  logic.update(['updateM']);
                  restData(milliseconds: 0);
                  setState(() {});
                }).withPadding(top: 10.w, left: 24.w),
              ),
              BaseText(
                text: '至',
                color: Colors.transparent,
              ).withPadding(
                left: 12.w,
                right: 12.w,
                top: 10.w,
              ),
              Expanded(
                child: Container(
                  height: 34.w,
                  child: Column(
                    children: [
                      BaseText(
                        text: '按月选择',
                        color: !state.isDay
                            ? const Color(0xff4A6FCD)
                            : Colors.black,
                      ),
                      !state.isDay
                          ? Container(
                        width: 30.w,
                        height: 5.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.w),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xff4A6FCD),
                                  Color(0xff81AEF4),
                                ])),
                      )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ).withOnTap(onTap: () {
                  state.isDay = false;
                  // widget.callBack.call(state.isDay);
                  logic.update(['updateM']);
                  restData(milliseconds: 0);
                  setState(() {});
                }).withPadding(top: 10.w, right: 24.w),
              ),
            ],
          ),
          state.isDay
              ? Row(
            children: [
              Expanded(
                child: Container(
                  height: 34.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.w)),
                    border: Border.all(
                      color: state.isSelectB
                          ? Color(0xff4A6FCD)
                          : Color(0xff666666),
                      width: 1.w,
                    ),
                  ),
                  child: BaseText(
                    text: state.temBeginTime1,
                    color: state.isSelectB
                        ? Color(0xff4A6FCD)
                        : Color(0xff666666),
                  ),
                ).withOnTap(onTap: () {
                  state.isSelectB = true;
                  restData(milliseconds: 0);
                  setState(() {});
                }).withPadding(top: 10.w, left: 24.w),
              ),
              BaseText(text: '至').withPadding(
                left: 12.w,
                right: 12.w,
                top: 10.w,
              ),
              Expanded(
                child: Container(
                  height: 34.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.w)),
                    border: Border.all(
                      color: !state.isSelectB
                          ? Color(0xff4A6FCD)
                          : Color(0xff666666),
                      width: 1.w,
                    ),
                  ),
                  child: BaseText(
                      text: state.temEndTime1,
                      color: !state.isSelectB
                          ? Color(0xff4A6FCD)
                          : Color(0xff666666)),
                ).withPadding(top: 10.w, right: 24.w).withOnTap(
                    onTap: () {
                      state.isSelectB = false;
                      // widget.picker.selecteds = state.temSelectEndList1;
                      // widget.adapter.doSelect(0, state.temSelectEndList1[0]);
                      // widget.adapter.doSelect(1, state.temSelectEndList1[1]);
                      // widget.adapter.doSelect(2, state.temSelectEndList1[2]);
                      // widget.adapter.notifyDataChanged();
                      // widget.picker.state?.update();
                      restData(milliseconds: 0);
                      setState(() {});
                    }),
              ),
            ],
          ).withContainer(
            width: 1.sw,
          )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class NewPickerHeaderNotifier extends ChangeNotifier {
  String type = '';


  DateTime? time;
  upDataTime(DateTime t) {
    type = 'changeTime';
    time = t;
    notifyListeners();
  }

  DateTime? jTime;
  jumpTime(DateTime t) {
    type = 'jumpTime';
    jTime = t;
    notifyListeners();
  }
}

