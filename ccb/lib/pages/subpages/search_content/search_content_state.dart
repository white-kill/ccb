import 'package:flutter/material.dart';

class SearchContentState {


  String name = '';

  List<String> titleList = [
    '精选',
    '服务',
    '产品',
    '活动'
  ];

  List dzyzList = [
    {
      'name':'印章查验',
      'icon':'icon_s_3'
    },
    {
      'name':'电子工资单查询',
      'icon':'icon_s_2'
    },
    {
      'name':'电子回单查询',
      'icon':'icon_s_1'
    },
    {
      'name':'非税电子化',
      'icon':'icon_s_3'
    },
  ];

  Map<String, List<Map<String,dynamic>>> nameData = {
    '转账汇款': [
      {
        'name': '转账汇款',
        'color': Colors.blue,
      },
      {
        'name': '我要转账',
        'color': Colors.cyan,
      },
      {
        'name':'转账记录',
        'color': Colors.orange,
      },
      {
        'name': '限额设置',
        'color': Colors.red,
      },
    ],
    '流水打印': [
      {
        // 'name': '流水打印',
        'name': '账户明细查询',
        'color': Colors.blue,
      },
      {
        // 'name': '账户明细查询',
        'name': '信用卡交易明细',
        'color': Colors.cyan,
      },
      {
        // 'name':'支付账单',
        'name':'信用卡账单查询',
        'color': Colors.orange,
      },
      // {
      //   'name': '我的账户',
      //   'color': Colors.red,
      // },
    ],
    '明细查询': [
      {
        'name': '账户明细查询',
        'color': Colors.blue,
      },
      {
        'name': '支付账单',
        'color': Colors.cyan,
      },
      {
        'name':'我的账户',
        'color': Colors.orange,
      },
      {
        'name': '流水打印',
        'color': Colors.red,
      },
    ],
    '收支明细': [
      {
        'name': '账户明细查询',
        'color': Colors.blue,
      },
      {
        'name': '支付账单',
        'color': Colors.cyan,
      },
      {
        'name':'我的账户',
        'color': Colors.orange,
      },
      {
        'name': '流水打印',
        'color': Colors.red,
      },
    ],
    '月度账单': [
      {
        'name': '月度账单',
        'color': Colors.blue,
      },
      {
        'name': '信用卡已出账单',
        'color': Colors.blue,
      },
      {
        'name':'信用卡未出账单',
        'color': Colors.orange,
      },
      {
        'name': '账单分期',
        'color': Colors.red,
      },
    ],
    '电子印章': [
      {
        'name': '电子印章查验',
        'color': Colors.blue,
      },
    ],
  };


  Map<String, List<Map<String,dynamic>>> contentDat = {
    '转账汇款': [
      {
        'name': '转账汇款',
        'content': '',
        'icon':'icon_s_1',
        'keyword':'转账',
      },
      {
        'name': '转账记录',
        'content': '转账>转账记录',
        'icon':'icon_s_3',
        'keyword':'转账',
      },
      {
        'name': '我要转账',
        'content': '',
        'icon':'icon_s_2',
        'keyword':'转账',
      },
      {
        'name': '预约转账',
        'content': '更多>转账汇款>预约转账',
        'icon':'icon_s_3',
        'keyword':'转账',
      },
      {
        'name': '境内外币转账',
        'content': '更多>转账汇款>境内外币转账',
        'icon':'icon_s_1',
        'keyword':'转账',
      },
    ],
    '流水打印': [
      {
        'name': '流水打印',
        // 'content': '首页>更多>账户>流水打印',
        'content': '',
        'icon':'icon_s_2',
        'keyword':'',
      },
      // {
      //   'name': '账户明细查询',
      //   'content': '更多>账户>账户明细查询',
      //   'icon':'icon_s_3',
      //   'keyword':'明细',
      // },
      // {
      //   'name':'钱包明细',
      //   'content': '',
      //   'icon':'icon_s_1',
      //   'keyword':'明细',
      // },
      // {
      //   'name': '信用卡交易明细申请',
      //   'content': '信用卡>更多>信用卡交易明细申请',
      //   'icon':'icon_s_2',
      //   'keyword':'明细',
      // },
      // {
      //   'name': '信用卡交易明细查询',
      //   'content': '信用卡>更多>我的账务>交易明细',
      //   'icon':'icon_s_3',
      //   'keyword':'明细',
      // },
    ],
    '明细查询': [
      {
        'name': '账户明细查询',
        'content': '更多>账户>账户明细查询',
        'icon':'icon_s_1',
        'keyword':'明细',
      },
      {
        'name': '信用卡交易明细申请',
        'content': '信用卡>更多>信用卡交易明细申请',
        'icon':'icon_s_2',
        'keyword':'明细',
      },
      {
        'name':'钱包明细',
        'content': '',
        'icon':'icon_s_3',
        'keyword':'明细',
      },
      {
        'name': '信用卡交易明细查询',
        'content': '信用卡>更多>我的账务>交易明细',
        'icon':'icon_s_1',
        'keyword':'明细',
      },
      {
        'name': '流水打印',
        'content': '首页>更多>账户>流水打印',
        'icon':'icon_s_2',
        'keyword':'流水',
      },
    ],
    '收支明细': [
      {
        'name': '账户明细查询',
        'content': '更多>账户>账户明细查询',
        'icon':'icon_s_3',
        'keyword':'明细',
      },
      {
        'name': '信用卡交易明细申请',
        'content': '信用卡>更多>信用卡交易明细申请',
        'icon':'icon_s_1',
        'keyword':'明细',
      },
      {
        'name':'钱包明细',
        'content': '',
        'icon':'icon_s_2',
        'keyword':'明细',
      },
      {
        'name': '信用卡交易明细查询',
        'content': '信用卡>更多>我的账务>交易明细',
        'icon':'icon_s_3',
        'keyword':'明细',
      },
      {
        'name': '流水打印',
        'content': '首页>更多>账户>流水打印',
        'icon':'icon_s_1',
        'keyword':'流水',
      },
    ],
    '月度账单': [
      {
        'name': '月度账单',
        'content': '我的信息>月度账单',
        'icon':'icon_s_2',
        'keyword':'月度账单',
      },
      {
        'name': '信用卡账单查询',
        'content': '信用卡>账单查询',
        'icon':'icon_s_3',
        'keyword':'账单',
      },
      {
        'name':'支付账单',
        'content': '',
        'icon':'icon_s_3',
        'keyword':'',
      },
      {
        'name': '账单日修改',
        'content': '信用卡>更多>用卡服务>账单日修改',
        'icon':'icon_s_1',
        'keyword':'账单',
      },
      {
        'name': '信用卡账单分期',
        'content': '信用卡>更多>我要分期>账单分期',
        'icon':'icon_s_2',
        'keyword':'账单',
      },
    ],
    '电子印章': [
      {
        'name': '月度账单',
        'content': '我的信息>月度账单',
        'icon':'icon_s_2',
        'keyword':'月度账单',
      },
      {
        'name': '信用卡账单查询',
        'content': '信用卡>账单查询',
        'icon':'icon_s_3',
        'keyword':'账单',
      },
      {
        'name':'支付账单',
        'content': '',
        'icon':'icon_s_3',
        'keyword':'',
      },
      {
        'name': '账单日修改',
        'content': '信用卡>更多>用卡服务>账单日修改',
        'icon':'icon_s_1',
        'keyword':'账单',
      },
      {
        'name': '信用卡账单分期',
        'content': '信用卡>更多>我要分期>账单分期',
        'icon':'icon_s_2',
        'keyword':'账单',
      },
    ],
  };

  SearchContentState() {
    ///Initialize variables
  }
}
