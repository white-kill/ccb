import 'package:ccb/utils/widget_util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_preview_logic.dart';

class AccountPreviewPieChartWidget extends StatefulWidget {
  const AccountPreviewPieChartWidget({super.key});

  @override
  State<AccountPreviewPieChartWidget> createState() =>
      _AccountPreviewPieChartWidgetState();
}

class _AccountPreviewPieChartWidgetState
    extends State<AccountPreviewPieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AccountPreviewLogic c){
      double holdingsAmount = double.parse(c.state.accountViewModel?.holdingsAmount??'0');
      double digitAmount = double.parse(c.state.accountViewModel?.digitAmount??'0');
      double currentAmount = double.parse(c.state.accountViewModel?.currentAmount??'0');
      double allP = holdingsAmount + currentAmount + digitAmount;
      return Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200.w,
                width: (350 / 2).w,
                child: PieChart(
                  PieChartData(
                    borderData: FlBorderData(
                      show: true,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 50.w,
                    sections: showingSections(
                      [
                        currentAmount/allP,
                        holdingsAmount/allP,
                        digitAmount/allP
                      ]
                    ),
                  ),
                ),
              ),

              Positioned(child: Column(
                children: [
                  BaseText(text: "总资产(元)",color: Colors.white70,fontSize: 13.sp,),
                  SizedBox(height: 6.w,),
                  BaseText(text: (c.state.accountViewModel?.balance??0).bankBalance,fontSize: 10.sp,color: Colors.white,)
                ],
              ))
            ],
          ),
          SizedBox(
            height: 200.w,
            width: (350 / 2).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.w,),
                _widget1(
                    color: const Color(0xffACC6FB),
                    content: '活期${((currentAmount/allP)*100).toStringAsFixed(1)}%',
                    money: currentAmount.bankBalance),
                _widget1(
                    color: const Color(0xff5C8BFE),
                    content: '持仓总额${((holdingsAmount/allP)*100).toStringAsFixed(1)}%',
                    money: holdingsAmount.bankBalance),
                _widget1(
                    color: const Color(0xffF7A868),
                    content: '数字人民币${((digitAmount/allP)*100).toStringAsFixed(1)}%',
                    money: digitAmount.bankBalance),
              ],
            ),
          )
        ],
      ).withPadding(
          top: 8.w
      );
    },id: 'updateAccountView',);
  }

  List<PieChartSectionData> showingSections(List dataList) {
    return List.generate(3, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xffACC6FB),
            value: dataList[i],
            radius: 16.w,
            showTitle: false,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff5C8BFE),
            value: dataList[i],
            radius:16.w,
            showTitle: false,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffF7A868),
            value:dataList[i],
            radius: 16.w,
            showTitle: false,
          );
        default:
          throw Error();
      }
    });
  }

  Widget _widget1({
    required Color color,
    required String content,
    required String money,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8.w,
              height: 8.w,
              decoration: decorationOnlyRadius(
                radius: 4.w,
                color: color,
              ),
            ),
            BaseText(
              text: content,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.white),
            ).withPadding(left: 6.w),
          ],
        ),
        BaseText(
          text: money,
          fontSize: 12.sp,
          color: Colors.white38,
        ).withPadding(left: 22.w,top: 8.w,bottom: 8.w),
      ],
    );
  }
}
