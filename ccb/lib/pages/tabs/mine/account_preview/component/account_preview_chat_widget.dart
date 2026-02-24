
import 'package:ccb/pages/tabs/mine/account_preview/component/account_preview_piechart_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../data/model/account_view_model.dart';
import '../account_preview_logic.dart';

class AccountPreviewChatWidget extends StatefulWidget {
  const AccountPreviewChatWidget({super.key});

  @override
  State<AccountPreviewChatWidget> createState() =>
      _AccountPreviewChatWidgetState();
}

class _AccountPreviewChatWidgetState extends State<AccountPreviewChatWidget> {
  final AccountPreviewLogic logic = Get.put(AccountPreviewLogic());

  List timeList = ['近一月', '近一年'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AccountPreviewLogic logic) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AccountPreviewPieChartWidget(),
            Container(
              width: 320.w,
              height: 0.5,
              color: Colors.white10,
            ),
            Container(
                width: 1.sw,
                padding: EdgeInsets.only(top: 12.w, left: 12.w, bottom: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '资产走势',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        BaseText(
                          text: logic.state.checkTitle,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Image(
                          image: "ic_zc_details".png3x,
                          width: 20.w,
                          height: 20.w,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12.w,
                        )
                      ],
                    ).withOnTap(onTap: () {
                      BaseBottomSheet.sheetContentWidget(
                          title: '选择时间',
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (c, i) {
                              String name = timeList[i];
                              return Container(
                                padding:
                                    EdgeInsets.only(top: 12.w, bottom: 12.w,left: 12.w),
                                child: BaseText(
                                  text: name,
                                  style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: logic.state.checkTitle == name
                                        ? const Color(0xFF7196F8)
                                        : Colors.black,
                                  ),
                                ),
                              ).withOnTap(onTap: () {
                                logic.state.checkTitle = timeList[i];
                                Get.back();
                                logic.accountView();
                              });
                            },
                            itemCount: timeList.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container(
                                width: 1.sw,
                                height: 0.5.w,
                                color: Color(0xffdedede),
                              );
                            },
                          ));
                    })
                  ],
                )),
            Text(
              '单位：元',
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white70,
              ),
            ).withPadding(left: 45.w),
            SizedBox(
              height: 180,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 20.w,
                  left: 10.w,
                  top: 12.w,
                ),
                child: LineChart(
                  mainData(),
                ),
              ),
            ),
          ],
        );
      },
      id: 'updateAccountView',
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle? st = TextStyle(
      color: Colors.white70,
      fontSize: 10.sp,
    );

    AccountViewChartList model = logic.state.accountViewModel == null
        ? AccountViewChartList()
        : logic.state.accountViewModel!.chartList[value.toInt()];

    int last = logic.state.accountViewModel!.chartList.length - 1;
    Widget text;
    if (value.toInt() == 0) {
      text = Padding(
        padding: EdgeInsets.only(left: 34.w),
        child: Text(model.datetime, style: st),
      );
    } else if (value.toInt() == last) {
      text = Padding(
        padding: EdgeInsets.only(right: 34.w),
        child: Text(model.datetime, style: st),
      );
    } else {
      text = Text('', style: st);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle? style = TextStyle(
      color: Colors.white70,
      fontSize: 10.sp,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '2.0';
        break;
      case 2:
        text = '4.0';
        break;
      case 3:
        text = '6.0';
        break;
      case 4:
        text = '8.0';
        break;
      case 5:
        text = '10.0';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.right)
        .withPadding(right: 6.w);
  }



  LineChartData mainData() {
    List<FlSpot> flSpotList = [];
    logic.state.accountViewModel?.chartList.forEach((e) {
      int index = logic.state.accountViewModel!.chartList.indexOf(e);
      flSpotList.add(FlSpot(index.toDouble(), e.balance));
    });

    double maxY = flSpotList.first.y;

    for (final spot in flSpotList) {
      if (spot.y > maxY) maxY = spot.y;
    }

    final interval = maxY / 6;
    //
    // // 计算10%的边距
    // final margin = (maxY - minY) * 0.1;

    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => const Color(0xff5A89FE),
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              if (flSpot.x == 0 || flSpot.x == 6) {
                return null;
              }

              TextAlign textAlign;
              switch (flSpot.x.toInt()) {
                case 1:
                  textAlign = TextAlign.left;
                  break;
                case 5:
                  textAlign = TextAlign.right;
                  break;
                default:
                  textAlign = TextAlign.center;
              }

              return LineTooltipItem(
                '${logic.state.accountViewModel?.chartList[flSpot.x.toInt()].datetime} \n',
                TextStyle(
                    color: Colors.white.withOpacity(0.5), fontSize: 11.sp),
                children: [
                  TextSpan(
                    text:
                        '¥${logic.state.accountViewModel?.chartList[flSpot.x.toInt()].balance.toString()}',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ],
                textAlign: textAlign,
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: interval,
        // verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 0,
          );
        },
      ),

      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 26.w,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50.w,
            getTitlesWidget: (value, meta) {
              // print(meta.max);
              print(value);
              return Text(
                value.toStringAsFixed(1),
                textAlign: TextAlign.right,
                style: TextStyle(
                color: Colors.white70,
                fontSize: 10.sp,
              ),);
            },
          ),
        ),

      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
            top: BorderSide(color: Colors.white10, width: 0.5.w),
            bottom: BorderSide(color: const Color(0xff7480C8), width: 1.w)),
      ),
      // minX: 0,
      // maxX: (flSpotList.length - 1).toDouble(),
      // minY: 0,
      // maxY: 5,
      minY: 0,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: flSpotList,
          isCurved: true,
          gradient: const LinearGradient(
            colors: [
              Color(0xFF7196F8),
              Color(0xFF7196F8),
            ],
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF7196F8).withOpacity(1),
                const Color(0xFF355CD3).withOpacity(0),
              ].map((color) => color).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
