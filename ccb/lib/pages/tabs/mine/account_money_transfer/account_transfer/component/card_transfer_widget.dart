import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/scan_card/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../account_transfer_logic.dart';
import '../account_transfer_state.dart';
import 'account_transfer_widget.dart';

class CardTransferWidget extends StatefulWidget {
  const CardTransferWidget({super.key});

  @override
  State<CardTransferWidget> createState() => _CardTransferWidgetState();
}

class _CardTransferWidgetState extends State<CardTransferWidget>   with WidgetsBindingObserver{
  final AccountTransferLogic logic = Get.put(AccountTransferLogic());
  final AccountTransferState state = Get.find<AccountTransferLogic>().state;

  String cardId = '';


  @override
  void initState() {
    super.initState();
    logic.state.accountFocusNode.addListener(_onFocusChanged);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  void _onFocusChanged() {
    if (logic.state.accountFocusNode.hasFocus) {
      logic.state.showAccountTextField = true;
    }
  }

  bool showAccount = true;


  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset == 0) {
      if(!state.accountFocusNode.hasFocus && showAccount && state.showAccountTextField){
        showAccount = false;
        if(state.accountTextController.text != ''){
          Http.get(Apis.getCardBank,queryParameters: {
            'cardNo':state.accountTextController.text,
          },).then((v){
            if(v != null) {
              state.bankData['url'] = v['icon'];
              state.bankData['id'] = v['id'];
              state.bankData['name'] = v['name'];
              logic.update(['updateBottom']);
              setState(() {});
            }
            showAccount = true;
          });


        }else{
          Future.delayed(const Duration(milliseconds: 400),(){
            showAccount = true;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder:(AccountTransferLogic c){
      return Container(
        width: 340.w,
        height: 152.w + (cardId == '' ? 0 : 50.w),
        margin: EdgeInsets.only(top: 12.w, right: 18.w, left: 18.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.w),
          ),
        ),
        child: Column(
          children: [
            BaseText(
              text: "转给",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ).withContainer(
                height: (18 + 16).w,
                width: 340.w,
                padding: EdgeInsets.only(top: 12.w, left: 20.w)),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transfer.itemCellWidget(
                              title: "收款人",
                              hintText: '请输入收款人姓名',
                              controller: state.nameTextController,
                              onSubmitted: (v) {
                                logic.update(['updateBottom']);
                              }),
                          Image(
                            image: 'ic_qblxxr'.png3x,
                            width: 16.w,
                            height: 16.w,
                          ).withPadding(right: 16.w).withOnTap(onTap: (){
                            Get.toNamed(Routes.contactsListPage)?.then((value){
                              // print(value);
                              if(value !=null){
                                cardId = value['bank']['id'];
                                logic.selectCon(value);
                                setState(() {});
                              }
                            });
                          }),
                        ],
                      ),
                    ),
                    Container(
                      width: 298.w,
                      height: 1.w,
                      color: const Color(0xffE7E9EB),
                    ),
                    Expanded(
                        child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Transfer.itemCellWidget(
                                    title: "收款账号",
                                    hintText: '请输入收款账号',
                                    keyboardType:TextInputType.datetime,
                                    style: TextStyle(
                                      fontSize:14.sp,
                                      color: const Color(0xff5C5C5C),
                                    ),
                                    controller: state.accountTextController,
                                    focusNode: state.accountFocusNode,
                                    onChanged: (v){
                                      cardId = v;
                                    },),


                                Image(
                                  image: 'ic_smkh'.png3x,
                                  width: 16.w,
                                  height: 16.w,
                                ).withPadding(right: 16.w).withOnTap(onTap: () {
                                  Get.to(ScanCardPage());
                                }),
                              ],
                            )
                        )),
                    cardId == ''
                        ? const SizedBox.shrink()
                        : Container(
                      width: 298.w,
                      height: 1.w,
                      color: const Color(0xffE7E9EB),
                    ),
                    cardId == ''
                        ? const SizedBox.shrink()
                        : Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                BaseText(
                                  text: '收款银行',
                                  fontSize: 15.sp,
                                ).withContainer(
                                    width: 108.w,
                                    height: 45.w,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 20.w, top: 2.w)),
                                state.bankData['name'] == ''
                                    ? BaseText(
                                    text: '请选择银行',
                                    fontSize: 14.sp,
                                    color: const Color(0xffCACACA))
                                    : Row(
                                  children: [
                                    NetImageWidget(
                                      url: state.bankData['url'],
                                      width: 18.w,
                                      height: 18.w,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    BaseText(
                                      text: state.bankData['name'],
                                      fontSize: 14.sp,
                                      color: const Color(0xff666666),
                                    ).withContainer(width: 170.w)
                                  ],
                                )
                              ],
                            ),
                            Icon(
                              Icons.navigate_next,
                              size: 24.w,
                              color: const Color(0xff999999),
                            ).withPadding(right: 12.w)
                          ],
                        ).withOnTap(onTap: () {
                          Get.toNamed(Routes.bankListPage)?.then((value) {
                            if (value != null) {
                              print(value);
                              state.bankData = value;
                              logic.update(['updateBottom']);
                              setState(() {});
                            }
                          });
                        })),
                  ],
                ))
          ],
        ),
      );
    },id: 'updateCardTransfer',);
  }
}
