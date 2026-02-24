import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class HomeNoticeWidget extends StatefulWidget {
  const HomeNoticeWidget({super.key});

  @override
  State<HomeNoticeWidget> createState() => _HomeNoticeWidgetState();
}

class _HomeNoticeWidgetState extends State<HomeNoticeWidget> {

  List list = [
    {
      'icon':'ic_dz_icon',
      'content':'你有1条账户变动通知，快来看看吧！',
    },

    {
      'icon':'ic_gg_icon',
      'content':'今日有上新活动哦！',
    }
  ];
  @override
  Widget build(BuildContext context) {

    return Swiper(
      scrollDirection:Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: list[index]['icon'].toString().png3x,
                  height: index == 0?24.w:45.w,
                  width: index == 0?35.w:45.w,
                ),
                SizedBox(width: 10.w,),
                BaseText(text: list[index]['content'])
              ],
            ),
            
            Icon(Icons.navigate_next,size: 20.w,)
          ],
        );
      },
      itemCount: list.length,
      autoplay: true,
    ).withContainer(
      width: 1.sw,
      height: 45.w,
      color: Color(0xFFF3FBFE),
      padding: EdgeInsets.only(left:12.w,right: 12.w,bottom: 10.w)
    );
  }
}
