import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'card_logined_logic.dart';
import 'card_logined_state.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;

class Card_loginedPage extends BaseStateless {
  Card_loginedPage({Key? key}) : super(key: key);

  final Card_loginedLogic logic = Get.put(Card_loginedLogic());
  final Card_loginedState state = Get.find<Card_loginedLogic>().state;
   CarouselSliderController? _controller = CarouselSliderController();// 正确引用
  final List<String> imagesArr = [
    'card_slider1',
    'card_slider2'
  ];
@override
  Widget initBody(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
    crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
    children: [
      CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          height: 200, // 设置轮播图的高度
          // aspectRatio: 20/16, // 设置轮播图的宽高比
          viewportFraction: 0.7, // 当前视图占整个轮播图宽度的比例
          initialPage: 0, // 初始页面的索引
          enableInfiniteScroll: true, // 是否启用无限循环滑动
          // autoPlay: true, // 是否启用自动播放
          // autoPlayInterval: Duration(seconds: 3), // 自动播放的间隔时间
          // autoPlayAnimationDuration: Duration(milliseconds: 800), // 自动播放的动画持续时间
          autoPlayCurve: Curves.easeInOut, // 自动播放的动画曲线
          scrollDirection: Axis.horizontal, // 滑动方向，水平或垂直
          pauseAutoPlayOnTouch: true, // 用户触摸屏幕时是否暂停自动播放
          enlargeCenterPage: true, // 是否将中心页面放大
          onPageChanged: (index, reason) {
            // 页面切换时触发的回调函数
            print('Page changed to: $index'); // 打印当前页面的索引
          },
        ),
        items: [
          Container(
            color: Colors.red,
            child: Center(
                child: Text('Page 1',
                    style: TextStyle(fontSize: 24, color: Colors.white))),
          ),
          Container(
            color: Colors.green,
            child: Center(
                child: Text('Page 2',
                    style: TextStyle(fontSize: 24, color: Colors.white))),
          ),
          Container(
            color: Colors.blue,
            child: Center(
                child: Text('Page 3',
                    style: TextStyle(fontSize: 24, color: Colors.white))),
          ),
          Container(
            color: Colors.blue,
            child: Center(
                child: Text('Page 4',
                    style: TextStyle(fontSize: 24, color: Colors.white))),
          ),
        ],
      ),
      Container(
        height: 10,
      ),

      ElevatedButton(
        onPressed: () {
        },
        child: Text('Go to Page 3'),
      ),
      Container(
        color: Colors.yellow,
        height: 10 / 7,
        width: 50,
      ),
    ],
  );
  }
}
