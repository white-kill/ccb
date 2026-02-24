import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'logic.dart';
import 'state.dart';

class MorePage extends BaseStateless {
  MorePage({super.key});

  final MoreLogic logic = Get.put(MoreLogic());
  final MoreState state = Get.find<MoreLogic>().state;

  @override
  String? get title => "更多";

  @override
  Widget? get leftItem => IconButton(
    padding: EdgeInsets.zero,
    constraints: BoxConstraints(
      minWidth: 30.w,
      minHeight: 30.w,
    ),
    onPressed: () => Get.back(),
    icon: Image.asset(
      'assets/new_images/close.png',
      width: 14.w,
      height: 14.w,
      color: Colors.black,
    ),
  );

  @override
  List<Widget>? get rightAction => [
    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return Stack(
      children: [
        // 主要内容区域
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            controller: logic.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 精选标题
                Container(
                  key: logic.featuredKey,
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Text(
                      '精选',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // 精选产品网格
                _buildFeaturedGrid(),
        Container(
          height: 10,
          color: Colors.black.withAlpha(12),
        ),
                // 标签页选择器
                _buildTabSelector(),
                SizedBox(height: 16.w),
                // 各个分类的内容
                _buildAllCategories(),
              ],
            ),
          ),
        ),
        // 顶部阴影区域
        Container(
          height: 8.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.15),
                Colors.grey.withOpacity(0.05),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 0.9,
          mainAxisSpacing: 16.w,
          crossAxisSpacing: 8.w,
        ),
        itemCount: state.featuredItems.length,
        itemBuilder: (context, index) {
          final item = state.featuredItems[index];
          return GestureDetector(
            onTap: () => logic.onProductClick(item['label']!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 图标容器，固定高度确保对齐
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Image.asset(
                    item['image']!,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
                SizedBox(height: 6.w),
                // 文字容器，固定高度确保对齐
                Container(
                  height: 32.w, // 固定高度，大约两行文字的高度
                  alignment: Alignment.topCenter,
                  child: Text(
                    item['label']!,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.black87,
                      height: 1.2, // 行高
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabSelector() {
    return GetBuilder<MoreLogic>(
      builder: (controller) {
        return Container(
          height: 44.w,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: state.tabItems.asMap().entries.map((entry) {
              int index = entry.key;
              String title = entry.value;
              bool isSelected = state.selectedTabIndex == index;

              return GestureDetector(
                onTap: () => logic.onTabChanged(index),
                child: Container(
                  padding: EdgeInsets.only(right: 14, left: index == 0? 16 : 0), // 给文字左右留间距
                  child: Stack(
                    children: [
                      // 文字内容
                      Container(
                        height: 44.w,
                        child: Center(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isSelected ? Colors.black : Colors.black.withAlpha(150),
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      // 选中状态的底部指示器
                      if (isSelected)
                        Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 20.w, // 小线条的宽度
                              height: 2.w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(1.w),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildAllCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 基金/证券/理财
        Container(
          key: logic.fundKey,
          child: _buildCategorySection('基金/证券/理财', [
            {'image': 'assets/new_images/cai_fu/children/more/sy.png', 'label': '速盈'},
            {'image': 'assets/new_images/cai_fu/children/more/jjtz.png', 'label': '基金投资'},
            {'image': 'assets/new_images/cai_fu/children/more/lccp.png', 'label': '理财产品'},
            {'image': 'assets/new_images/cai_fu/children/more/zhlc.png', 'label': '专户理财'},
            {'image': 'assets/new_images/cai_fu/children/more/ylbzcp.png', 'label': '养老保险产品'},
            {'image': 'assets/new_images/cai_fu/children/more/qhzgcp.png', 'label': '期货资管产品'},
            {'image': 'assets/new_images/cai_fu/children/more/lb.png', 'label': '龙宝'},
            {'image': 'assets/new_images/cai_fu/children/more/dlxt.png', 'label': '代理信托'},
            {'image': 'assets/new_images/cai_fu/children/more/zqqh.png', 'label': '证券期货'},
            {'image': 'assets/new_images/cai_fu/children/more/ylzt.png', 'label': '(原)龙智投'},
            {'image': 'assets/new_images/cai_fu/children/more/bnh.png', 'label': '帮你还'},
          ]),
        ),

        // 存款/保险/外汇
        Container(
          key: logic.depositKey,
          child: _buildCategorySection('存款/保险/外汇', [
            {'image': 'assets/new_images/cai_fu/children/more/ckcp.png', 'label': '存款产品'},
            {'image': 'assets/new_images/cai_fu/children/more/bx.png', 'label': '保险'},
            {'image': 'assets/new_images/cai_fu/children/more/jsh.png', 'label': '结售惠'},
            {'image': 'assets/new_images/cai_fu/children/more/whmm.png', 'label': '外汇买卖'},
            {'image': 'assets/new_images/cai_fu/children/more/zhwhsp.png', 'label': '账户外汇(实盘)'},
            {'image': 'assets/new_images/cai_fu/children/more/kjh.png', 'label': '跨境汇'},
          ]),
        ),

        // 贵金属
        Container(
          key: logic.metalKey,
          child: _buildCategorySection('贵金属', [
            {'image': 'assets/new_images/cai_fu/children/more/gjs.png', 'label': '贵金属'},
            {'image': 'assets/new_images/cai_fu/children/more/zhgjs.png', 'label': '账户贵金属'},
            {'image': 'assets/new_images/cai_fu/children/more/dlgjs.png', 'label': '代理贵金属'},
          ]),
        ),
        
        // 私募产品
        Container(
          key: logic.privateKey,
          child: _buildCategorySection('私募产品', [
            {'image': 'assets/new_images/cai_fu/children/more/smzq.png', 'label': '私募专区'},
          ]),
        ),
        
        // 其他
        Container(
          key: logic.otherKey,
          child: _buildCategorySection('其他', [
            {'image': 'assets/new_images/cai_fu/children/more/jgj.png', 'label': '金管家'},
            {'image': 'assets/new_images/cai_fu/children/more/sryh.png', 'label': '私人银行'},
            {'image': 'assets/new_images/cai_fu/children/more/zrpt.png', 'label': '转让平台'},
            {'image': 'assets/new_images/cai_fu/children/more/lcgj.png', 'label': '理财工具'},
            {'image': 'assets/new_images/cai_fu/children/more/kjlct.png', 'label': '跨境理财通'},
            {'image': 'assets/new_images/cai_fu/children/more/zhsp.png', 'label': '台胞购买投资产品业务'},
            {'image': 'assets/new_images/cai_fu/children/more/zqtz.png', 'label': '账户商品'},
            {'image': 'assets/new_images/cai_fu/children/more/znzb.png', 'label': '智慧盒'},
            {'image': 'assets/new_images/cai_fu/children/more/cfjh.png', 'label': '智能账本'},
            {'image': 'assets/new_images/cai_fu/children/more/gfjh.png', 'label': '财富活动'},
            {'image': 'assets/new_images/cai_fu/children/more/zfy.png', 'label': '财富计划'},
            {'image': 'assets/new_images/cai_fu/children/more/whmm.png', 'label': '购房规划'},
          ]),
        ),
        SizedBox(height: 24.w),
      ],
    );
  }

  Widget _buildCategorySection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 12.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 0.9,
              mainAxisSpacing: 16.w,
              crossAxisSpacing: 8.w,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () => logic.onProductClick(item['label']!),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // 图标容器，固定高度确保对齐
                    Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Image.asset(
                        item['image']!,
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                    SizedBox(height: 6.w),
                    // 文字容器，固定高度确保对齐
                    Container(
                      height: 32.w, // 固定高度，大约两行文字的高度
                      alignment: Alignment.topCenter,
                      child: Text(
                        item['label']!,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.black87,
                          height: 1.2, // 行高
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }


} 