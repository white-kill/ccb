import 'package:ccb/pages/tabs/mine/turnover_print/component/alter_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../turnover_print_logic.dart';
import '../turnover_print_state.dart';
import 'new_picker/new_picker.dart';

class PrintItem1Widget extends StatefulWidget {
  const PrintItem1Widget({super.key});

  @override
  State<PrintItem1Widget> createState() => _PrintItem1WidgetState();
}

class _PrintItem1WidgetState extends State<PrintItem1Widget> {
  final TurnoverPrintLogic logic = Get.put(TurnoverPrintLogic());
  final TurnoverPrintState state = Get.find<TurnoverPrintLogic>().state;

  // 'detailVersion': '明细版本',
  List<String> nameList1 = [
    '申请账户',
    '币种',
    '明细版本',
    '明细类型',
    '明细开始日\n期',
    '明细结束日\n期',
    ''
  ];

  List<String> nameList2 = ['近三月', '近半年', '近一年'];

  List<String> commonCurrencyNames = [
    "人民币",
    "美元",
    "欧元",
    "日元",
    "英镑",
    "港币",
    "澳元",
    "加元",
    "瑞士法郎",
    "新加坡元",
    "韩元",
    "新西兰元",
    "瑞典克朗",
    "挪威克朗",
    "丹麦克朗",
    "俄罗斯卢布",
    "印度卢比",
    "泰铢",
    "越南盾",
    "菲律宾比索",
    "新台币",
  ];

  List<String> minXinNames = [
    '全部明细',
    '工资明细',
    '收入明细',
    '支出明细',
  ];

  select(String name) {
    logic.state.item1title6 = name;
    DateTime currentDate = DateTime.now();
    DateTime monthsAgo;
    if (name == '近三月') {
      monthsAgo =
          DateTime(currentDate.year, currentDate.month - 3, currentDate.day);
    } else if (name == '近半年') {
      monthsAgo =
          DateTime(currentDate.year, currentDate.month - 6, currentDate.day);
    } else {
      monthsAgo =
          DateTime(currentDate.year, currentDate.month - 12, currentDate.day);
    }
    logic.state.item1title4 =
        DateUtil.formatDate(monthsAgo, format: 'yyyy/MM/dd');
    logic.state.item1title5 =
        DateUtil.formatDate(currentDate, format: 'yyyy/MM/dd');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 345.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      margin: EdgeInsets.all(12.w),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (nameList1[index] == '') {
              return VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F2F2),
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      image: logic.state.item1title6 == nameList2[index]
                          ? DecorationImage(
                              image: 'bg_print_item1'.png3x,
                              fit: BoxFit.fill,
                            )
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: nameList2[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () => select(nameList2[index]));
                },
                itemCount: nameList2.length,
                crossCount: 3,
                mainHeight: 28.w,
                spacing: 15.w,
              ).withContainer(
                height: 60.w,
                alignment: Alignment.center,
              );
            }

            return SizedBox(
              height: 47.w,
              child: _item(
                index,
                nameList1[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 1.w,
              margin: EdgeInsets.only(left: 11.w, right: 11.w),
              color: const Color(0xffDDDDDD),
            );
          },
          itemCount: nameList1.length),
    );
  }

  Widget _item(int index, String title) {
    return Row(
      children: [
        Container(
          width: 125.w,
          padding: EdgeInsets.only(left: 10.w),
          child: BaseText(
            text: title,
            fontSize: 14.sp,
            color: const Color(0xff363636),
          ),
        ),
        Expanded(
            child: GetBuilder(
          builder: (TurnoverPrintLogic c) {
            if (index == 0) {
              return replaceAsterisksWithImages(_contentText(index),
                  color: const Color(0xff666666), bottom: 4.w);
            }
            return BaseText(
              text: _contentText(index),
              color: const Color(0xff666666),
            );
          },
          id: 'updateContent',
        ).withOnTap(onTap: () {
          selectIndex(index);
        })),
        Image(
          image: 'ic_print_next'.png3x,
          width: 25.w,
          height: 25.w,
        )
      ],
    );
  }

  void selectIndex(int index) {
    switch (index) {
      case 0:
        BaseBottomSheet.sheetContentWidget(
            topWidget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.clear,
                  size: 22.w,
                  color: Colors.white,
                ).withOnTap(onTap: () {
                  Navigator.of(context).pop();
                }),
                BaseText(
                  text: '申请账户',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 22.w,
                ),
              ],
            ).withContainer(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  top: 6.w,
                  bottom: 6.w,
                ),
                decoration: BoxDecoration(
                    color: const Color(0xff283CB1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.w),
                      topLeft: Radius.circular(8.w),
                    ))),
            child: Column(
              children: state.infoModel.bankList.map((e) {
                return Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        Image(
                          image: 'ic_jsyh'.png3x,
                          width: 38.w,
                          height: 38.w,
                        ),
                        SizedBox(width: 12.w),
                        BaseText(
                          text: e.bankCard.maskBankCardNumber(),
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color(0xff666666),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).withPadding(top: 12.w, bottom: 10.w);
              }).toList(),
            ));
      case 1:
        // AlterPickerTime.showDataPick(
        //   context,
        //   dataList: commonCurrencyNames,
        //   onConfirm: (List v) {
        //     state.item1title2 = v.first;
        //     logic.update(['updateContent']);
        //   },
        // );
        int idx = 0;
        AlterWidget.bottomAlter(commonCurrencyNames,
            onSelectedItemChanged: (int index) {
          idx = index;
        }, onTap: () {
          state.item1title2 = commonCurrencyNames[idx];
          logic.update(['updateContent']);
        });
      case 2:
        int idx = 0;
        AlterWidget.bottomAlter(['中文版', '英文版'],
            onSelectedItemChanged: (int index) {
          idx = index;
        }, onTap: () {
          state.item1title3_1 = ['中文版', '英文版'][idx];
          logic.update(['updateContent']);
        });
      case 3:
        int idx = 0;
        AlterWidget.bottomAlter(minXinNames,
            onSelectedItemChanged: (int index) {
          idx = index;
        }, onTap: () {
          state.item1title3 = minXinNames[idx];
          logic.update(['updateContent']);
        });
      // AlterPickerTime.showDataPick(
      //   context,
      //   dataList: minXinNames,
      //   onConfirm: (List v) {
      //     state.item1title3 = v.first;
      //     logic.update(['updateContent']);
      //   },
      // );
      case 4:
        // AlterPickerTime.showTime1(
        //   context,
        //   yearBegin: 2010,
        //   onConfirm: (Picker picker, List<int> selected) {
        //     state.item1title4 = DateUtil.formatDateStr(picker.adapter.text, format: "yyyy/MM/dd");
        //     state.item1title6 = '';
        //     setState(() {});
        //   },
        // );
        DateTime? initialDate =
            DateTime.parse(state.item1title4.replaceAll("/", "-"));
        NewMxPicker.showNewTime(
            onDateTime: (DateTime date) {
              state.item1title4 =
                  DateUtil.formatDate(date, format: "yyyy/MM/dd");
              state.item1title6 = '';
              setState(() {});
            },
            initialDateTime: initialDate);
      case 5:
        DateTime? initialDate =
            DateTime.parse(state.item1title5.replaceAll("/", "-"));
        NewMxPicker.showNewTime(
            onDateTime: (DateTime date) {
              state.item1title5 =
                  DateUtil.formatDate(date, format: "yyyy/MM/dd");
              state.item1title6 = '';
              setState(() {});
            },
            initialDateTime: initialDate);
      // AlterPickerTime.showTime(
      //   context,
      //   yearBegin: 2010,
      //   onConfirm: (Picker picker, List<int> selected) {
      //     state.item1title5 = DateUtil.formatDateStr(picker.adapter.text, format: "yyyy/MM/dd");
      //     state.item1title6 = '';
      //     setState(() {});
      //   },
      // );
      default:
        return;
    }
  }

  String _contentText(int index) {
    switch (index) {
      case 0:
        return '建设银行 ${logic.state.item1title1.maskBankCardNumber()}';
      case 1:
        return logic.state.item1title2;
      case 2:
        return logic.state.item1title3_1;
      case 3:
        return logic.state.item1title3;
      case 4:
        return logic.state.item1title4;
      case 5:
        return logic.state.item1title5;
      default:
        return '';
    }
  }

  Widget replaceAsterisksWithImages(String text,
      {double fontSize = 14, Color? color, double? size, double? bottom}) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style:
            TextStyle(fontSize: fontSize.sp, color: color ?? Color(0xff999999)),
      ));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(
                  image: 'ic_ccb_xin'.png3x,
                  width: size ?? 6.w,
                  height: size ?? 6.w,
                  color: color ?? Color(0xff999999))
              .withPadding(bottom: bottom ?? 2.w),
          alignment: PlaceholderAlignment.middle,
        ));
      }
    }

    return Text.rich(
      maxLines: 10,
      textAlign: TextAlign.left,
      TextSpan(children: spans),
    );
  }
}
