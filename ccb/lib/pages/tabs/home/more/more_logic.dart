import 'package:ccb/pages/tabs/new_card/edu_change/view.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'more_state.dart';

class MoreLogic extends GetxController {
  final MoreState state = MoreState();

  // 顶部横向应用栏
  final appList = [
    {'icon': 'assets/new_images/home/more/mine_1.png', 'label': '应用1'},
    {'icon': 'assets/new_images/home/more/mine_2.png', 'label': '应用2'},
    {'icon': 'assets/new_images/home/more/mine_3.png', 'label': '应用3'},
    {'icon': 'assets/new_images/home/more/mine_5.png', 'label': '应用4'},
    {'icon': 'assets/new_images/home/more/mine_6.png', 'label': '应用5'},
    {'icon': 'assets/new_images/home/more/mine_7.png', 'label': '应用6'},
    {'icon': 'assets/new_images/home/more/more.png', 'label': '应用6'},
  ].obs;

  // 左侧分组
  final List<String> groupList = [
    '为您推荐',
    '账户',
    '转账',
    '支付',
    '财富',
    '信用卡',
    '贷款服务',
    '跨境服务',
    '生活服务',
    '网点服务',
    '福利',
    '其他'
  ];

  // 右侧分组及功能项（图标名为拼音首字母，label为中文）
  final List<Map<String, dynamic>> groupData = [
    {
      'title': '为您推荐',
      'mode': 'items',
      'items': [
        {'icon': 'szrmb', 'label': '数字人民币'},
        {'icon': 'yjbk', 'label': '一键绑卡'},
      ]
    },
    {
      'title': '账户',
      'mode': 'items',
      'items': [
        {'icon': 'zhzl', 'label': '账户总揽'},
        {'icon': 'zhmx', 'label': '账户明细'},
        {'icon': 'lsdy', 'label': '流水打印'},
        {'icon': 'ykbb', 'label': '用卡必备'},
        {'icon': 'xxt', 'label': '薪享通'},
        {'icon': 'dzgzd', 'label': '电子工资单'},
        {'icon': 'qynj', 'label': '企业年金'},
        {'icon': 'grylj', 'label': '个人养老金'},
        {'icon': 'szrmb', 'label': '数字人民币'},
      ]
    },
    {
      'title': '转账',
      'mode': 'items',
      'items': [
        {'icon': 'zzhk', 'label': '转账汇款'},
        {'icon': 'yhzhzz', 'label': '银行账号转账'},
        {'icon': 'sjhzz', 'label': '手机号转账'},
        {'icon': 'thzr', 'label': '他行转入'},
        {'icon': 'zjgj', 'label': '资金归集'},
        {'icon': 'skrmc', 'label': '收款人名册'},
        {'icon': 'zzjl', 'label': '转账记录'},
        {'icon': 'zzsz', 'label': '转账设置'},
        {'icon': 'sjhsk', 'label': '手机号收款'},
        {'icon': 'yyzz', 'label': '预约转账'},
        {'icon': 'plzz', 'label': '批量转账'},
        {'icon': 'jnwbzz', 'label': '境内外币转账'},
        {'icon': 'gyjk', 'label': '公益捐款'},
      ]
    },
    {
      'title': '支付',
      'mode': 'items',
      'items': [
        {'icon': 'wdzf', 'label': '我的支付'},
        {'icon': 'kjzf', 'label': '快捷支付'},
        {'icon': 'yjbk', 'label': '一键绑卡'},
        {'icon': 'hsq', 'label': '惠省钱'},
        {'icon': 'lzf', 'label': '龙支付'},
        {'icon': 'fkm', 'label': '付款码'},
        {'icon': 'zfzd', 'label': '支付账单'},
        {'icon': 'dsgl', 'label': '代收管理'},
        {'icon': 'syb', 'label': '生意帮'},
      ],
    },
    {
      'title': '财富',
      'mode': 'items',
      'items': [
        {'icon': 'lqb1', 'label': '龙钱宝1号'},
        {'icon': 'lqb2', 'label': '龙钱宝2号'},
        {'icon': 'bnh', 'label': '帮你还'},
        {'icon': 'fxpg', 'label': '风险评估'},
        {'icon': 'sy', 'label': '速盈'},
        {'icon': 'lb', 'label': '龙宝'},
        {'icon': 'ckcp', 'label': '存款产品'},
        {'icon': 'gjs', 'label': '贵金属'},
        {'icon': 'zqtz', 'label': '债券投资'},
        {'icon': 'zqqh', 'label': '证券期货'},
        {'icon': 'zhsp', 'label': '账户商品'},
        {'icon': 'ylbzcp', 'label': '养老保障产品'},
        {'icon': 'cfh', 'label': '财富号'},
      ],
    },
    {
      'title': '信用卡',
      'mode': 'items',
      'items': [
        {'icon': 'xykzd', 'label': '信用卡账单'},
        {'icon': 'xykhk', 'label': '信用卡还款'},
        {'icon': 'xyksq', 'label': '信用卡申请'},
        {'icon': 'xykqy', 'label': '信用卡权益'},
        {'icon': 'xjfq', 'label': '现金分期'},
        {'icon': 'zdfq', 'label': '账单分期'},
        {'icon': 'xffq', 'label': '消费分期'},
        {'icon': 'xjzc', 'label': '现金转出'},
        {'icon': 'fqt', 'label': '分期通'},
        {'icon': 'edtz', 'label': '额度调整'},
      ],
    },
    {
      'title': '贷款服务',
      'mode': 'items',
      'items': [
        {'icon': 'jq', 'label': '借钱'},
        {'icon': 'kd', 'label': '快贷'},
        {'icon': 'jxfd', 'label': '建信福袋'},
        {'icon': 'xwkd', 'label': '小微快贷'},
        {'icon': 'grjykd', 'label': '个人经营快贷'},
        {'icon': 'nhkd', 'label': '农户快贷'},
        {'icon': 'zf', 'label': '住房'},
        {'icon': 'wddk', 'label': '我的贷款'},
        {'icon': 'dkjsq', 'label': '贷款计算器'},
        {'icon': 'xfdkzczhzjzc', 'label': '消费贷款转存\n账户资金转出'},
        {'icon': 'zhjksq', 'label': '账户监控授权'},
        {'icon': 'zdzfcx', 'label': '中德住房储蓄'},
        {'icon': 'hdnce', 'label': '惠懂你测额'},
      ],
    },
    {
      'title': '跨境服务',
      'mode': 'item',
      'items': [
        {'label': '跨境惠', 'icon': 'kjh'},
        {'label': '人民币购汇', 'icon': 'rmbgh'},
        {'label': '外币结汇', 'icon': 'wbjh'},
        {'label': '外币预约兑换', 'icon': 'wbyydh'},
        {'label': '境外汇款', 'icon': 'jwhk'},
        {'label': '国际汇入查询', 'icon': 'gjhrcx'},
        {'label': '跨境理财通', 'icon': 'kjlct'},
        {'label': '公派留学生借记卡激活', 'icon': 'gplxsjjkjh'}
      ]
    },
    {
      'title': '生活服务',
      'mode': 'item',
      'items': [
        {'label': '生活缴费', 'icon': 'shjf'},
        {'label': '手机话费', 'icon': 'sjhf'},
        {'label': '党费', 'icon': 'df'},
        {'label': '缴费提醒', 'icon': 'jftx'},
        {'label': '自动缴费', 'icon': 'zdjf'},
        {'label': '政务服务', 'icon': 'zwfw'},
        {'label': '医保码', 'icon': 'ybm'},
        {'label': '社保', 'icon': 'sb'},
        {'label': '电影演出', 'icon': 'dyyc'},
        {'label': '购物', 'icon': 'gw'},
        {'label': '建融家园', 'icon': 'jrjy'}
      ],
      'image': 'assets/new_images/home/more/shfw_section.png'
    },
    {
      'title': '网点服务',
      'mode': 'item',
      'items': [
        {'label': '网点服务', 'icon': 'wdfw'},
        {'label': '网点取号', 'icon': 'wdqh'},
        {'label': '个人开户', 'icon': 'grkh'},
        {'label': '大额预约', 'icon': 'deyy'},
        {'label': '外币预约', 'icon': 'wbyy'},
        {'label': '零钞预约', 'icon': 'lcyy'},
        {'label': '现金红包预约', 'icon': 'xjhbyy'},
        {'label': '预约纪念币', 'icon': 'yyjnb'},
        {'label': '预约换卡', 'icon': 'yyhk'},
        {'label': '建行到家', 'icon': 'jhdj'},
        {'label': '办卡进度查询', 'icon': 'bkjdcx'},
        {'label': '劳动者港湾', 'icon': 'ldzgw'}
      ],
      'image': 'assets/new_images/home/more/wdfw_section.png'
    },
    {
      'title': '福利',
      'mode': 'item',
      'items': [
        {'label': '任务中心', 'icon': 'rwzx'},
        {'label': '星级专区', 'icon': 'xjzq'},
        {'label': '权益中心', 'icon': 'qyzx'},
        {'label': '领券中心', 'icon': 'lqzx'},
        {'label': '积分汇', 'icon': 'jfh'},
        {'label': '低碳生活', 'icon': 'dtsh'},
        {'label': '活动日历', 'icon': 'hdrl'}
      ],
      'image': 'assets/new_images/home/more/fl_section.png'
    },
    {
      'title': '其他',
      'mode': 'item',
      'items': [
        {'label': '扫一扫', 'icon': 'sys'},
        {'label': '资信证明', 'icon': 'zxzm'},
        {'label': '个人信用报告', 'icon': 'grxybg'},
        {'label': '印章查验', 'icon': 'yzcy'},
        {'label': '电子回单查询', 'icon': 'dzhdcx'},
        {'label': '安全中心', 'icon': 'aqzx'},
        {'label': '摇一摇', 'icon': 'yyy'},
        {'label': '龙信商', 'icon': 'lxs'},
        {'label': '善付通', 'icon': 'sft'},
        {'label': 'E托保', 'icon': 'etb'},
        {'label': '小微快易', 'icon': 'xwky'},
        {'label': '商户服务', 'icon': 'shfw'}
      ],
      'image': 'assets/new_images/home/more/qt_section.png'
    },
    // 其余分组可根据截图继续补充
  ];

  // 统一处理跳转事件
  void handleItemClick(String label) {
    switch (label) {
      // 账户服务
      case '账户总揽':
        Get.toNamed(Routes.accountPreview);
        break;
      case '账户明细':
        Get.toNamed(Routes.accountDetail);
        break;
      case '流水打印':
        AppPages.toPrintView();
        break;
      case '用卡必备':
        // TODO: 待实现
        break;
      case '薪享通':
        // TODO: 待实现
        break;
      case '电子工资单':
        // TODO: 待实现
        break;
      case '企业年金':
        // TODO: 待实现
        break;
      case '个人养老金':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '个人养老金',
          'image': 'bg_grylj',
        });        break;
      case '数字人民币':
        SmartDialog.show(
          usePenetrate: false,
          clickMaskDismiss: true,
          animationType: SmartAnimationType.fade,
          builder: (_) {
            return InkWell(
              onTap: () {
                SmartDialog.dismiss();
              },
              child: Image(
                image: AssetImage('assets/new_images/home/children/szrmb.png'),
              ).withPadding(
                left: 20.w,
                right: 20.w
              ),
            );
          },
        );
        break;

      // 转账服务
      case '转账汇款':
        Get.toNamed(Routes.accountMoneyTransferView);
        break;
      case '银行账号转账':
        Get.toNamed(Routes.accountTransferPage);
        break;
      case '手机号转账':
        Get.toNamed(Routes.accountTransferPage,arguments: {
          'isPhone':true
        });
        break;
      case '他行转入':
        // TODO: 待实现
        break;
      case '资金归集':
        // TODO: 待实现
        break;
      case '收款人名册':
        // TODO: 待实现
        break;
      case '转账记录':
        Get.toNamed(Routes.transferRecordPage);
        break;
      case '转账设置':
        Get.toNamed(Routes.transferSettingPage);
        break;
      case '手机号收款':
        // TODO: 待实现
        break;
      case '预约转账':
      //TODO: 这里需要跳转，需要图
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '预约转账',
          'image': 'bg_yyzz',
        });
        break;
      case '批量转账':
      //批量转账
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '批量转账',
          'image': 'bg_plzz',
          'navColor':const Color(0xff3C6DD3),
          'titleColor':Colors.white,
          'changeTitleColor':Colors.white
        });
        break;
      case '境内外币转账':
        Get.toNamed(Routes.accountMoneyTransferView,);
        break;
      case '公益捐款':
      //公益捐款
        Get.toNamed(Routes.fixedNavPage, arguments: {
          'title': '公益捐款',
          'image': 'bg_gyjk',
        });
        break;

      // 支付服务
      case '我的支付':
        // TODO: 待实现
        break;
      case '快捷支付':
        Get.toNamed(Routes.kuaijiezhifu);
        break;
      case '一键绑卡':
        Get.toNamed(Routes.yjbk);
        break;
      case '惠省钱':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '惠省钱',
          'image': 'bg_huishengq',
        });        break;
      case '龙支付':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '龙支付',
          'image': 'bg_lzf',
        });        break;
      case '付款码':
        // TODO: 待实现
        break;
      case '支付账单':
        Get.toNamed(Routes.accountDetail);
        break;
      case '代收管理':
        // TODO: 待实现
        break;
      case '生意帮':
        // TODO: 待实现
        break;

      // 财富服务
      case '龙钱宝1号':
        Get.toNamed(Routes.lqb1);
        break;
      case '龙钱宝2号':
        Get.toNamed(Routes.lqb2);
        break;
      case '帮你还':
        // TODO: 待实现
        break;
      case '风险评估':
        // TODO: 待实现
        break;
      case '速盈':
        Get.toNamed(Routes.sy);
        break;
      case '龙宝':
        // TODO: 待实现
        break;
      case '存款产品':
        Get.toNamed(Routes.ckcp);
        break;
      case '贵金属':
        Get.toNamed(Routes.gjs);
        break;
      case '债券投资':
        // TODO: 待实现
        break;
      case '证券期货':
        // TODO: 待实现
        break;
      case '账户商品':
        // TODO: 待实现
        break;
      case '养老保障产品':
        // TODO: 待实现
        break;
      case '财富号':
        // TODO: 待实现
        break;

      // 信用卡服务
      case '信用卡账单':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '建行移动门户',
          'image': 'bg_xyksq',
        });        break;
      case '信用卡还款':
        // TODO: 待实现
        break;
      case '信用卡申请':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '信用卡申请',
          'image': 'bg_xyksq',
        });
        break;
      case '信用卡权益':
        Get.toNamed(Routes.mineRightsPage);
        break;
      case '现金分期':
        // TODO: 待实现
        break;
      case '账单分期':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '建行移动门户',
          'image': 'bg_xyksq',
        });        break;
      case '消费分期':
        // TODO: 待实现
        break;
      case '现金转出':
        // TODO: 待实现
        break;
      case '分期通':
        Get.toNamed(Routes.fixedNavPage, arguments: {
          'title': '分期通',
          'image': 'bg_fqitong',
        });        break;
      case '额度调整':
        Get.to(() => EduChangePage());
        break;

      // 贷款服务
      case '借钱':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '借钱',
          'image': 'bg_jq',
        });        break;
      case '快贷':
        // TODO: 待实现
        break;
      case '建信福袋':
        // TODO: 待实现
        break;
      case '小微快贷':
        // TODO: 待实现
        break;
      case '个人经营快贷':
        // TODO: 待实现
        break;
      case '农户快贷':
        // TODO: 待实现
        break;
      case '住房':
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '住房',
          'image': 'bg_zhuf',
        });        break;
      case '我的贷款':
        break;
      case '贷款计算器':
        // TODO: 待实现
        break;
      case '消费贷款转存\n账户资金转出':
        // TODO: 待实现
        break;
      case '账户监控授权':
        // TODO: 待实现
        break;
      case '中德住房储蓄':
        // TODO: 待实现
        break;
      case '惠懂你测额':
        // TODO: 待实现
        break;

      // 跨境服务
      case '跨境惠':
        // TODO: 待实现
        break;
      case '人民币购汇':
        // TODO: 待实现
        break;
      case '外币结汇':
        // TODO: 待实现
        break;
      case '外币预约兑换':
        // TODO: 待实现
        break;
      case '境外汇款':
        // TODO: 待实现
        break;
      case '国际汇入查询':
        // TODO: 待实现
        break;
      case '跨境理财通':
        // TODO: 待实现
        break;
      case '公派留学生借记卡激活':
        // TODO: 待实现
        break;

      // 生活服务
      case '生活缴费':
break;
      case '手机话费':
        Get.toNamed(Routes.phoneFee);
        break;
      case '党费':
        Get.toNamed(Routes.feeUnitSelection);
        break;
      case '缴费提醒':
        // TODO: 待实现
        break;
      case '自动缴费':
        // TODO: 待实现
        break;
      case '政务服务':
        // TODO: 待实现
        break;
      case '医保码':
        Get.toNamed(Routes.yibaodianzi);
        break;
      case '社保':
        Get.toNamed(Routes.sheBao);
        break;
      case '电影演出':
        Get.toNamed(Routes.movie);
        break;
      case '购物':
        // TODO: 待实现
        break;
      case '建融家园':
        break;

      // 网点服务
      case '网点服务':
        // TODO: 待实现
        break;
      case '网点取号':
        // TODO: 待实现
        break;
      case '个人开户':
        // TODO: 待实现
        break;
      case '大额预约':
        // TODO: 待实现
        break;
      case '外币预约':
        // TODO: 待实现
        break;
      case '零钞预约':
        // TODO: 待实现
        break;
      case '现金红包预约':
        // TODO: 待实现
        break;
      case '预约纪念币':
        // TODO: 待实现
        break;
      case '预约换卡':
        // TODO: 待实现
        break;
      case 'ATM无卡取款':
        Get.toNamed(Routes.wkqk);
        break;
      case '建行到家':
        break;
      case '办卡进度查询':
        break;
      case '劳动者港湾':
        // TODO: 待实现
        break;

      // 福利
      case '任务中心':
        Get.toNamed(Routes.mineTaskPage);
        break;
      case '星级专区':
        // TODO: 待实现
        break;
      case '权益中心':
        Get.toNamed(Routes.quanYiZhongXin);
        break;
      case '领券中心':
        Get.toNamed(Routes.lingJuanZhongXin);
        break;
      case '积分汇':
        Get.toNamed(Routes.minePointsPage);
        break;
      case '低碳生活':
        Get.toNamed(Routes.diTanLife);
        break;
      case '活动日历':
        // TODO: 待实现
        break;

      // 其他
      case '扫一扫':
        Get.toNamed(Routes.saoyisaoPage);
        break;
      case '资信证明':
        break;
      case '个人信用报告':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '个人信用报告',
          'image': 'bg_grxybg',
        });        break;
      case '印章查验':
        Get.toNamed(Routes.sealSelectView);
        break;
      case '电子回单查询':
        break;
      case '安全中心':
        break;
      case '摇一摇':
        // TODO: 待实现
        break;
      case '龙信商':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '龙信商',
          'image': 'bg_longxins',
        });        break;
      case '善付通':
        // TODO: 待实现
        break;
      case 'E托保':
        // TODO: 待实现
        break;
      case '小微快易':
        // TODO: 待实现
        break;
      case '商户服务':
        // TODO: 待实现
        break;
    }
  }
}
