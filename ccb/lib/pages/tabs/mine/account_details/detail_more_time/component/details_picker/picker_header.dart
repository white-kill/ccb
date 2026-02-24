import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../detail_more_time_logic.dart';
import '../../detail_more_time_state.dart';

class PickerMoreHeader extends StatefulWidget {
  final Function callBack;
  final Picker picker;
  final PickerMoreHeaderNotifier? controller;
  final DateTimePickerAdapter adapter;

  const PickerMoreHeader(
      {super.key,
      required this.callBack,
      this.controller,
      required this.picker,
      required this.adapter});

  @override
  State<PickerMoreHeader> createState() => _PickerMoreHeaderState();
}

class _PickerMoreHeaderState extends State<PickerMoreHeader> {
  final DetailMoreTimeLogic logic = Get.put(DetailMoreTimeLogic());
  final DetailMoreTimeState state = Get.find<DetailMoreTimeLogic>().state;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onController);

    restData();
  }

  _onController() {
    if (mounted) {
      if (widget.controller?.type == "changeTime") {
        if (state.isDay) {
          if (state.isSelectB) {
            String time = DateUtil.formatDateStr(widget.controller?.time ?? '',
                format: "yyyy年MM月dd日");
            state.temBeginTime1 = time;
            state.temSelectBeginList1 = widget.controller?.selected ?? [];
            setState(() {});
          } else {
            String time = DateUtil.formatDateStr(widget.controller?.time ?? '',
                format: "yyyy年MM月dd日");
            state.temSelectEndList1 = widget.controller?.selected ?? [];
            state.temEndTime1 = time;
            setState(() {});
          }
        } else {
          state.temSelectMonthList1 = widget.controller?.selected ?? [];
          String time = DateUtil.formatDateStr(widget.controller?.time ?? '',
              format: "yyyy年MM月");
          state.temMonthTime1 = time;
        }
      }
    }
  }


  void restData(){

    state.temBeginTime1 = state.beginTime1;
    state.temSelectBeginList1.clear();
    state.temSelectBeginList1.addAll(state.selectBeginList1);

    state.temEndTime1 = state.endTime1;
    state.temSelectEndList1.clear();
    state.temSelectEndList1.addAll(state.selectEndList1);

    state.temMonthTime1 = state.monthTime1;
    state.temSelectMonthList1.clear();
    state.temSelectMonthList1.addAll(state.selectMonthList1);


    if(state.isDay){
      widget.adapter.type = PickerDateTimeType.kYMD;
      if(state.isSelectB){
        widget.picker.selecteds = state.temSelectBeginList1;
        widget.adapter.doSelect(0, state.temSelectBeginList1[0]);
        widget.adapter.doSelect(1, state.temSelectBeginList1[1]);
        widget.adapter.doSelect(2, state.temSelectBeginList1[2]);
        widget.adapter.notifyDataChanged();
        widget.picker.state?.update();
      }else {
        widget.picker.selecteds = state.temSelectEndList1;
        widget.adapter.doSelect(0, state.temSelectEndList1[0]);
        widget.adapter.doSelect(1, state.temSelectEndList1[1]);
        widget.adapter.doSelect(2, state.temSelectEndList1[2]);
        widget.adapter.notifyDataChanged();
        widget.picker.state?.update();
      }
    }else {
      widget.adapter.type = PickerDateTimeType.kYM;
      widget.picker.selecteds = state.temSelectMonthList1;
      widget.adapter.doSelect(0, state.temSelectMonthList1[0]);
      widget.adapter.doSelect(1, state.temSelectMonthList1[1]);
      widget.adapter.doSelect(2, state.temSelectMonthList1[2]);
      widget.adapter.notifyDataChanged();
      widget.picker.state?.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.clear,
                size: 24.w,
              ).withOnTap(onTap: () {
                Get.back();
              }),
              BaseText(
                text: '自定义时间',
                fontSize: 16.sp,
              ),
              SizedBox(
                width: 24.w,
              )
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
                  widget.callBack.call(state.isDay);
                  restData();
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
                  widget.callBack.call(state.isDay);
                  restData();
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
                        widget.picker.selecteds = state.temSelectBeginList1;
                        widget.adapter.doSelect(0, state.temSelectBeginList1[0]);
                        widget.adapter.doSelect(1, state.temSelectBeginList1[1]);
                        widget.adapter.doSelect(2, state.temSelectBeginList1[2]);
                        widget.adapter.notifyDataChanged();
                        widget.picker.state?.update();
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
                        widget.picker.selecteds = state.temSelectEndList1;
                        widget.adapter.doSelect(0, state.temSelectEndList1[0]);
                        widget.adapter.doSelect(1, state.temSelectEndList1[1]);
                        widget.adapter.doSelect(2, state.temSelectEndList1[2]);
                        widget.adapter.notifyDataChanged();
                        widget.picker.state?.update();
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

class PickerMoreHeaderNotifier extends ChangeNotifier {
  String type = '';
  String time = '';
  List<int> selected = [];

  upDataTime(String t, List<int> sel) {
    type = 'changeTime';
    time = t;
    selected = sel;
    notifyListeners();
  }
}
