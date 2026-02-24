import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class CrediBannerWidget extends StatefulWidget {
  const CrediBannerWidget({super.key});

  @override
  State<CrediBannerWidget> createState() => _CrediBannerWidgetState();
}

class _CrediBannerWidgetState extends State<CrediBannerWidget> {
  List nameList = [
    {
      'name': '信用卡包',
      'image': '',
    },
    {
      'name': '卡权益',
      'image': '',
    },
    {
      'name': '卡优惠',
      'image': '',
    },
    {
      'name': '分期通',
      'image': '',
    },
    {
      'name': '现金',
      'image': '',
    },
    {
      'name': '推荐有礼',
      'image': '',
    },
    {
      'name': '额度调整',
      'image': '',
    },
    {
      'name': '积分兑换',
      'image': '',
    },
    {
      'name': '一键绑卡',
      'image': '',
    },
    {
      'name': '更多',
      'image': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 277.w + ScreenUtil().statusBarHeight,
          width: 1.sw,
        ),
        Container(
          height: 277.w + ScreenUtil().statusBarHeight - 39.w,
          width: 1.sw,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'bg_card_top'.png3x,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
            left: 12.w,
            bottom: 0,
            right: 12.w,
            child: Container(
                height: 135.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.w))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
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
                      spacing: 5.w,
                    ),
                  ],
                )))
      ],
    );
  }
}
