import 'package:ccb/config/app_config.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../config/balance_config/balance_logic.dart';
import '../../../utils/color_util.dart';
import '../../../utils/common_banner_widget.dart';
import 'component/life_grid_widget.dart';
import 'component/hot_movie_section.dart';
import 'logic.dart';
import 'state.dart';

class NewLifePage extends BaseStateless {
  NewLifePage({super.key});

  final NewLifeLogic logic = Get.put(NewLifeLogic());
  final NewLifeState state = Get.find<NewLifeLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  String get navTitle => '';

  @override
  Widget? get leftItem => Container();

  @override
  bool get isShowNav => true;

  @override
  bool get isShowLeading => false;

  @override
  Widget? get titleWidget => _buildTitle();

  @override
  double? get lefItemWidth => 20.w;


  @override
  List<Widget>? get rightAction => [
        NavActionWidget(
          left: 8.w,
          title: '客服',
          image: 'card/ear_icon',
        ),
        NavActionWidget(
          left: 4.w,
          title: '订单',
          image: 'card/order',
        ),
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFBF1E8),
            Color(0xFFFEFBF8),
            Color(0xFFFFFFFF),
          ],
          stops: [0, 0.6, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: navigateHeight),
        child: Column(
          children: [
            _buildTopBanner(),
            const LifeGridWidget(),
            _buildSectionImage('assets/new_images/life/local_free.png', screenWidth / 1125 * 672),
            Stack(
              children: [
                _buildSectionImage(
                    'assets/new_images/life/local_offers_banner_1.png', screenWidth / 3240 * 2469),
                Positioned(
                    left: screenWidth * 0.06,
                    top: (screenWidth / 3240 * 2469) * 0.2,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.gongjijin);
                      },
                      child: Container(
                        width: screenWidth / 5 * 2,
                        height: (screenWidth / 3240 * 2469) * 0.34,
                      ),
                    )),
                Positioned(
                    left: screenWidth * 0.5,
                    top: (screenWidth / 3240 * 2469) * 0.2,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.naviOffset, arguments: {
                          'title': '个人信用报告',
                          'image': 'bg_grxybg',
                        });
                      },
                      child: Container(
                        width: screenWidth / 5 * 2,
                        height: (screenWidth / 3240 * 2469) * 0.34,
                      ),
                    )),
                Positioned(
                    left: screenWidth * 0.06,
                    top: (screenWidth / 3240 * 2469) * 0.6,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.sheBao);
                      },
                      child: Container(
                        width: screenWidth / 5 * 2,
                        height: (screenWidth / 3240 * 2469) * 0.34,
                      ),
                    )),
                Positioned(
                    left: screenWidth * 0.5,
                    top: (screenWidth / 3240 * 2469) * 0.6,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.yibaodianzi);
                      },
                      child: Container(
                        width: screenWidth / 5 * 2,
                        height: (screenWidth / 3240 * 2469) * 0.34,
                      ),
                    )),
              ],
            ),
            Stack(
              children: [
                _buildSectionImage(
                    'assets/new_images/life/life_payment_bg.png', screenWidth / 3240 * 1908),
                Positioned(
                    right: 0,
                    top: (screenWidth / 3240 * 1908) * 0.1,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '蛇年福利',
                          'fullImagePath': 'life/ads/snfl.png'.newImgPath,
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 20,
                      ),
                    )),
                Positioned(
                    left: 20,
                    top: (screenWidth / 3240 * 1908) * 0.2,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '蛇年福利',
                          'fullImagePath': 'life/ads/snfl.png'.newImgPath,
                        });                      },
                      child: Container(
                        width: screenWidth * 0.46,
                        height: (screenWidth / 3240 * 1908) * 0.7,
                      ),
                    )),
                Positioned(
                    right: 20,
                    top: (screenWidth / 3240 * 1908) * 0.2,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.diTanLife);
                      },
                      child: Container(
                        width: screenWidth * 0.46,
                        height: (screenWidth / 3240 * 1908) * 0.36,
                      ),
                    )),
                Positioned(
                    right: 20,
                    top: (screenWidth / 3240 * 1908) * 0.55,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '好劵中心',
                          'fullImagePath': 'life/ads/snfl.png'.newImgPath,
                        });
                      },
                      child: Container(
                        width: screenWidth * 0.46,
                        height: (screenWidth / 3240 * 1908) * 0.36,
                      ),
                    )),
              ],
            ),
            HotMovieSection(),
            _builLifeBanner(),
            Obx(() {
              return logic.bottomIndex.value == 0
                  ? Stack(
                      children: [
                        Image.asset(
                          'assets/new_images/life/ads/life_local.png',
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                          height: screenWidth/750 * 2199,
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: InkWell(
                            onTap: () {
                              logic.bottomIndex.value = 0;
                            },
                            child: Container(
                              height: 50,
                              width: screenWidth / 2.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              logic.bottomIndex.value = 1;
                            },
                            child: Container(
                              height: 50,
                              width: screenWidth / 2.0,
                            ),
                          ),
                        )
                      ],
                    )
                  : Stack(
                      children: [
                        Image.asset(
                          'assets/new_images/life/ads/life_goods.png',
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                          height: screenWidth/750 * 3629,
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: InkWell(
                            onTap: () {
                              logic.bottomIndex.value = 0;
                            },
                            child: Container(
                              height: 50,
                              width: screenWidth / 2.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              logic.bottomIndex.value = 1;
                            },
                            child: Container(
                              height: 50,
                              width: screenWidth / 2.0,
                            ),
                          ),
                        )
                      ],
                    );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBanner() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CommonBannerWidget(
        // aspectRatio:  375 / 349,
        imagePaths: state.topBanners,
      ),
    );
  }

  Widget _builLifeBanner() {
    return Stack(
      children: [
        Image(image: 'life/section_gov_services'.newPng, fit: BoxFit.fitWidth),
        Positioned(
          left: 20.w,
          top: 56.h,
          bottom: 20.h,
          child: SizedBox(
            width: 170.w,
            child: CommonBannerWidget(
              imagePaths: state.lifeBanners,
              autoPlay: true,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
            top: 56.h,
            right: screenWidth * 0.05,
            child: Container(
              width: screenWidth / 5 * 2,
              height: screenWidth / 1125 * 720 * 0.3,
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '茉莉奶白',
                'fullImagePath': 'life/ads/mlnb.png'.newImgPath,
              });
            })),
        Positioned(
            top: 56.h + screenWidth / 1125 * 720 * 0.3,
            right: screenWidth * 0.05,
            child: Container(
              width: screenWidth / 5 * 2,
              height: screenWidth / 1125 * 720 * 0.3,
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '优惠劵',
                'fullImagePath': 'life/ads/85yhj.png'.newImgPath,
              });
            })),
        Positioned(
            top: screenWidth / 1125 * 720 * 0.05,
            right: screenWidth * 0.05,
            child: Container(
              width: 50,
              height: 20,
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '美好生活',
                'fullImagePath': 'life/ads/gengduo.png'.newImgPath,
              });
            }))
      ],
    );
  }

  Widget _buildSectionImage(String imagePath, double height) {
    return Image.asset(
      width: screenWidth,
      height: height,
      imagePath,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        GetBuilder(
          builder: (BalanceLogic c) {
            return Row(
              children: [
                Image(
                    image: 'card/location_icon'.png, width: 14.w, height: 16.h),
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
  }
}
