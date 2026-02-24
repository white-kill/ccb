import 'package:ccb/config/dio/interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../utils/scale_point_widget.dart';
import 'mine_receipt_logic.dart';
import 'mine_receipt_state.dart';
import 'package:image/image.dart' as img;

class MineReceiptPage extends BaseStateless {
  MineReceiptPage({Key? key}) : super(key: key, title: '回单详情');

  final MineReceiptLogic logic = Get.put(MineReceiptLogic());
  final MineReceiptState state = Get.find<MineReceiptLogic>().state;

  @override
  List<Widget>? get rightAction => [
        const ScalePointWidget().withPadding(right: 6.w),
        const Icon(
          Icons.clear,
          color: Colors.black,
        ).withOnTap(onTap: () {
          Get.back();
        }).withPadding(
          right: 16.w,
        )
      ];

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
          children: [
            GetBuilder(
              builder: (MineReceiptLogic c) {
                return Container(
                    margin: EdgeInsets.only(top: 6.w, left: 15.w, right: 15.w),
                    color: const Color.fromARGB(255, 220, 234, 235),
                    padding: EdgeInsets.all(6.w),
                    child: RepaintBoundary(
                      key: state.shareGoodsGlobalKey,
                      child: Stack(
                        children: [
                          Container(
                            color: const Color.fromARGB(255, 236, 241, 245),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                String name =  state.nameList[index];
                                bool show1 = name == '收款方' || name == '付款方';
                                if (index == state.nameList.length -1) {
                                  return Container(
                                    height: 80.w,
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        left: 15.w, right: 15.w),
                                    child: BaseText(
                                      text: state.nameList[index],
                                      fontSize: 10.sp,
                                      maxLines: 10,
                                      color: const Color(0xff999999),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    padding: EdgeInsets.only(
                                        top: show1 ? 8.w : 6.w,
                                        bottom: show1 ? 8.w : 6.w,
                                        left: 20.w),
                                    color: show1 ? Colors.white : null,
                                    child: Row(
                                      children: [
                                        BaseText(
                                          text: state.nameList[index],
                                          style: TextStyle(
                                              fontSize: show1 ? 16.sp : 11.sp,
                                              color: show1
                                                  ? const Color(0xff286F9F)
                                                  : const Color(0xff6D7276),
                                              fontWeight: show1
                                                  ? FontWeight.w500
                                                  : FontWeight.normal),
                                        ).withContainer(width: 80.w),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: name == '账号 '
                                                  ? null
                                                  : (1.sw * 0.8) - 120.w,
                                              child: BaseText(
                                                maxLines: 5,
                                                fontSize: 12.sp,
                                                color: index == 3
                                                    ? const Color(0xff286F9F)
                                                    : const Color(0xff3D4045),
                                                text: state.infoModel.merchantBranch == ''
                                                    ? logic.valueName(index)
                                                    : logic.valueName1(index),
                                              ),
                                            ),
                                            (logic.show == true && name == '账号 ')
                                                ? Obx(() => BaseText(
                                                      text: logic.showCardNumber.value
                                                          ? '隐藏'
                                                          : '显示完整卡号',
                                                      fontSize: 12.sp,
                                                      color: Colors.blue,
                                                    ).withPadding(left: 15.w).withOnTap(onTap: () {
                                                      if (state.fistClick && !logic.showCardNumber.value) {
                                                        '尊敬的客户，'
                                                                '须知您的完整银行账号为个人敏感信息，'
                                                                '请保护好个人信息，'
                                                                '谨慎选择分享完整账号至他人，'
                                                                '避免重要信息泄露。'
                                                            .dialog(
                                                                title: '风险提示',
                                                                titleColor: Colors.blue,
                                                                contentAlign: TextAlign.left,
                                                                cancel: const BaseText(
                                                                  text: '不在提示',
                                                                  color: Color( 0xff666666),
                                                                ),
                                                                sure: const BaseText(
                                                                  text: '我已经知晓',
                                                                  color: Colors .blue,
                                                                ),
                                                                contentStyle: TextStyle(
                                                                    color: const Color( 0xff777777),
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 2),
                                                                onBack: (value) {
                                                                  state.fistClick = value;
                                                                });
                                                      }
                                                      logic.showCardNumber.value = !logic.showCardNumber.value;
                                                      logic.update(['updateUI']);
                                                    }))
                                                : const SizedBox.shrink()
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }
                              },
                              itemCount: state.nameList.length,
                            ),
                          ),
                          Positioned(
                              bottom: 108.w,
                              right: 25.w,
                              child: Image(
                                image: 'hd_z'.png3x,
                                width: 80.w,
                                height: 80.w,
                              ))
                        ],
                      ),
                    ));
              },
              id: 'updateUI',
            ),
          ],
        )),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 20.w),
              child: Image(
                image: state.imageList[index].png3x,
                width: 68.w,
                height: 96.w,
              ),
            );
          },
          itemCount: state.imageList.length,
        ).withContainer(width: 1.sw, height: 80.w),
        SizedBox(
          height: 30.w,
        ),
        Container(
          height: ScreenUtil().bottomBarHeight + 68.w,
          width: 1.sw,
          margin: EdgeInsets.only(top: 10.w),
          padding: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight + 6.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 20.w),
              Expanded(
                child: Container(
                  height: 42.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.w)),
                    border: Border.all(color: Colors.blue, width: 1.w),
                  ),
                  child: BaseText(
                    text: '保存回单',
                    fontSize: 14.sp,
                    color: Colors.blue,
                  ),
                ).withOnTap(
                  onTap: () {
                    logic
                        .capturePng(globalKey: state.shareGoodsGlobalKey)
                        .then((value) async {
                      logic.stitchImagesVertically(value!);
                    });
                  },
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Container(
                  height: 42.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: Colors.blue),
                  child: BaseText(
                    text: '微信通知好友',
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ).withOnTap(
                  onTap: () {
                    '未找到微信应用'.showToast;
                  },
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        )
      ],
    );
  }
}
