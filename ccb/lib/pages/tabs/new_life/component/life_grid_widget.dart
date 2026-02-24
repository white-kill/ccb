import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LifeGridWidget extends StatefulWidget {
  const LifeGridWidget({super.key});

  @override
  State<LifeGridWidget> createState() => _LifeGridWidgetState();
}

class _LifeGridWidgetState extends State<LifeGridWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _gridItemsPage1 = [
    {'image': 'assets/new_images/life/gride_1.png', 'title': '手机话费'},
    {'image': 'assets/new_images/life/gride_2.png', 'title': '电费'},
    {'image': 'assets/new_images/life/gride_3.png', 'title': '医保码'},
    {'image': 'assets/new_images/life/gride_4.png', 'title': '低碳生活'},
    {'image': 'assets/new_images/life/gride_5.png', 'title': '电影演出'},
    {'image': 'assets/new_images/life/gride_6.png', 'title': '智慧食堂'},
    {'image': 'assets/new_images/life/gride_12.png', 'title': '学杂费'},
    {'image': 'assets/new_images/life/gride_8.png', 'title': '党费'},
    {'image': 'assets/new_images/life/gride_9.png', 'title': '燃气费'},
    {'image': 'assets/new_images/life/gride_10.png', 'title': '水费'},
  ];

  final List<Map<String, String>> _gridItemsPage2 = [
    {'image': 'assets/new_images/life/gride_11.png', 'title': '校园卡充值'},
    {'image': 'assets/new_images/life/children/more/fz.png', 'title': '房租'},
    {'image': 'assets/new_images/life/gride_13.png', 'title': '社保'},
    {'image': 'assets/new_images/life/gride_14.png', 'title': '信用报告'},
    {'image': 'assets/new_images/life/gride_15.png', 'title': '领卷中心'},
    {'image': 'assets/new_images/life/gride_16.png', 'title': '固话话费'},
    {'image': 'assets/new_images/life/gride_17.png', 'title': '工会费'},
    {'image': 'assets/new_images/life/gride_18.png', 'title': '权益中心'},
    {'image': 'assets/new_images/life/gride_19.png', 'title': '唯品会联合会员'},
    {'image': 'assets/new_images/life/gride_20.png', 'title': '更多'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 130,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildGridPage(_gridItemsPage1),
              _buildGridPage(_gridItemsPage2),
            ],
          ),
        ),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildGridPage(List<Map<String, String>> items) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1.0,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        mainAxisExtent: 60,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            if (item['title'] == '电费') {
              Get.toNamed(Routes.dianFei);
            } else if (item['title'] == '手机话费') {
              Get.toNamed(Routes.phoneFee);
            } else if (item['title'] == '低碳生活') {
              Get.toNamed(Routes.diTanLife);
            } else if (item['title'] == '电影演出') {
              Get.toNamed(Routes.movie);
            } else if (item['title'] == '约惠北京') {
              Get.toNamed(Routes.yueHuiBeiJing);
            } else if (['水费', '党费', '校园卡充值', '学杂费', '固话话费'].contains(item['title'])) {
              Get.toNamed(Routes.feeUnitSelection);
            } else if (item['title'] == '智慧食堂') {
              Get.toNamed(Routes.jianHangLife);
            } else if (item['title'] == '燃气费') {
              Get.toNamed(Routes.ranQiFee);
            } else if (item['title'] == '社保') {
              Get.toNamed(Routes.sheBao);
            } else if (item['title'] == '领卷中心') {
              Get.toNamed(Routes.lingJuanZhongXin);
            } else if (item['title'] == '权益中心') {
              Get.toNamed(Routes.quanYiZhongXin);
            } else if (item['title'] == '唯品会联...') {
              Get.toNamed(Routes.lianHeHuiYuanShouQuan);
            } else if (item['title'] == '更多') {
              Get.toNamed(Routes.moreServices);
            } else if (item['title'] == '医保码') {
              Get.toNamed(Routes.yibaodianzi);
            }
          },
          child: Center(
            child: Container(
              alignment: Alignment.center,
              height: 63,
              width: 60,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(item['image']!, width: 30, height: 30),
                  SizedBox(height: 3,),
                  Text(
                    item['title']!,
                    style: const TextStyle(fontSize: 11, color: Colors.black87),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) {
        return Container(
          width: 4.0,
          height: 4.0,
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index
                ? const Color(0xFFFF7E00)
                : Colors.grey.withOpacity(0.5),
          ),
        );
      }),
    );
  }
} 