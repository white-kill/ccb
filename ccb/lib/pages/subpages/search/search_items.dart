import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../routes/app_pages.dart';

class SearchItemsWidget extends StatefulWidget {
  const SearchItemsWidget({super.key});

  @override
  State<SearchItemsWidget> createState() => _SearchItemsWidgetState();
}

class _SearchItemsWidgetState extends State<SearchItemsWidget> {
  List nameList = [
    {
      'name': '转账汇款',
      'image': '',
    },
    {
      'name': '流水打印',
      'image': '',
    },
    {
      'name': '明细查询',
      'image': '',
    },
    {
      'name': '收支明细',
      'image': '',
    },
    {
      'name': '月度账单',
      'image': '',
    },
    {
      'name': '电子印章',
      'image': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w,bottom: 12.w),
        decoration: BoxDecoration(
          color: Colors.white, // 背景颜色
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '我的搜索',
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 12.w,
              runSpacing: 12.w,
              children: nameList.map((e) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                  // 设置圆角
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  child: Text(
                    e['name'],
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ).withOnTap(onTap: (){
                    Get.toNamed(Routes.searchContentPage,arguments: {
                      'name':e['name'],
                    });
                  }),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
