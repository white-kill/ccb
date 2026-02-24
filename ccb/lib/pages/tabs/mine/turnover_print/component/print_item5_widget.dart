import 'package:ccb/pages/tabs/mine/turnover_print/component/add_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../print_1/print_1_logic.dart';
import '../turnover_print_logic.dart';
import 'alter_widget.dart';

class PrintItem5Widget extends StatefulWidget {
  const PrintItem5Widget({super.key});

  @override
  State<PrintItem5Widget> createState() => _PrintItem5WidgetState();
}

class _PrintItem5WidgetState extends State<PrintItem5Widget> {
  List<String> nameList1 = ['获取方式', '电子邮箱', '文件类型'];

  List modeNames = ['电子邮件', '在线查看'];

  List typeNames = ['PDF（带电子印章）', 'EXCEL'];

  final TurnoverPrintLogic logic = Get.put(TurnoverPrintLogic());

  String obscureEmail(String email) {
    if (!email.contains('@')) return email;

    List<String> parts = email.split('@');
    String username = parts[0];
    String domain = parts[1];

    if (username.length <= 2) {
      return '${username.substring(0, 1)}***@$domain';
    } else {
      return '${username.substring(0, 3)}***@$domain';
    }
  }

  @override
  void initState() {
    super.initState();
    logic.state.item5title1 = '电子邮件';
    logic.state.item5title2 = 'PDF（带电子印章）';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 145.w,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.w))),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (nameList1[index] == "电子邮箱" && logic.state.item5title1 == "在线查看") {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                color: Color(0xFFD8EAF8),
                child: Text(
                  "明细文件大小如超过3M（约8000条记录），会导致申请失败；如您申请时段明细较多，建议通过“电子邮件”方式申请。",
                  style: TextStyle(fontSize: 12.5.sp, fontFamily: "PingFangSC", height: 1.4, color: Color(0xFF9AA4AD)),
                ),
              );
            }

            return SizedBox(
              height: 47.w,
              child: _item(nameList1[index], showRight: (nameList1[index] == "文件类型" && logic.state.item5title1 == "在线查看") == false),
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

  Widget _item(String title, {bool showRight = true}) {
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
        Expanded(child: _contentWidget(title)),
        if (showRight)
          Image(
            image: 'ic_print_next'.png3x,
            width: 25.w,
            height: 25.w,
          )
      ],
    );
  }

  Widget _contentWidget(String title) {
    if (title == '电子邮箱') {
      // return TextFieldWidget(
      //   controller: logic.state.item5TextController,
      //   keyboardType: TextInputType.emailAddress,
      //   hintText: '请正确输入本人邮箱地址',
      //   onSubmitted: (v) {
      //     logic.update(['updateBottom']);
      //   },
      // );
      return Obx(() => BaseText(
            text: logic.ck.value ? logic.state.item5title1_1 : obscureEmail(logic.state.item5title1_1),
            color: Color(0xff666666),
          ).withOnTap(onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.w),
                      topLeft: Radius.circular(8.w),
                    ),
                  ),
                  child: Column(
                    children: [
                      // topWidget - 蓝色标题栏
                      Container(
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
                          ),
                        ),
                        child: Row(
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
                              text: '邮箱选择',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                          ],
                        ),
                      ),
                      // 内容区域
                      Expanded(
                        child: AddEmail(callBack: (email) {
                          Navigator.of(context).pop();
                          logic.state.item5title1_1 = email;
                          logic.state.printData.email = email;
                          setState(() {});
                        }),
                      ),
                    ],
                  ),
                );
              },
            );
          }));
    }
    if (title == '获取方式') {
      return BaseText(
        text: logic.state.item5title1,
        color: Color(0xff666666),
      ).withOnTap(onTap: () {
        // AlterPickerTime.showDataPick(context, dataList: modeNames,onConfirm: (List v){
        //   logic.state.item5title1 = v.first;
        //   setState(() {});
        // });

        int idx = 0;
        AlterWidget.bottomAlter(modeNames, onSelectedItemChanged: (int index) {
          idx = index;
        }, onTap: () {
          Get.find<Print_1Logic>().item5title1 = modeNames[idx];
          logic.state.item5title1 = modeNames[idx];
          setState(() {});
        });
      });
    }
    if (title == '文件类型') {
      return BaseText(
        text: logic.state.item5title2,
        color: Color(0xff666666),
      ).withOnTap(onTap: () {
        int idx = 0;
        AlterWidget.bottomAlter(typeNames, onSelectedItemChanged: (int index) {
          idx = index;
        }, onTap: () {
          logic.state.item5title2 = typeNames[idx];
          logic.state.printData.fileType = logic.state.item5title2;
          setState(() {});
        });
      });
    }
    return Container();
  }
}
