import 'package:ccb/config/app_config.dart';
import 'package:ccb/pages/tabs/card/card_logined1.dart';
import 'package:ccb/pages/tabs/new_card/fen_qi_tong/view.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ccb/utils/common_banner_widget.dart';
import 'package:ccb/pages/tabs/new_card/edu_change/view.dart';
import 'package:ccb/routes/app_pages.dart';

import '../../../../../config/balance_config/balance_logic.dart';
import 'logic.dart';
import 'state.dart';

class CardPagePage extends BaseStateless {
  CardPagePage({super.key}) : super();

  final CardPageLogic logic = Get.put(CardPageLogic());
  final CardPageState state = Get.find<CardPageLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  List<Widget>? get rightAction => [
        NavActionWidget(
          left: 8.w,
          title: '客服',
          image: 'card/ear_icon',
        ),
      ];

  @override
  Widget? get leftItem => Container();

  @override
  Widget? get titleWidget => Row(
        children: [
          GetBuilder(
            builder: (BalanceLogic c) {
              return Row(
                children: [
                  Image(
                      image: 'card/location_icon'.png,
                      width: 14.w,
                      height: 16.h),
                  SizedBox(width: 4.w),
                  Text(c.memberInfo.city,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500)),
                ],
              );
            },
            id: 'updateUI',
          ),
          SizedBox(width: 12.w),
          const Expanded(
            child: PlaceholderSearchWidget(
              contentList: ['财富会员', '养老金火热', '建行出行享优惠'],
              bgColor: Color.fromRGBO(255, 255, 255, 0.66),
            ),
          ),
          SizedBox(width: 12.w),
        ],
      );

  @override
  double? get lefItemWidth => 20.w;

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xFFF4FCFF),
      child: ListView(
        padding: EdgeInsets.only(top: navigateHeight),
        children: [
          _buildActionGrid(),
          SizedBox(height: 12.h),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.naviOffset, arguments: {
                'title': '信用卡申请',
                'image': 'bg_xyksq',
              });
            },
            child: CommonBannerWidget(
              imagePaths: state.segment1Banner,
              aspectRatio: 375 / 349,
              autoPlay: true,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Image(image: 'card/segment_2'.png, fit: BoxFit.fitWidth),
          ),
          SizedBox(height: 12.h),
          _buildSegment3(),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Stack(
              children: [
                Image(
                  image: 'card/segment_4'.png,
                  fit: BoxFit.fitWidth,
                  width: screenWidth - 16.w,
                ),
                Positioned(
                    top: (screenWidth - 16.w) / 1125 * 759 * 0.25,
                    left: (screenWidth - 16.w) * 0.07,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '分期通',
                          'fullImagePath': 'card/ads/fqt.jpg'.newImgPath,
                        });
                      },
                      child: SizedBox(
                        width: screenWidth / 5.0 * 2,
                        height: screenWidth / 1125 * 759 * 0.30,
                      ),
                    )),
                Positioned(
                    top: (screenWidth - 16.w) / 1125 * 759 * 0.25,
                    left: (screenWidth - 16.w) * 0.507,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '特斯拉',
                          'fullImagePath': 'card/ads/tsl.png'.newImgPath,
                        });
                      },
                      child: Container(
                        width: screenWidth / 5.0 * 2,
                        height: screenWidth / 1125 * 759 * 0.30,
                      ),
                    )),
                Positioned(
                    top: (screenWidth - 16.w) / 1125 * 759 * 0.6,
                    left: (screenWidth - 16.w) * 0.507,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '现金分期',
                          'fullImagePath': 'card/ads/xjfq.jpg'.newImgPath,
                        });
                      },
                      child: Container(
                        width: screenWidth / 5.0 * 2,
                        height: screenWidth / 1125 * 759 * 0.30,
                      ),
                    )),
                Positioned(
                    top: (screenWidth - 16.w) / 1125 * 759 * 0.6,
                    left: (screenWidth - 16.w) * 0.07,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '装修分期',
                          'fullImagePath': 'card/ads/zxfq.jpg'.newImgPath,
                        });
                      },
                      child: Container(
                        width: screenWidth / 5.0 * 2,
                        height: screenWidth / 1125 * 759 * 0.30,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(height: 12.h),
          _buildSegment5(),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '特色推荐',
                    'fullImagePath': 'card/ads/tstj.png'.newImgPath,
                  });
                },
                child: Image(image: 'card/segment_6'.png, fit: BoxFit.fitWidth)),
          ),
        ],
      ),
    );
  }

  Widget _buildActionGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionItem(
              Image(image: 'card/edu_icon'.png, width: 28.w, height: 28.w),
              '额度调整',
              onTap: () {
                Get.to(() => EduChangePage());
              },
            ),
            _buildActionItem(
              Image(image: 'card/xykb_icon'.png, width: 28.w, height: 28.w),
              '信用卡包',
              onTap: () {
                Get.toNamed(Routes.cardPackage);
              },
            ),
            _buildActionItem(
              Image(
                  image: 'card/fenqitong_icon'.png, width: 28.w, height: 28.w),
              '分期通',
              onTap: () {
                Get.to(() => FenQiTongPage());
              },
            ),
            _buildActionItem(
              Image(image: 'card/divide_icon'.png, width: 28.w, height: 28.w),
              '分期查询',
              onTap: () {
                Get.toNamed(Routes.installmentInquiry);
              },
            ),
            _buildActionItem(
              Image(image: 'card/more_icon'.png, width: 28.w, height: 28.w),
              '更多',
              onTap: () {
                Get.toNamed(Routes.cardServices);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(Widget iconWidget, String label,
      {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          SizedBox(height: 8.h),
          Text(label,
              style: const TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildSegment3() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            Image(image: 'card/segment_3'.png, fit: BoxFit.fitWidth),
            Positioned(
              left: 12.w,
              top: 56.h,
              bottom: 10.h,
              child: SizedBox(
                width: 170.w,
                child: CommonBannerWidget(
                  imagePaths: state.segment3Banner,
                  autoPlay: true,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
                top: screenWidth / 1125 * 804 * 0.22,
                right: screenWidth * 0.06,
                child: Container(
                  width: screenWidth / 5.0 * 2,
                  height: screenWidth / 1125 * 804 * 0.32,
                ).withOnTap(onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '龙信用卡66节',
                    'fullImagePath': 'card/ads/lxyk66j.jpg'.newImgPath,
                  });
                })),
            Positioned(
                top: screenWidth / 1125 * 804 * 0.57,
                right: screenWidth * 0.06,
                child: Container(
                  width: screenWidth / 5.0 * 2,
                  height: screenWidth / 1125 * 804 * 0.32,
                ).withOnTap(onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '积分兑年费',
                    'fullImagePath': 'card/ads/jfdnf.png'.newImgPath,
                  });
                }))
          ],
        ),
      ),
    );
  }

  Widget _buildSegment5() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            Image(image: 'card/segment_5'.png, fit: BoxFit.fitWidth),
            Positioned(
                top: 65.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '乐享积分',
                        'fullImagePath': 'card/ads/lxjf.png'.newImgPath,
                      });
                    },
                    child: CommonBannerWidget(
                      imagePaths: state.segment5Banner,
                      height: 82.h,
                      autoPlay: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
            Positioned(
                top: 20.h,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.fixedNavPage, arguments: {
                      'title': '乐享积分',
                      'fullImagePath': 'card/ads/lxjf.png'.newImgPath,
                    });
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 100,
                      height: 25,
                    ),
                  )
                ),)
          ],
        ),
      ),
    );
  }
}
