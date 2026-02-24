import 'package:flutter/material.dart';

class MoreState {
  MoreState();
  // 这里可以扩展页面状态
  // 当前选中的分组索引
  int selectedGroup = 0;
  // 右侧每个分组的key用于锚点滚动
  List<GlobalKey> groupKeys = [];

  // 账户服务
  final List<Map<String, String>> accountServices = [
    {'label': '账户明细', 'icon': 'assets/new_images/home/more/zhmx.png'},
    {'label': '我的账户', 'icon': 'assets/new_images/home/more/wdzh.png'},
    {'label': '电子账户', 'icon': 'assets/new_images/home/more/dzzh.png'},
    {'label': '月度账单', 'icon': 'assets/new_images/home/more/ydzd.png'},
    {'label': '账单分期', 'icon': 'assets/new_images/home/more/zdfq.png'},
    {'label': '开户', 'icon': 'assets/new_images/home/more/kh.png'},
  ];

  // 转账服务
  final List<Map<String, String>> transferServices = [
    {'label': '转账汇款', 'icon': 'assets/new_images/home/more/zzhk.png'},
    {'label': '账号转账', 'icon': 'assets/new_images/home/more/zhzz.png'},
    {'label': '手机号转账', 'icon': 'assets/new_images/home/more/sjhzz.png'},
    {'label': '转账记录', 'icon': 'assets/new_images/home/more/zzjl.png'},
    {'label': '转账设置', 'icon': 'assets/new_images/home/more/zzsz.png'},
    {'label': '预约转账', 'icon': 'assets/new_images/home/more/yyzz.png'},
    {'label': '批量转账', 'icon': 'assets/new_images/home/more/plzz.png'},
  ];

  // 支付服务
  final List<Map<String, String>> paymentServices = [
    {'label': '付款码', 'icon': 'assets/new_images/home/more/fkm.png'},
    {'label': '收款码', 'icon': 'assets/new_images/home/more/skm.png'},
    {'label': '扫一扫', 'icon': 'assets/new_images/home/more/sys.png'},
    {'label': '快捷支付', 'icon': 'assets/new_images/home/more/kjzf.png'},
    {'label': '龙支付', 'icon': 'assets/new_images/home/more/lzf.png'},
  ];

  // 财富服务
  final List<Map<String, String>> wealthServices = [
    {'label': '理财产品', 'icon': 'assets/new_images/home/more/lccp.png'},
    {'label': '基金投资', 'icon': 'assets/new_images/home/more/jjtz.png'},
    {'label': '存款产品', 'icon': 'assets/new_images/home/more/ckcp.png'},
    {'label': '定期存款', 'icon': 'assets/new_images/home/more/dqck.png'},
    {'label': '贵金属', 'icon': 'assets/new_images/home/more/gjs.png'},
    {'label': '保险', 'icon': 'assets/new_images/home/more/bx.png'},
    {'label': '投资理财', 'icon': 'assets/new_images/home/more/tzlc.png'},
    {'label': '基金定投', 'icon': 'assets/new_images/home/more/jjdt.png'},
  ];

  // 信用卡服务
  final List<Map<String, String>> creditCardServices = [
    {'label': '信用卡', 'icon': 'assets/new_images/home/more/xyk.png'},
    {'label': '卡片服务', 'icon': 'assets/new_images/home/more/kpfw.png'},
    {'label': '卡包', 'icon': 'assets/new_images/home/more/kb.png'},
    {'label': '分期查询', 'icon': 'assets/new_images/home/more/fqcx.png'},
    {'label': '账单分期', 'icon': 'assets/new_images/home/more/zdfq.png'},
    {'label': '我的账单', 'icon': 'assets/new_images/home/more/wdzd.png'},
  ];

  // 贷款服务
  final List<Map<String, String>> loanServices = [
    {'label': '贷款', 'icon': 'assets/new_images/home/more/dk.png'},
    {'label': '我的贷款', 'icon': 'assets/new_images/home/more/wddk.png'},
    {'label': '贷款申请', 'icon': 'assets/new_images/home/more/dksq.png'},
    {'label': '还款计划', 'icon': 'assets/new_images/home/more/hkjh.png'},
    {'label': '提前还款', 'icon': 'assets/new_images/home/more/tqhk.png'},
  ];

  // 跨境服务
  final List<Map<String, String>> crossBorderServices = [
    {'label': '跨境惠', 'icon': 'assets/new_images/home/more/kjh.png'},
    {'label': '人民币购汇', 'icon': 'assets/new_images/home/more/rmbgh.png'},
    {'label': '外币结汇', 'icon': 'assets/new_images/home/more/wbjh.png'},
    {'label': '外币预约兑换', 'icon': 'assets/new_images/home/more/wbyydh.png'},
    {'label': '境外汇款', 'icon': 'assets/new_images/home/more/jwhk.png'},
    {'label': '国际汇入查询', 'icon': 'assets/new_images/home/more/gjhrcx.png'},
    {'label': '跨境理财通', 'icon': 'assets/new_images/home/more/kjlct.png'},
    {'label': '公派留学生借记卡激活', 'icon': 'assets/new_images/home/more/gplxsjjkjh.png'},
  ];

  // 生活服务
  final List<Map<String, String>> lifeServices = [
    {'label': '生活缴费', 'icon': 'assets/new_images/home/more/shjf.png'},
    {'label': '手机话费', 'icon': 'assets/new_images/home/more/sjhf.png'},
    {'label': '党费', 'icon': 'assets/new_images/home/more/df.png'},
    {'label': '缴费提醒', 'icon': 'assets/new_images/home/more/jftx.png'},
    {'label': '自动缴费', 'icon': 'assets/new_images/home/more/zdjf.png'},
    {'label': '政务服务', 'icon': 'assets/new_images/home/more/zwfw.png'},
    {'label': '医保码', 'icon': 'assets/new_images/home/more/ybm.png'},
    {'label': '社保', 'icon': 'assets/new_images/home/more/sb.png'},
    {'label': '电影演出', 'icon': 'assets/new_images/home/more/dyyc.png'},
    {'label': '购物', 'icon': 'assets/new_images/home/more/gw.png'},
    {'label': '建融家园', 'icon': 'assets/new_images/home/more/jrjy.png'},
  ];

  // 网点服务
  final List<Map<String, String>> branchServices = [
    {'label': '网点服务', 'icon': 'assets/new_images/home/more/wdfw.png'},
    {'label': '网点取号', 'icon': 'assets/new_images/home/more/wdqh.png'},
    {'label': '个人开户', 'icon': 'assets/new_images/home/more/grkh.png'},
    {'label': '大额预约', 'icon': 'assets/new_images/home/more/deyy.png'},
    {'label': '外币预约', 'icon': 'assets/new_images/home/more/wbyy.png'},
    {'label': '零钞预约', 'icon': 'assets/new_images/home/more/lcyy.png'},
    {'label': '现金红包预约', 'icon': 'assets/new_images/home/more/xjhbyy.png'},
    {'label': '预约纪念币', 'icon': 'assets/new_images/home/more/yyjnb.png'},
    {'label': '预约换卡', 'icon': 'assets/new_images/home/more/yyhk.png'},
    {'label': 'ATM无卡取款', 'icon': 'assets/new_images/home/more/atmwkqk.png'},
    {'label': '建行到家', 'icon': 'assets/new_images/home/more/jhdj.png'},
    {'label': '办卡进度查询', 'icon': 'assets/new_images/home/more/bkjdcx.png'},
    {'label': '劳动者港湾', 'icon': 'assets/new_images/home/more/ldzgw.png'},
  ];

  // 福利
  final List<Map<String, String>> welfareServices = [
    {'label': '任务中心', 'icon': 'assets/new_images/home/more/rwzx.png'},
    {'label': '星级专区', 'icon': 'assets/new_images/home/more/xjzq.png'},
    {'label': '权益中心', 'icon': 'assets/new_images/home/more/qyzx.png'},
    {'label': '领券中心', 'icon': 'assets/new_images/home/more/ljzx.png'},
    {'label': '积分汇', 'icon': 'assets/new_images/home/more/jfh.png'},
    {'label': '低碳生活', 'icon': 'assets/new_images/home/more/dtsh.png'},
    {'label': '活动日历', 'icon': 'assets/new_images/home/more/hdrl.png'},
  ];

  // 其他
  final List<Map<String, String>> otherServices = [
    {'label': '扫一扫', 'icon': 'assets/new_images/home/more/sys.png'},
    {'label': '资信证明', 'icon': 'assets/new_images/home/more/zxzm.png'},
    {'label': '个人信用报告', 'icon': 'assets/new_images/home/more/grxybg.png'},
    {'label': '印章查验', 'icon': 'assets/new_images/home/more/yzcy.png'},
    {'label': '电子回单查询', 'icon': 'assets/new_images/home/more/dzhdcx.png'},
    {'label': '安全中心', 'icon': 'assets/new_images/home/more/aqzx.png'},
    {'label': '摇一摇', 'icon': 'assets/new_images/home/more/yyy.png'},
    {'label': '龙信商', 'icon': 'assets/new_images/home/more/lxs.png'},
    {'label': '善付通', 'icon': 'assets/new_images/home/more/sft.png'},
    {'label': 'E托保', 'icon': 'assets/new_images/home/more/etb.png'},
    {'label': '小微快易', 'icon': 'assets/new_images/home/more/xwky.png'},
    {'label': '商户服务', 'icon': 'assets/new_images/home/more/shfw.png'},
  ];
}
