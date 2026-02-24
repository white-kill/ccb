import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class WealthItemsWidget extends StatefulWidget {
  const WealthItemsWidget({super.key});

  @override
  State<WealthItemsWidget> createState() => _WealthItemsWidgetState();
}

class _WealthItemsWidgetState extends State<WealthItemsWidget> {
  List nameList = [
    {
      'name': '存款产品',
      'image': '',
    },
    {
      'name': '理财产品',
      'image': '',
    },
    {
      'name': '基金投资',
      'image': '',
    },
    {
      'name': '保险',
      'image': '',
    },
    {
      'name': '贵金属',
      'image': '',
    },
    {
      'name': '建行严选',
      'image': '',
    },
    {
      'name': '龙钱宝1号',
      'image': '',
    },
    {
      'name': '龙钱宝2号',
      'image': '',
    },
    {
      'name': '薪享通',
      'image': '',
    },
    {
      'name': '更多',
      'image': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 12.w, right: 12.w),
        width: 1.sw - 24.w,
        height: 135.w,
        decoration: BoxDecoration(
          color: Colors.white, // 背景颜色
          borderRadius: BorderRadius.circular(10.w), // 圆角
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 12.w)),
            VerticalGridView(
              widgetBuilder: (_, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: 'ic_home_2_$index'.png3x,
                      width: 29.w,
                      height: 29.w,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    BaseText(
                      text: nameList[index]['name'],
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff575757),
                          height: 1),
                    ),
                  ],
                );
              },
              itemCount: nameList.length,
              crossCount: 5,
              mainHeight: 50.w,
              spacing: 8.w,
            ),
          ],
        ));
  }
}
