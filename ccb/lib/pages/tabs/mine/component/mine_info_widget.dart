import 'package:ccb/config/app_config.dart';
import 'package:ccb/data/model/member_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import '../../../../config/balance_config/balance_logic.dart';
import '../../../../routes/app_pages.dart';

class MineInfoWidget extends StatefulWidget {
  const MineInfoWidget({super.key});

  @override
  State<MineInfoWidget> createState() => _MineInfoWidgetState();
}

class _MineInfoWidgetState extends State<MineInfoWidget> {
  List infoDataList = [
    {'name': '银行卡'},
    {'name': '积分'},
    {'name': '优惠券'},
    {'name': '信用卡权益'},
  ];

  String getNumber(String name, BalanceLogic c) {
    if (name == '银行卡') {
      return c.memberInfo.bankList.length.toString();
    }
    if (name == '积分') {
      return c.memberInfo.points;
    }
    if (name == '优惠券') {
      return  c.memberInfo.couponsNum;
    }
    if (name == '信用卡权益') {
      return  c.memberInfo.credit.isEmpty ? "0" : c.memberInfo.credit;
    }
    return '0';
  }

  void jumpPage(String name) {
    if (name == '银行卡') {
      Get.toNamed(Routes.accountPreview);
    }
    if (name == '积分') {
      // Get.toNamed(Routes.naviOffset, arguments: {
      //   'title': '积分汇',
      //   'image': 'bg_jfenh',
      // });
      Get.toNamed(Routes.minePointsPage);
    }
    if (name == '优惠券') {
      Get.toNamed(Routes.naviOffset, arguments: {
        'title': '我的优惠券',
        'image': 'bg_yhuiq',
      });
    }
    if (name == '信用卡权益') {
      Get.toNamed(Routes.mineRightsPage);
      // Get.toNamed(Routes.naviOffset, arguments: {
      //   'title': '权益中心',
      //   'image': 'bg_xykqy',
      //   'navColor':  Colors.white.withOpacity(0.1),
      // });
    }
  }

  List<Widget> starWidget(BalanceLogic c) {
    print(c.memberInfo.starRating);
    print(c.memberInfo.starRating);
    print(c.memberInfo.starRating);
    int count = 0;
    if(c.memberInfo.starRating == ''){
      count = 0;
    }else {
      count = int.parse(c.memberInfo.starRating);
    }
    return List.generate(count, (index) => index + 1).map((e) {
      return Image(
        image: 'ic_mine_star'.png3x,
        width: 15.w,
        height: 15.w,
      );
    }).toList();
  }

  late MemberInfoModel infoModel;

  String sex = '';
  @override
  void initState() {
    super.initState();
    infoModel = AppConfig.config.balanceLogic.memberInfo;
    if(infoModel.sex == ''){
      sex = '1';
    }else{
      sex = infoModel.sex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return GetBuilder(
      builder: (BalanceLogic c) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  margin: EdgeInsets.only(left: 26.w, right: 14.w,top: 10.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.w))),
                  child: Image(image: 'ic_ccb_sex$sex'.png3x),
                ).withOnTap(onTap: () => Get.toNamed(Routes.personInfoPage)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(image: 'ic_mine_xin'.png3x,width: 12.w,height: 13.w,).withPadding(
                              bottom:3.w,
                              right: 1.w
                            ),
                            BaseText(
                              text: AppConfig
                                  .config.balanceLogic.memberInfo.realName.removeFirstChar(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19.sp
                              ),
                            ).withOnTap(onTap: ()=>{
                              Get.toNamed(Routes.personInfoPage)
                            }),
                            SizedBox(
                              width: 6.w,
                            ),
                            ...starWidget(c),
                          ],
                        ).withOnTap(
                            onTap: () => Get.toNamed(Routes.personInfoPage)),
                        Image(
                          image: 'ic_mine_qy'.png3x,
                          width: 86.w,
                          height: 26.w,
                        ).withOnTap(
                            onTap: () => {
                              Get.toNamed(Routes.naviOffset, arguments: {
                                'title': '权益中心',
                                'image': 'bg_xykqy',
                                'navColor':  Colors.white.withOpacity(0.1),
                              })
        }),
                      ],
                    ).withSizedBox(width: 270.w),
                    BaseText(
                      text:
                          "上次登录${AppConfig.config.balanceLogic.memberInfo.loginTime}",
                      fontSize: 12.sp,
                      color: const Color(0xff666666),
                    )
                  ],
                ).withContainer(
                  height: 50.w,
                )
              ],
            ),
            Expanded(child: Container(
              alignment: Alignment.center,
              child: VerticalGridView(
                widgetBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BaseText(
                        text: getNumber(infoDataList[index]['name'], c),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      BaseText(
                        text: infoDataList[index]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: const Color(0xff666666)),
                      ),
                      SizedBox(height: 10.w,)
                    ],
                  ).withOnTap(onTap: () => jumpPage(infoDataList[index]['name']));
                },
                mainHeight: 58.w,
                itemCount: 4,
              ),
            ))
          ],
        ).withPadding(top: navHeight);
      },
      id: 'updateBalance',
    );

   // return GetBuilder(builder: (BalanceLogic c){
   //   return Column(
   //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
   //     children: [
   //       Row(
   //         children: [
   //           Container(
   //             width: 50.w,
   //             height: 50.w,
   //             margin: EdgeInsets.only(left: 26.w, right: 14.w),
   //             decoration: BoxDecoration(
   //                 color: Colors.white,
   //                 borderRadius: BorderRadius.all(Radius.circular(30.w))),
   //           ).withOnTap(onTap: ()=> Get.toNamed(Routes.mineInfoPage)),
   //           Column(
   //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
   //             crossAxisAlignment: CrossAxisAlignment.start,
   //             children: [
   //               Row(
   //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
   //                 children: [
   //                   Row(
   //                     children: [
   //                       BaseText(
   //                         text: AppConfig.config.balanceLogic.memberInfo.realName,
   //                         style: const TextStyle(
   //                           fontWeight: FontWeight.bold,
   //                         ),
   //                       ),
   //                       SizedBox(width: 6.w,),
   //
   //                       ...starWidget(),
   //                     ],
   //                   ).withOnTap(onTap: ()=> Get.toNamed(Routes.mineInfoPage)),
   //                   Image(
   //                     image: 'ic_mine_qy'.png3x,
   //                     width: 86.w,
   //                     height: 26.w,
   //                   ).withOnTap(onTap: ()=> Get.toNamed(Routes.mineRightsPage)),
   //                 ],
   //               ).withSizedBox(width: 270.w),
   //               BaseText(
   //                 text: "上次登录${AppConfig.config.balanceLogic.memberInfo.loginTime}",
   //                 fontSize: 12.sp,
   //                 color: const Color(0xff666666),
   //               )
   //             ],
   //           ).withContainer(
   //             height: 50.w,
   //           )
   //         ],
   //       ),
   //       VerticalGridView(
   //         widgetBuilder: (BuildContext context, int index) {
   //           return Column(
   //             mainAxisAlignment: MainAxisAlignment.end,
   //             crossAxisAlignment: CrossAxisAlignment.center,
   //             children: [
   //               BaseText(text: getNumber(infoDataList[index]['name'],c),style: TextStyle(
   //                 fontWeight: FontWeight.bold,
   //                 fontSize: 16.sp,
   //               ),),
   //               BaseText(text: infoDataList[index]['name'],style: TextStyle(
   //                   fontWeight: FontWeight.bold,
   //                   fontSize: 12.sp,
   //                   color: const Color(0xff666666)
   //               ),),
   //
   //               SizedBox(height: 12.w,)
   //             ],
   //           ).withOnTap(onTap: () => jumpPage(infoDataList[index]['name']));
   //         },
   //         mainHeight: 58.w,
   //         itemCount: 4,
   //       ).withContainer(
   //         padding: EdgeInsets.only(top: 12.w)
   //       )
   //     ],
   //   ).withPadding(top: navHeight);
   //  },id: 'updateBalance',);

  //                SizedBox(height: 12.w,)
  //              ],
  //            ).withOnTap(onTap: () => jumpPage(infoDataList[index]['name']));
  //          },
  //          mainHeight: 58.w,
  //          itemCount: 4,
  //        ).withContainer(
  //          padding: EdgeInsets.only(top: 6.w)
  //        )
  //      ],
  //    ).withPadding(top: navHeight);
  //   },id: 'updateBalance',);
   }
}
