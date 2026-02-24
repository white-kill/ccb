import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../account_transfer_logic.dart';
import '../account_transfer_state.dart';
import 'account_transfer_widget.dart';

class TransferRemarks extends StatefulWidget {
  const TransferRemarks({super.key});

  @override
  State<TransferRemarks> createState() => _TransferRemarksState();
}

class _TransferRemarksState extends State<TransferRemarks> {

  List<String> list = [
    '生活费',
    '工资',
    '房租',
    '信用卡还款'
  ];

  final AccountTransferLogic logic = Get.put(AccountTransferLogic());
  final AccountTransferState state = Get.find<AccountTransferLogic>().state;

  bool onShow = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      // height: 48.w,
      margin: EdgeInsets.only(top: 12.w, right: 18.w, left: 18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.w),
        ),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transfer.itemCellWidget(
            title: "转账用途",
            hintText: '30个字以内的描述（选填）',
            controller: state.remarksTextController,
            onTap: (){
              onShow = true;
              setState(() {});
            }
          ).withPadding(
            top: 5.w,
            bottom: 5.w
          ),

          !onShow? const SizedBox.shrink():Container(
            width: 1.sw,
            height: 1.w,
            alignment: Alignment.center,
            child:  Container(
              width: 1.sw - 60.w,
              height: 1.w,
              color: const Color(0xffE7E9EB),
            ),
          ),
          !onShow? const SizedBox.shrink(): Wrap(
            direction: Axis.horizontal,
            spacing: 6.w,
            runSpacing: 8.w,
            children: list.map((e) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                constraints: BoxConstraints(
                  minWidth: 55.w,
                  minHeight: 24.w
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6.w),
                ),
                child: Text(e,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff575757),
                  ),
                ).withOnTap(onTap: (){
                  state.remarksTextController.text = e;
                }),
              );
            }).toList(),
          ).withPadding(
            top: 10.w,
            left: 12.w,
            bottom: 10.w,
          )
        ],
      ),
    );
  }
}
