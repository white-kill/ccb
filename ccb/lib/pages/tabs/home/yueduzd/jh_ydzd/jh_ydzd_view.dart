import 'package:ccb/pages/tabs/home/yueduzd/jh_ydzd/Bouncingwidget.dart';
import 'package:ccb/pages/tabs/home/yueduzd/jh_ydzd/popview_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import '../../../../../utils/scale_point_widget.dart';
import 'jh_ydzd_logic.dart';
import 'jh_ydzd_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Jh_ydzdPage extends BaseStateless {
  Jh_ydzdPage({Key? key}) : super(key: key,title: '建行月度账单');

  final Jh_ydzdLogic logic = Get.put(Jh_ydzdLogic());
  final Jh_ydzdState state = Get.find<Jh_ydzdLogic>().state;



  @override
  List<Widget>? get rightAction => [

    ScalePointWidget(
      icColor: Colors.white,
    ).withPadding(right: 6.w),

    Icon(
      Icons.clear,
      color:Colors.white,
    ).withOnTap(onTap: () {
      Get.back();
    }).withPadding(
      right: 16.w,
    )
  ];
  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;



  // List<ChartData> chartData = [
  //   ChartData('2024/11', 123),
  //   ChartData('2024/12', 281),
  //   ChartData('2025/01', 232),
  //   ChartData('2025/02', 221),
  //   ChartData('2025/03', 232),
  //   ChartData('2025/04', 212)
  // ];
  //
  // List<_SalesData> data = [
  //   _SalesData('Jan', 60, Colors.red),
  // ];
  void _showDialog(BuildContext context) {
    showDialog(
      context: context, // 确保此处 context 来自 Widget 树
      builder: (context) =>
      IOSStyleDialog(
        title: '',
          showTitle: false,
          content: '• 资金流出交易仅统计您本人名下活期储蓄账户的主要资金交易。'
          '如果您有外币形式的交易，将会按交易当日汇率折算成人名币计算 \n '
          '•统计范围不限于手机银行签约用户。不含付款账户为建行同名账户的转入交易；不含您在建行赎回投资理财类产品到账交易 \n '
          '• 所有数据仅供参考，不作为对账凭证',
        width: 330.w,
        height: 195.w,
        showCancelButton: false,
        confirmText: '我知道了',
        contentAlignment: TextAlign.left,
      ),
    );
  }

  @override
  Widget initBody(BuildContext context) {

    return Container(
        child:  PageView(
      scrollDirection: Axis.vertical,
      children: [
        GetBuilder(builder: (Jh_ydzdLogic c){
          return SizedBox(
            height: 1.sh,
            child: Stack(children: [
              Image(
                width: 370.w,
                height: 558.w,
                image: 'jh_yd_bg'.png3x,
              ),
              Positioned(
                top: 35.w,
                width: 150.w,
                left: 33.w,
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Row(children: [
                    Container(
                      width: 7,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                        BorderRadius.circular(10), // 圆角半径设为高度的一半会形成胶囊形状
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('资金流入'),
                    SizedBox(width: 5),
                    Image(
                      image: 'jh_tips'.png3x,
                      width: 13.w,
                      height: 13.w,
                    ).withOnTap(onTap: ()=> {
                      _showDialog(context)
                    }),
                  ]),
                ]),
              ),
              Positioned(
                  top: 35.w,
                  right: 33.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        (state.billModel.income?.category?.amount??0).bankBalance,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style, // 继承默认文字样式
                          children: <TextSpan>[
                            const TextSpan(text: '较上月'), // 默认颜色部分
                            TextSpan(
                              // 红色数字部分
                              text: state.billModel.income?.category?.contrastMoney,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Positioned(
                left: 20.w,
                top: 80.w,
                child: Container(
                  width: 330.w,
                  height: 15.w,
                  child: Text('----------------------------------------------',
                    style: TextStyle(color: Color(0xffDEDEDE)),),
                )
              ),
              Positioned(
                top: 100.w,
                width: 370.w,
                child: Row(children: [
                  SizedBox(
                    width: 76.w, //(370 - 2 * 70)/2
                  ),
                  Obx(
                        () => Container(
                      width: 80.w,
                      height: 34.w,
                      decoration: BoxDecoration(
                        color:
                        state.isSelected1.value ? Colors.white : Colors.blue,
                        border: Border.all(
                          width: 1.w,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Center(
                        child: Text('按分类',
                            style: TextStyle(
                                color: state.isSelected1.value
                                    ? Colors.blue
                                    : Colors.white,
                                fontSize: 14.sp)),
                      ),
                    ).withOnTap(onTap: () {
                      //TODO: 点击事件
                      logic.changeSelected1(false);
                    }),
                  ),
                  SizedBox(
                    width: 76.w, //(370 - 2 * 70)/2
                  ),
                  Obx(() => Container(
                      width: 80.w,
                      height: 34.w,
                      decoration: BoxDecoration(
                        color: state.isSelected1.value
                            ? Colors.blue
                            : Colors.white,
                        border: Border.all(
                          width: 1.w,
                          color: Colors.blue,
                        ),
                        borderRadius:
                        BorderRadius.circular(20.w), // 圆角半径设为高度的一半会形成胶囊形状
                      ),
                      child: Center(
                        child: Text(
                          '按走势',
                          style: TextStyle(
                              color: state.isSelected1.value
                                  ? Colors.white
                                  : Colors.blue,
                              fontSize: 14.sp),
                        ),
                      )).withOnTap(onTap: () {
                    //TODO: 点击事件
                    logic.changeSelected1(true);
                  }))
                ]),
              ),
              Obx(() => Positioned(
                  top: 130.w,
                  left: 10.w,
                  width: 350.w,
                  child: state.isSelected1.value
                      ?
                  Container
                    (
                      width: 300,
                      height: 280,
                      child:
                  SfCartesianChart(
                    borderWidth: 0,
                    plotAreaBorderWidth: 0,
                    // primaryXAxis: CategoryAxis(isVisible: false,),  // 隐藏X轴
                    primaryYAxis: NumericAxis(isVisible: false),
                    // 隐藏Y轴
                    primaryXAxis: CategoryAxis(
                      axisLabelFormatter: (AxisLabelRenderDetails details) {
                        return ChartAxisLabel(
                            details.text, details.textStyle);
                      },
                      majorGridLines: const MajorGridLines(width: 0),
                      majorTickLines: const MajorTickLines(width: 0),
                    ),
                    series: <CartesianSeries>[
                      ColumnSeries<ChartData, String>(
                        dataSource: state.chartData1,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        // color: Colors.blue,
                        width: 0.6,
                        dataLabelMapper: (ChartData data, int index) {
                          return '¥${data.y.bankBalance}';
                        },
                        pointColorMapper: (ChartData data, int index) {
                          return index == 5?Colors.blue:Colors.blue.withOpacity(0.3);
                        },
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(
                              color: const Color(0xff999999),
                              fontSize: 11.sp),
                          labelPosition: ChartDataLabelPosition.outside,
                          angle: -45,
                        ),
                      )
                    ],
                  ))
                      : SfCircularChart(series: <CircularSeries>[
                    DoughnutSeries<SalesData, String>(
                      dataSource: state.data1,
                      xValueMapper: (SalesData data, _) => data.year,
                      yValueMapper: (SalesData data, _) => data.sales,
                      pointColorMapper: (SalesData data, _) => data.color,
                      // endAngle: 285,
                      dataLabelMapper: (SalesData data, int index){
                        return '${data.year}\n${data.sales}';
                      },
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                        // 标签显示在外侧
                        textStyle:
                        TextStyle(fontSize: 12.sp, color: Colors.red),
                        useSeriesColor: false,
                        // 不使用系列颜色
                        overflowMode: OverflowMode.shift,
                        // 溢出时自动调整位置
                        connectorLineSettings: const ConnectorLineSettings(
                          type: ConnectorType.line,
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      radius: '60%',
                      innerRadius: '80%',
                    )
                  ]))
              ),
            Obx(() =>  state.isSelected1.value ? Positioned(
                  top: 430.w,
                  left: 65.w,
                  child: Row(
                    children: [
                      Text('• ',
                        style: TextStyle(color: Colors.blue.withOpacity(0.3)),),
                      Text('其他月资产流入',
                        style: TextStyle(color: Colors.black),),
                      SizedBox(width: 10.w,),
                      Text('• ',
                        style: TextStyle(color: Colors.blue),),
                      Text('当月资产流入',
                        style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ):SizedBox(),
                   ),
              Positioned(
                  left: 20.w,
                  top: 475.w,
                  child: Container(
                    width: 330.w,
                    height: 15.w,
                    child: Text('----------------------------------------------------------',
                      style: TextStyle(color: Color(0xffDEDEDE)),),
                  )
              ),
              Positioned(
                left: 0,
                top: 490.w,
                child:
                Container(
                  width: 1.sw,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('最大一笔发生在${state.billModel.income?.category?.dateTime??''}'),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style, // 继承默认文字样式
                            children: <TextSpan>[
                              const TextSpan(text: '最大一笔'), // 默认颜色部分
                              TextSpan(
                                // 红色数字部分
                                text: '${(state.billModel.income?.category?.fundMoney??0).bankBalance}元',
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]
                  ),
                )

              ),
              Positioned(
                  bottom: 45.w,
                  left: (370/2).w - (27/2).w,
                child:
                BouncingAnimationWidget(child:
                Image(
                  image: 'down_arrow'.png3x,
                  width: 17.w + 10.w,
                  height: 22.w + 10.w,
                ),
                ),
              )
            ]),
          );
        },id: 'updateUI',),

        GetBuilder(builder: (Jh_ydzdLogic c){
          return SizedBox(
            height: 1.sh,
            child: Stack(
                children: [
              Image(
                width: 370.w,
                height: 558.w,
                image: 'jh_yd_bg'.png3x,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 35.w,left: 33.w),
                    child: Row(
                        children: [
                          Container(
                            width: 7,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                              BorderRadius.circular(10), // 圆角半径设为高度的一半会形成胶囊形状
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('资金流出'),
                          SizedBox(width: 5),
                          Image(
                            image: 'jh_tips'.png3x,
                            width: 13.w,
                            height: 13.w,
                          ),
                        ]),)
              ]).withOnTap(onTap: ()=> {
                _showDialog(context)
              }),
              Positioned(
                  top: 35.w,
                  right: 33.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        (state.billModel.expenses?.category?.amount??0).bankBalance,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style, // 继承默认文字样式
                          children: <TextSpan>[
                            const TextSpan(text: '较上月'), // 默认颜色部分
                            TextSpan(
                              // 红色数字部分
                              text: state.billModel.expenses?.category?.contrastMoney??'',
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
                  Obx(() =>  state.isSelected1.value ? Positioned(
                    top: 430.w,
                    left: 65.w,
                    child: Row(
                      children: [
                        Text('• ',
                          style: TextStyle(color: Colors.red.withOpacity(0.3)),),
                        Text('其他月资产流出',
                          style: TextStyle(color: Colors.black),),
                        SizedBox(width: 10.w,),
                        Text('• ',
                          style: TextStyle(color: Colors.red),),
                        Text('当月资产流出',
                          style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ):SizedBox(),
                  ),
              Positioned(
                  left: 20.w,
                  top: 80.w,
                  child: Container(
                    width: 330.w,
                    height: 15.w,
                    child: Text('-------------------------------------------------------------------',
                      style: TextStyle(color: Color(0xffDEDEDE)),),
                  )
              ),
              Positioned(
                top: 100.w,
                width: 370.w,
                child: Row(children: [
                  SizedBox(
                    width: 76.w, //(370 - 2 * 70)/2
                  ),
                  Obx(
                        () => Container(
                      width: 80.w,
                      height: 34.w,
                      decoration: BoxDecoration(
                        color:
                        state.isSelected2.value ? Colors.white : Colors.blue,
                        border: Border.all(
                          width: 1.w,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Center(
                        child: Text('按分类',
                            style: TextStyle(
                                color: state.isSelected2.value
                                    ? Colors.blue
                                    : Colors.white,
                                fontSize: 14.sp)),
                      ),
                    ).withOnTap(onTap: () {
                      //TODO: 点击事件
                      logic.changeSelected2(false);
                    }),
                  ),
                  SizedBox(
                    width: 76.w, //(370 - 2 * 70)/2
                  ),
                  Obx(() => Container(
                      width: 80.w,
                      height: 34.w,
                      decoration: BoxDecoration(
                        color: state.isSelected2.value
                            ? Colors.blue
                            : Colors.white,
                        border: Border.all(
                          width: 1.w,
                          color: Colors.blue,
                        ),
                        borderRadius:
                        BorderRadius.circular(20.w), // 圆角半径设为高度的一半会形成胶囊形状
                      ),
                      child: Center(
                        child: Text(
                          '按走势',
                          style: TextStyle(
                              color: state.isSelected2.value
                                  ? Colors.white
                                  : Colors.blue,
                              fontSize: 14.sp),
                        ),
                      )).withOnTap(onTap: () {
                    logic.changeSelected2(true);
                  }))
                ]),
              ),
              Obx(() => Positioned(
                  top: 130.w,
                  left: 10.w,
                  width: 350.w,
                  child: state.isSelected2.value
                      ? Container
                    (
                      width: 300,
                      height: 280,
                      child:SfCartesianChart(
                    borderWidth: 0,
                    plotAreaBorderWidth: 0,
                    // primaryXAxis: CategoryAxis(isVisible: false,),  // 隐藏X轴
                    primaryYAxis: NumericAxis(isVisible: false),
                    // 隐藏Y轴
                    primaryXAxis: CategoryAxis(
                      axisLabelFormatter: (AxisLabelRenderDetails details) {
                        return ChartAxisLabel(
                            details.text, details.textStyle);
                      },
                      majorGridLines: const MajorGridLines(width: 0),
                      majorTickLines: const MajorTickLines(width: 0),
                    ),
                    series: <CartesianSeries>[
                      ColumnSeries<ChartData, String>(
                        dataSource: state.chartData2,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        // color: Colors.blue,
                        width: 0.6,
                        dataLabelMapper: (ChartData data, int index) {
                          return '¥${data.y.bankBalance}';
                        },
                        pointColorMapper: (ChartData data, int index) {
                          return index == 5?Colors.red:Colors.red.withOpacity(0.3);
                        },
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(
                              color: const Color(0xff999999),
                              fontSize: 11.sp),
                          labelPosition: ChartDataLabelPosition.outside,
                          angle: -45,
                        ),
                      )
                    ],
                  ))
                      : SfCircularChart(series: <CircularSeries>[
                    DoughnutSeries<SalesData, String>(

                      dataSource: state.data2,
                      xValueMapper: (SalesData data, _) => data.year,
                      yValueMapper: (SalesData data, _) => data.sales,
                      pointColorMapper: (SalesData data, int index) => data.color,
                      // endAngle: 285,
                      dataLabelMapper: (SalesData data, int index){
                        return '${data.year}\n${data.sales}';
                      },
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                        // 标签显示在外侧
                        textStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
                        useSeriesColor: false,
                        // 不使用系列颜色
                        overflowMode: OverflowMode.shift,
                        // 溢出时自动调整位置
                        connectorLineSettings: const ConnectorLineSettings(
                          type: ConnectorType.line,
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      radius: '60%',
                      innerRadius: '80%',
                    )
                  ]))),
              Positioned(
                  left: 20.w,
                  top: 475.w,
                  child: Container(
                    width: 330.w,
                    height: 15.w,
                    child: Text('------------------------------------------------------',
                      style: TextStyle(color: Color(0xffDEDEDE)),),
                  )
              ),
                  Positioned(
                      left: 0,
                      top: 490.w,
                      child:
                      Container(
                        width: 1.sw,
                        child:Column(
                            children: [
                              Text('最大一笔发生在${state.billModel.expenses?.category?.dateTime??''}'),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style, // 继承默认文字样式
                                  children: <TextSpan>[
                                    const TextSpan(text: '最大一笔'), // 默认颜色部分
                                    TextSpan(
                                      // 红色数字部分
                                      text: '${(state.billModel.expenses?.category?.fundMoney??0).bankBalance}元',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                      )
                  ),
                  Positioned(
                    bottom: 45.w,
                    left: (370/2).w - (27/2).w,
                    child:
                    BouncingAnimationWidget(child:
                    Image(
                      image: 'down_arrow'.png3x,
                      width: 17.w + 10.w,
                      height: 22.w + 10.w,
                    ),
                    ),
                  )
            ]),
          );
        },id: 'updateUI',),

        Container(
          height: 1.sh,
          child: Column(
            children: [
              Image(image: 'ydzd_03'.png3x,fit: BoxFit.fitWidth,)
            ],
          ),
        ),

        Container(
          height: 1.sh,
          child: Column(
            children: [
              Image(image: 'ydzd_031'.png3x,fit: BoxFit.fitWidth,),
              Image(image: 'ydzd_033'.png3x, fit: BoxFit.fitWidth,)
            ],
          ),
        ),
        Center(
          child: Container(
            width: 375.w,
            height: 724.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: 'ydzd_04'.png3x,fit: BoxFit.fitWidth
              ),
            ),
            child:  Column(
              children: [

                Container(
                  margin: EdgeInsets.only(top: 295.w),
                  width: 220.w,
                  height: 48.w,
                ).withOnTap(onTap: (){
                  Get.back();
                }),

                Container(
                  margin: EdgeInsets.only(top: 20.w),
                  width: 220.w,
                  height: 48.w,
                ).withOnTap(onTap: (){
                  Get.back();
                })
              ],
            ),
          )
        )

      ],
    ));
  }
}