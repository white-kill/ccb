import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';

class MoreServicesPage extends BaseStateless {
  final logic = Get.put(MoreServicesLogic());

  MoreServicesPage({super.key});

  @override
  Color? get background => Colors.white;

  @override
  bool get wantKeepAlive => false;


  @override
  bool get isChangeNav => true;

  @override
  String get navTitle => '';


  @override
  bool get isShowNav => true;

  @override
  bool get isShowLeading => false;

  @override
  Widget? get titleWidget => _buildTitle();

  @override
  Widget? get leftItem => IconButton(
    icon: Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w),
    onPressed: () => Get.back(),
  );

  @override
  List<Widget>? get rightAction => [
    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
    SizedBox(width: 8.w),
  ];


  @override
  final String? tag = "MoreServicesPage";

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

  final List<Map<String, String>> _zhengWuFuWuItems = [
    {'image': 'assets/new_images/life/children/more/hgxys.png', 'title': '海关行邮税'},
    {'image': 'assets/new_images/life/children/more/bjsbk.png', 'title': '社保卡'},
    {'image': 'assets/new_images/life/children/more/ssjs.png', 'title': '实时缴税'},
    {'image': 'assets/new_images/life/children/more/dzsbk.png', 'title': '电子社保卡'},
    {'image': 'assets/new_images/life/gride_14.png', 'title': '信用报告'},
  ];

  final List<Map<String, String>> _shengHuoJiaoFeiItems = [
    {'image': 'assets/new_images/life/gride_1.png', 'title': '手机话费'},
    {'image': 'assets/new_images/life/children/more/cpzdjf.png', 'title': '彩票站点缴费'},
    {'image': 'assets/new_images/life/gride_10.png', 'title': '水费'},
    {'image': 'assets/new_images/life/gride_2.png', 'title': '电费'},
    {'image': 'assets/new_images/life/gride_9.png', 'title': '燃气费'},
    {'image': 'assets/new_images/life/children/more/gnf.png', 'title': '供暖费'},
    {'image': 'assets/new_images/life/gride_16.png', 'title': '固话话费'},
    {'image': 'assets/new_images/life/children/more/fz.png', 'title': '房租'},
    {'image': 'assets/new_images/life/children/more/kdgx.png', 'title': '宽带光纤'},
  ];

  final List<Map<String, String>> _bianMinFuWuItems = [
    {'image': 'assets/new_images/life/children/more/ycpw.png', 'title': '演出票务'},
    {'image': 'assets/new_images/life/children/more/mtwm.png', 'title': '美团外卖'},
    {'image': 'assets/new_images/life/children/more/ddmc.png', 'title': '叮咚买菜'},
    {'image': 'assets/new_images/life/children/more/flzj.png', 'title': '法律专家'},
    {'image': 'assets/new_images/life/children/more/cngg.png', 'title': '菜鸟裹裹'},
    {'image': 'assets/new_images/life/children/more/wyfk.png', 'title': '我要付款'},
    {'image': 'assets/new_images/life/children/more/zjgj.png', 'title': '资金归集'},
    {'image': 'assets/new_images/life/children/more/ylyjf.png', 'title': '养老院缴费'},
    {'image': 'assets/new_images/life/children/more/qym.png', 'title': '企业码'},
    {'image': 'assets/new_images/life/children/more/dtm.png', 'title': '地铁码'},
    {'image': 'assets/new_images/life/children/more/ghf.png', 'title': '公交码'},
    {'image': 'assets/new_images/life/children/more/jfh.png', 'title': '积分汇'},
    {'image': 'assets/new_images/life/children/more/jxcx.png', 'title': '哈啰出行'},
    {'image': 'assets/new_images/life/gride_7.png', 'title': '约惠北京'},
    {'image': 'assets/new_images/life/children/more/etb.png', 'title': 'E托保'},
    {'image': 'assets/new_images/life/children/more/qjdc.png', 'title': '青桔单车'},
    {'image': 'assets/new_images/life/children/more/zfgjj.png', 'title': '住房公积金'},
  ];

  final List<Map<String, String>> _meiShiYuLeItems = [
    {'image': 'assets/new_images/life/children/more/szst.png', 'title': '数字食堂'},
    {'image': 'assets/new_images/life/children/more/mgtv.png', 'title': '芒果TV'},
    {'image': 'assets/new_images/life/children/more/jdlhhy.png', 'title': '京东联合会员'},
    {'image': 'assets/new_images/life/children/more/dyzfhb.png', 'title': '抖音支付红包'},
    {'image': 'assets/new_images/life/gride_19.png', 'title': '唯品会联合会员'},
    {'image': 'assets/new_images/life/gride_6.png', 'title': '智慧食堂'},
    {'image': 'assets/new_images/life/gride_5.png', 'title': '电影演出'},
  ];

  final List<Map<String, String>> _cheZhuFuWuItems = [
    {'image': 'assets/new_images/life/children/more/zhjy.png', 'title': '智慧加油'},
    {'image': 'assets/new_images/life/children/more/clf.png', 'title': '差旅费'},
    {'image': 'assets/new_images/life/children/more/jtfk.png', 'title': '交通罚款'},
    {'image': 'assets/new_images/life/children/more/jdmp.png', 'title': '景点门票'},
    {'image': 'assets/new_images/life/children/more/ydjf.png', 'title': '异地交罚'},
    {'image': 'assets/new_images/life/children/more/etcfw.png', 'title': 'ETC服务'},
    {'image': 'assets/new_images/life/children/more/wgzf.png', 'title': '无感支付'},
    {'image': 'assets/new_images/life/children/more/zylk.png', 'title': '中油龙卡'},
  ];

  final List<Map<String, String>> _yiLiaoJianKangItems = [
    {'image': 'assets/new_images/life/children/more/jxbx.png', 'title': '建信保险'},
    {'image': 'assets/new_images/life/children/more/jxcx.png', 'title': '建信财险'},
    {'image': 'assets/new_images/life/children/more/yyfw.png', 'title': '银医服务'},
    {'image': 'assets/new_images/life/gride_3.png', 'title': '医保码'},
  ];

  final List<Map<String, String>> _shangLvFuWuItems = [
    {'image': 'assets/new_images/life/children/more/fjp.png', 'title': '飞机票'},
    {'image': 'assets/new_images/life/children/more/hcp.png', 'title': '火车票'},
    {'image': 'assets/new_images/life/children/more/lytg.png', 'title': '旅游团购'},
    {'image': 'assets/new_images/life/children/more/jdyd.png', 'title': '酒店预订'},
    {'image': 'assets/new_images/life/children/more/xcsl.png', 'title': '携程商旅'},
  ];

  final List<Map<String, String>> _xueXiaoJiaoYuItems = [
    {'image': 'assets/new_images/life/children/more/cf.png', 'title': '餐费'},
    {'image': 'assets/new_images/life/children/more/zjzsp.png', 'title': '证件照随拍'},
    {'image': 'assets/new_images/life/children/more/fzf.png', 'title': '服装费'},
    {'image': 'assets/new_images/life/children/more/xcfwf.png', 'title': '校车服务费'},
    {'image': 'assets/new_images/life/children/more/pxf.png', 'title': '培训费'},
    {'image': 'assets/new_images/life/children/more/xzf.png', 'title': '学杂费'},
    {'image': 'assets/new_images/life/children/more/yeyjf.png', 'title': '幼儿园缴费'},
    {'image': 'assets/new_images/life/children/more/szxyk.png', 'title': '数字校园卡'},
  ];

  final List<Map<String, String>> _dangTuanGongHuiItems = [
    {'image': 'assets/new_images/life/children/more/tf.png', 'title': '团费'},
    {'image': 'assets/new_images/life/gride_17.png', 'title': '工会费'},
    {'image': 'assets/new_images/life/gride_8.png', 'title': '党费'},
  ];

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: navigateHeight,),
        Expanded(
          child: SingleChildScrollView(
            controller: logic.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader(context, '我的应用', true),
                _buildSectionTitle('第一屏'),
                _buildGridPage(_gridItemsPage1, context),
                _buildSectionTitle('第二屏'),
                _buildGridPage(_gridItemsPage2, context),
                _buildAnchorTabBar(),
                _buildSectionWithTitle(logic.zhengWuFuWuKey, "政务服务", _zhengWuFuWuItems, context),
                _buildSectionWithTitle(logic.shengHuoJiaoFeiKey, "生活缴费", _shengHuoJiaoFeiItems, context),
                _buildSectionWithTitle(logic.bianMinFuWuKey, "便民服务", _bianMinFuWuItems, context),
                _buildSectionWithTitle(logic.meiShiYuLeKey, "美食娱乐", _meiShiYuLeItems, context),
                _buildSectionWithTitle(logic.cheZhuFuWuKey, "车主服务", _cheZhuFuWuItems, context),
                _buildSectionWithTitle(logic.yiLiaoJianKangKey, "医疗健康", _yiLiaoJianKangItems, context),
                _buildSectionWithTitle(logic.shangLvFuWuKey, "商旅服务", _shangLvFuWuItems, context),
                _buildSectionWithTitle(logic.xueXiaoJiaoYuKey, "学校教育", _xueXiaoJiaoYuItems, context),
                _buildSectionWithTitle(logic.dangTuanGongHuiKey, "党团工会", _dangTuanGongHuiItems, context),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildSectionHeader(BuildContext context, String title, bool showButton) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 3.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF007AFF),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              if (showButton)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text('定制', style: TextStyle(color: Color(0xFF007AFF), fontSize: 13)),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Divider(height: 1, thickness: 0.5, color: Colors.grey[300]),
        )
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
    );
  }

  Widget _buildAnchorTabBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1.0)),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: logic.tabs.length,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
            onTap: () => logic.scrollToSection(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: logic.selectedTabIndex.value == index ? const Color(0xFF007AFF) : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                logic.tabs[index],
                style: TextStyle(
                  color: logic.selectedTabIndex.value == index ? const Color(0xFF007AFF) : Colors.black87,
                  fontWeight: logic.selectedTabIndex.value == index ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
          ));
        },
      ),
    );
  }

  Widget _buildSectionWithTitle(Key key, String title, List<Map<String, String>> items, BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          if (items.isNotEmpty)
            _buildGridPage(items, context)
          else
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Text("暂无服务", style: TextStyle(color: Colors.grey[500])),
            ),
        ],
      ),
    );
  }

  Widget _buildGridPage(List<Map<String, String>> items, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1.0,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 8.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            // Re-use navigation logic from LifeGridWidget
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
            } else if (item['title']!.contains('唯品会')) {
              Get.toNamed(Routes.lianHeHuiYuanShouQuan);
            } else if (item['title'] == '更多') {
              // This is the more page itself, do nothing
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(item['image']!, width: 22, height: 28),
              const SizedBox(height: 4),
              Text(
                item['title']!,
                style: const TextStyle(fontSize: 11, color: Colors.black87),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildTitle() {
    return Row(
      children: [
        Expanded(
          child: PlaceholderSearchWidget(
            contentList: ['财富会员', '养老金火热', '建行出行享优惠'],
            bgColor: Color.fromRGBO(255, 255, 255, 0.66),
            border: Border.all(color: Color(0xFF707070)),
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
  }
}
