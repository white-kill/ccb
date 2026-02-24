import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../routes/app_pages.dart';

class FunctionBannerWidget extends StatefulWidget {
  const FunctionBannerWidget({super.key});

  @override
  State<FunctionBannerWidget> createState() => _FunctionBannerWidgetState();
}

class _FunctionBannerWidgetState extends State<FunctionBannerWidget> {
  List dataList = [
    // [
    //   {'image': 'ic_fhome_1_', 'name': '存款产品'},
    //   {'image': 'ic_fhome_1_', 'name': '理财产品'},
    //   {'image': 'ic_fhome_1_', 'name': '信用卡申请'},
    //   {'image': 'ic_fhome_1_', 'name': '住房'},
    //   {'image': 'ic_fhome_1_', 'name': '实物贵金属'},
    //   {'image': 'ic_fhome_1_', 'name': '个人养老金'},
    //   {'image': 'ic_fhome_1_', 'name': '分期通'},
    //   {'image': 'ic_fhome_1_', 'name': '基金投资'},
    //   {'image': 'ic_fhome_1_', 'name': '流水打印'},
    //   {'image': 'ic_fhome_1_', 'name': '医保码'}
    // ],
    [
      {'image': 'ic_fhome_1_', 'name': '存款产品'},
      {'image': 'ic_fhome_1_', 'name': '贵金属'},
      {'image': 'ic_fhome_1_', 'name': '信用卡申请'},
      {'image': 'ic_fhome_1_', 'name': '建信福贷'},
      {'image': 'ic_fhome_1_', 'name': '理财产品'},
      {'image': 'ic_fhome_1_', 'name': '生活缴费'},
      {'image': 'ic_fhome_1_', 'name': '惠省钱'},
      {'image': 'ic_fhome_1_', 'name': '速盈'},
      {'image': 'ic_fhome_1_', 'name': '数字人民币'},
      {'image': 'ic_fhome_1_', 'name': '更多'}
    ],
    [
      {'image': 'ic_fhome_2_', 'name': '社保'},
      {'image': 'ic_fhome_2_', 'name': '龙积分商城'},
      {'image': 'ic_fhome_2_', 'name': '权益中心'},
      {'image': 'ic_fhome_2_', 'name': '网点服务'},
      {'image': 'ic_fhome_2_', 'name': '保险'},
      {'image': 'ic_fhome_2_', 'name': '生活缴费'},
      {'image': 'ic_fhome_2_', 'name': '证券期货'},
      {'image': 'ic_fhome_2_', 'name': '住房公积金'},
      {'image': 'ic_fhome_2_', 'name': '个人信用报告'},
      {'image': 'ic_fhome_2_', 'name': '更多'}
    ]
  ];

  void jumpPage(String name) {
    print(name);
    switch (name) {
      case '存款产品':
        Get.toNamed(Routes.ckcp);
        return;
      case '贵金属':
        Get.toNamed(Routes.gjs);
        return;
      case '信用卡申请':
        Get.to(
          () => Scaffold(
            backgroundColor: Colors.black,
            body: GestureDetector(
              onTap: () => Get.back(),
              child: SingleChildScrollView(
                child: Image(
                  width: 1.sw,
                  image: 'bg_xyksq'.png3x,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        );
        return;
      case '建信福贷':
        Get.toNamed(Routes.fixedNavPage, arguments: {
          'title': '首页',
          'image': 'bg_jxfd',
          'rightWidget': Row(
            children: [],
          ),
        });
        return;
      case '理财产品':
        Get.toNamed(Routes.lccp);
        return;
      case '生活缴费':
        Get.toNamed(Routes.shjf);
        return;
      case '惠省钱':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '惠省钱',
          'image': 'bg_huishengq',
        });
        return;
      case '速盈':
        Get.toNamed(Routes.sy);
        return;
      case '数字人民币':
        SmartDialog.show(
          usePenetrate: false,
          clickMaskDismiss: false,
          builder: (_) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 0.8.sw,
                    child: Image(
                      image: "shrmb_tip".png3x,
                      fit: BoxFit.fitWidth,
                    ).withOnTap(onTap: () {
                      SmartDialog.dismiss();
                    }),
                  )
                ]);
          },
        );
        return;
      case '社保':
        Get.toNamed(Routes.sheBao);
        return;
      case '龙积分商城':
        Get.toNamed(Routes.minePointsPage);
        return;
      case '证券期货':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '交易',
          'image': 'bg_zqqh',
        });
        return;
      case '更多':
        Get.toNamed(Routes.more);
        return;
      case '基金投资':
        Get.toNamed(Routes.jjtz);
        return;
      case '流水打印':
        AppPages.toPrintView();
        return;
      case '医保码':
        Get.toNamed(Routes.yibaodianzi);
        return;
      case '住房':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '住房',
          'image': 'bg_zhuf',
        });
        return;
      case '龙钱包1号':
        Get.toNamed(Routes.lqb1);
        return;
      case '个人养老金':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '个人养老金',
          'image': 'bg_grylj',
        });
        return;
      case '任务中心':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '任务中心',
          'image': 'bg_rwzx',
        });
        return;
      case '实物贵金属':
        Get.toNamed(Routes.gjs);
        return;
      case '积分汇':
        Get.toNamed(Routes.minePointsPage);
        return;
      case '权益中心':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '权益中心',
          'image': 'bg_xykqy',
          'navColor':  Colors.white.withOpacity(0.1),
        });
        return;
      case '网点服务':
        Get.toNamed(Routes.wdfw);
        return;
      case '保险':
        Get.toNamed(Routes.bx);
        return;
      case '现金转出':
        return;
      case '他行转入':
        return;
      case '住房公积金':
        Get.toNamed(Routes.gongjijin);
        return;
      case '个人信用报告':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '个人信用报告',
          'image': 'bg_grxybg',
        });
        return;
      case '分期通':
        Get.toNamed(Routes.fixedNavPage, arguments: {
          'title': '分期通',
          'image': 'bg_fqitong',
        });
        return;
      case '转账汇款':
        Get.toNamed(
          Routes.accountMoneyTransferView,
        );
        return;
      case '龙支付':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '龙支付',
          'image': 'bg_lzf',
        });
        return;
      case '一键绑卡':
        Get.toNamed(Routes.yjbk);
        return;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sw / 1080 * 462,
      width: 1.sw,
      padding: EdgeInsets.only(top: 1.sw / 1080 * 55, left: 20.w, right: 20.w),
      // color: Color(0xFFF3FBFE),
      child: SwiperHorizontal(
          itemCount: dataList.length,
          activeColor: const Color(0xff283CB1),
          color: const Color(0xffBEBEBE),
          paginationMargin: EdgeInsets.only(bottom: 1.sw / 1080 * 40),
          widgetBuilder: (_, index) {
            return _swiperItemWidget(dataList[index], index);
          }),
    );
  }

  Widget _swiperItemWidget(List data, int idx) {
    return VerticalGridView(
      // padding: EdgeInsets.only(left: 12.w, right: 12.w),
      widgetBuilder: (_, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Stack(
              children: [
                Container(
                  // padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Image(
                    image: 'ic_fhome_${idx + 1}_${index + 1}'.png3x,
                    width: 26.w,
                    height: 26.w,
                    fit: BoxFit.fill,
                  ),
                ),
                // if (idx == 1 && index == 2)
                // Positioned(
                //   top: 0,
                //   right: 6,
                //   child: Container(
                //     width: 25,
                //     height: 20,
                //     child: Image(image: 'ic_fhome_2_2_tag'.png3x,),
                //   ),
                //
                // )
              ],
            ),
            SizedBox(
              height: 4.w,
            ),
            BaseText(
              text: data[index]['name'],
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'PingFangSC',
                  // color: const Color(0xff575757),
                  color: Colors.black.withAlpha(180),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ).withOnTap(onTap: () => jumpPage(data[index]['name']));
      },
      itemCount: data.length,
      crossCount: 5,
      mainHeight: 1.sw / 1080 * 140,
      spacing: 8.w,
    );
  }
}
