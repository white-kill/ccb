import 'package:ccb/pages/index/index_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../turnover_print_logic.dart';
import '../turnover_print_state.dart';

class PrintItem2Widget extends StatefulWidget {
  const PrintItem2Widget({super.key});

  @override
  State<PrintItem2Widget> createState() => _PrintItem2WidgetState();
}

class _PrintItem2WidgetState extends State<PrintItem2Widget> {
  List<String> allPrice = ['1千以下', '1千-5千', '5千-1万', '1万以上'];

  final TurnoverPrintLogic logic = Get.put(TurnoverPrintLogic());
  final TurnoverPrintState state = Get.find<TurnoverPrintLogic>().state;
  String selectName = '';

  select(String name){
    selectName = name;
    if(name == '1千以下'){
      state.controller1.text = '';
      state.controller2.text = '1000';
    }
    if(name == '1千-5千'){
      state.controller1.text = '1000';
      state.controller2.text = '5000';
    }
    if(name == '5千-1万'){
      state.controller1.text = '5000';
      state.controller2.text = '10000';
    }
    if(name == '1万以上'){
      state.controller1.text = '10000';
      state.controller2.text = '';
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 134.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseText(text: '交易金额（选填）')
              .withPadding(left: 10.w, top: 10.w, bottom: 14.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 145.w,
                height: 34.w,
                padding: EdgeInsets.only(left: 6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.w)),
                  border: Border.all(
                    color: Color(0xffA2A2A2),
                    width: 1.w,
                  ),
                ),
                child: TextFieldWidget(
                  hintText: '最低',
                  controller: state.controller1,
                ),
              ),
              Container(
                width: 20.w,
                height: 1.w,
                color: Color(0xffA2A2A2),
                margin: EdgeInsets.only(left: 10.w, right: 10.w),
              ),
              Container(
                width: 145.w,
                height: 34.w,
                padding: EdgeInsets.only(left: 6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.w)),
                  border: Border.all(
                    color: Color(0xffA2A2A2),
                    width: 1.w,
                  ),
                ),
                child: TextFieldWidget(
                  hintText: '最高',
                  controller: state.controller2,
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.w,
          ),
          VerticalGridView(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            widgetBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF2F2F2),
                    borderRadius: BorderRadius.all(Radius.circular(4.w)),
                  border:selectName == allPrice[index]?Border.all(
                    color: const Color(0xff283CB1),
                    width: 1.w
                  ):null
                ),
                alignment: Alignment.center,
                child: BaseText(
                  text: allPrice[index],
                  color: selectName == allPrice[index]?const Color(0xff283CB1):Colors.black,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ).withOnTap(onTap: ()=> select(allPrice[index]));
            },
            itemCount: allPrice.length,
            crossCount: 4,
            mainHeight: 30.w,
            spacing: 10.w,
          ),
        ],
      ),
    );
  }
}
