import 'package:ccb/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import 'detail_search_logic.dart';
import 'detail_search_state.dart';

class DetailSearchPage extends BaseStateless {
  DetailSearchPage({Key? key}) : super(key: key);

  final DetailSearchLogic logic = Get.put(DetailSearchLogic());
  final DetailSearchState state = Get.find<DetailSearchLogic>().state;

  @override
  Widget? get titleWidget => Container(
        height: 34.w,
        margin: EdgeInsets.only(right: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.w),
          ),
        ),
        child: Row(
          children: [
            Image(
              image: 'ic_search_left'.png3x,
              width: 16.w,
              height: 16.w,
              color: const Color(0xffC8C8C8),
            ).withPadding(
              left: 12.w,
              right: 12.w
            ),
            TextFieldWidget(
              hintText: '请输入用户名、摘要、附言等关键字',
              controller: state.textController,
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: Color(0xff7F7F7F),
              ),
              onSubmitted: (e) {
                List<String> searchList = searchHistoryValue.split(',');
                if (!searchList.contains(e)) {
                  searchList.add(e);
                }
                searchList.join(',').saveSearchHistory;
                Get.offNamed(Routes.detailSearchListPage, arguments: {
                  'keyword': e,
                });
              },
            ).withContainer(
              width: 210.w
            ),
          ],
        )
      );



  @override
  List<Widget>? get rightAction => [
    BaseText(text: '搜索',fontSize: 15.sp,).withOnTap(onTap: () {
      List<String> searchList = searchHistoryValue.split(',');
      String e = state.textController!.text;
      if (!searchList.contains(e)) {
        searchList.add(e);
      }
      searchList.join(',').saveSearchHistory;
      Get.offNamed(Routes.detailSearchListPage, arguments: {
        'keyword': e,
      });
    }).withContainer(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 15.w,right: 15.w)
    ),
  ];

  @override
  Color? get navColor => Color(0xFFF7F7F7);

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseText(
              text: '历史搜索',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.w),
            ),

            // Icon(Icons.delete_outline_sharp,color: Color(0xff999999),).withPadding(
            //   right: 15.w,
            //   bottom: 5.w
            // )
          ],
        ).withPadding(left: 16.w, top: 24.w),
        SizedBox(
          height: 10.w,
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 24.w,
          runSpacing: 20.w,
          children: searchHistoryValue.split(',').map((e) {
            return Container(
              child: BaseText(
                text: e,
                fontSize: 14.w,
              ).withOnTap(onTap: () {
                Get.offNamed(Routes.detailSearchListPage, arguments: {
                  'keyword': e,
                });
              }),
            );
          }).toList(),
        ).withPadding(
          left: 25.w,
          right: 35.w,
        ),
        BaseText(
          text: '快速搜索',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.w),
        ).withPadding(left: 16.w, top: 24.w),
        SizedBox(
          height: 10.w,
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 24.w,
          runSpacing: 20.w,
          children: state.nameList.map((e) {
            return Container(
              child: BaseText(
                text: e,
                fontSize: 14.w,
              ).withOnTap(onTap: () {
                List<String> searchList = searchHistoryValue.split(',');
                if (!searchList.contains(e)) {
                  searchList.add(e);
                }
                searchList.join(',').saveSearchHistory;
                Get.offNamed(Routes.detailSearchListPage, arguments: {
                  'keyword': e,
                });
              }),
            );
          }).toList(),
        ).withPadding(
          left: 25.w,
          right: 35.w,
        ),
      ],
    );
  }
}
