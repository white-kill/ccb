import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../turnover_print_logic.dart';

class PrintItem4Widget extends StatefulWidget {
  const PrintItem4Widget({super.key});

  @override
  State<PrintItem4Widget> createState() => _PrintItem4WidgetState();
}

class _PrintItem4WidgetState extends State<PrintItem4Widget> {
  final TurnoverPrintLogic logic = Get.put(TurnoverPrintLogic());

  List contentList = [
    '展示对方账号与户名',
    '展示交易地点/附言',
    '完整展示申请人账户',
    '完整展示申请人户名'
  ];

  // 0完整展示对方账号 1完整显示对方户名 2暂时交易地点/附言 3完整显示申请人账号 4完整显示申请人户名
  List selectTag = [
    '展示对方账号与户名',
    '完整展示申请人账户',
    '完整展示申请人户名'
  ];

  Map<String,String> valueMap = {
    '展示对方账号与户名':'0',
    '展示交易地点/附言':'2',
    '完整展示申请人账户':'3',
    '完整展示申请人户名':'4'
  };


  void select(String name){
    List temList = [];
    temList.addAll(selectTag);
    if(selectTag.contains(name)){
      temList.remove(name);
    }else{
      temList.add(name);
    }
    selectTag = temList;
    logic.state.showType = selectTag.map((e){
      return valueMap[e];
    }).toList().join(',');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 135.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BaseText(text: '交易信息展示').withPadding(
                  left: 10.w,top: 10.w,bottom: 12.w
              ),
              BaseText(text: '样例预览',fontSize: 10.sp,color: Color(0xff283CB1),).withPadding(
                  right: 10.w,top: 10.w,bottom: 12.w
              ).withOnTap(onTap: (){
                SmartDialog.show(
                  usePenetrate: false,
                  clickMaskDismiss: true,
                  builder: (_) {
                    return Image(image: 'ic_ylyl'.png3x).withPadding(
                      left: 10.w,right: 10.w

                    );
                  },
                );
              }),
              //ic_ylyl
            ],
          ),
          //
          VerticalGridView(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            widgetBuilder: (_, index) {
              return Row(
                children: [

                  selectTag.contains(contentList[index])
                      ?Image(image: 'ic_print_check'.png3x,width: 16.w,height: 16.w,).withOnTap(onTap: ()=> select(contentList[index]) )
                      : Icon(Icons.check_box_outline_blank,size: 18.w,color: const Color(0xffA2A2A2 ),).withOnTap(onTap: ()=> select(contentList[index])),
                  SizedBox(width: 5.w,),
                  BaseText(text: contentList[index],color: Color(0xff999999 ),fontSize: 13.sp,)
                ],
              );
            },
            itemCount: contentList.length,
            crossCount: 2,
            mainHeight: 22.w,
            spacing: 5.w,
          ),
        ],
      ),
    );
  }
}
