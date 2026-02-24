import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class LifeItemsWidget extends StatefulWidget {
  const LifeItemsWidget({super.key});

  @override
  State<LifeItemsWidget> createState() => _LifeItemsWidgetState();
}

class _LifeItemsWidgetState extends State<LifeItemsWidget> {
  List nameList = [
    {
      'name': '手机话费',
      'image': '',
    },
    {
      'name': '电费',
      'image': '',
    },
    {
      'name': '医保码',
      'image': '',
    },
    {
      'name': '飞常准',
      'image': '',
    },
    {
      'name': '电影演出',
      'image': '',
    },
    {
      'name': '智慧食堂',
      'image': '',
    },
    {
      'name': '积分汇',
      'image': '',
    },
    {
      'name': '党费',
      'image': '',
    },
    {
      'name': '燃气费',
      'image': '',
    },
    {
      'name': '水费',
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
