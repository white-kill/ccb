import 'package:ccb/pages/other/navi_offset/navi_offset/navi_offset_view.dart';
import 'package:ccb/pages/subpages/search/search_view.dart';
import 'package:ccb/pages/tabs/home/gengduo/gengduo_view.dart';
import 'package:ccb/pages/tabs/home/gengduo/yibaodianzi.dart';
import 'package:ccb/pages/tabs/home/gongjijin/gongjijin/gongjijin_view.dart';
import 'package:ccb/pages/tabs/home/saoyisao/saoyisao/saoyisao_view.dart';
import 'package:ccb/pages/tabs/home/yueduzd/jh_ydzd/jh_ydzd_view.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/transfer_page/transfer_page_view.dart';
import 'package:ccb/pages/tabs/mine/account_setting/view.dart';
import 'package:ccb/pages/tabs/mine/children/kd/view.dart';
import 'package:ccb/pages/tabs/mine/children/change_phone/view.dart';
import 'package:ccb/pages/tabs/mine/children/yjbk/view.dart';
import 'package:ccb/pages/tabs/mine/children/gengduo/view.dart';
import 'package:ccb/pages/tabs/mine/account_setting/wdcx/view.dart';
import 'package:ccb/pages/tabs/home/children/fdys/view.dart';
import 'package:ccb/pages/tabs/home/children/zf_wddk/view.dart';
import 'package:ccb/pages/tabs/mine/mine_setting/bangdingsheb/bangdingshebei/bangdingshebei_view.dart';
import 'package:ccb/pages/tabs/mine/mine_setting/kjzfgl/kjzf/kjzf_view.dart';
import 'package:ccb/pages/tabs/mine/mine_setting/shezhidenglu/shezhidenglu/shezhidenglu_view.dart';
import 'package:ccb/pages/tabs/mine/mine_setting/yijiananquan/yijiananquan/yijiananquan_view.dart';
import 'package:ccb/pages/tabs/mine/person_info/person_info/crsjz/crsjz_view.dart';
import 'package:ccb/pages/tabs/mine/person_info/person_info/khinfo/khinfo/khinfo_view.dart';
import 'package:ccb/pages/tabs/mine/person_info/person_info/person_info_view.dart';
import 'package:ccb/pages/tabs/mine/person_info/person_info/zhgk/zhgk/zhgk_view.dart';
import 'package:ccb/pages/tabs/mine/print_record/print_record_view.dart';
import 'package:ccb/pages/tabs/mine/turnover_print_select/preview/view.dart';
import 'package:ccb/pages/tabs/mine/turnover_print_select/print_new_select/view.dart';
import 'package:ccb/pages/demo/calendar_demo_page.dart';
import 'package:ccb/pages/tabs/new_life/children/dian_fei/view.dart';
import 'package:ccb/pages/tabs/new_life/children/di_tan_life/view.dart';
import 'package:ccb/pages/tabs/new_life/children/movie/view.dart';
import 'package:ccb/pages/tabs/new_life/children/phone_fee/view.dart';
import 'package:ccb/pages/tabs/new_life/children/yue_hui_bei_jing/view.dart';
import 'package:ccb/pages/tabs/new_life/children/fee_unit_selection/view.dart';
import 'package:ccb/pages/tabs/new_life/children/jian_hang_life/view.dart';
import 'package:ccb/pages/tabs/new_life/children/ran_qi_fee/view.dart';
import 'package:ccb/pages/tabs/new_life/children/she_bao/view.dart';
import 'package:ccb/pages/tabs/new_life/children/ling_juan_zhong_xin/view.dart';
import 'package:ccb/pages/tabs/new_life/children/quan_yi_zhong_xin/view.dart';
import 'package:ccb/pages/tabs/new_life/children/lian_he_hui_yuan_shou_quan/view.dart';
import 'package:ccb/pages/tabs/new_life/more_services/view.dart';
import 'package:ccb/pages/tabs/new_life/view.dart';
import 'package:ccb/pages/tabs/wealth/children/lccp/view.dart';
import 'package:ccb/pages/tabs/wealth/children/lc/lc_page.dart';
import 'package:ccb/pages/tabs/wealth/children/jjtz/view.dart';
import 'package:ccb/pages/tabs/wealth/children/bx/view.dart';
import 'package:ccb/pages/tabs/wealth/children/gjs/view.dart';
import 'package:ccb/pages/tabs/wealth/children/jhyx/view.dart';
import 'package:ccb/pages/tabs/wealth/children/lqb1/view.dart';
import 'package:ccb/pages/tabs/wealth/children/lqb2/view.dart';
import 'package:ccb/pages/tabs/wealth/children/sy/view.dart';
import 'package:ccb/pages/tabs/wealth/children/more/view.dart';
import 'package:ccb/pages/tabs/wealth/children/ckcp/ckcp_page.dart';
import 'package:ccb/pages/tabs/wealth/children/ckcp/children/dqck/view.dart';
import 'package:ccb/pages/tabs/wealth/children/ckcp/children/decd/view.dart';
import 'package:ccb/pages/tabs/wealth/children/ckcp/children/tzck/view.dart';
import 'package:ccb/pages/tabs/wealth/children/ckcp/children/tsck/view.dart';
import 'package:ccb/pages/tabs/wealth/children/ckcp/children/jgxck/view.dart';
import 'package:ccb/pages/tabs/home/more/more_view.dart' as HomeMore;
import 'package:ccb/pages/tabs/wealth/children/szjrzhc/view.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart' show SmartDialog, SmartStatus;
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import '../pages/account/login/login_view.dart';
import '../pages/index/index_view.dart';
import '../pages/other/ccb_customer/ccb_customer_view.dart';
import '../pages/other/change_nav/change_nav_view.dart';
import '../pages/other/face/face_view.dart';
import '../pages/other/fixed_nav/fixed_nav_view.dart';
import '../pages/other/seal/seal_view.dart';
import '../pages/other/seal_review/seal_review_view.dart';
import '../pages/other/seal_select/seal_select_view.dart';
import '../pages/splash/splash_view.dart';
import '../pages/subpages/search_content/search_content_view.dart';
import '../pages/tabs/home/children/cftj/view.dart';
import '../pages/tabs/home/children/wdfw/view.dart';
import '../pages/tabs/home/children/shjf/view.dart';
import '../pages/tabs/home/home_scan/home_scan_view.dart';
import '../pages/tabs/home/yueduzd/yueduzd/yueduzd_view.dart';
import '../pages/tabs/mine/account_details/account_details_view.dart';
import '../pages/tabs/mine/account_details/detail_more_time/detail_more_time_view.dart';
import '../pages/tabs/mine/account_details/detail_search/detail_search_view.dart';
import '../pages/tabs/mine/account_details/detail_search_list/detail_search_list_view.dart';
import '../pages/tabs/mine/account_details/detaild_info/detaild_info_view.dart';
import '../pages/tabs/mine/account_money_transfer/account_money_transfer_view.dart';
import '../pages/tabs/mine/account_money_transfer/account_transfer/bank_list/bank_list_view.dart';
import '../pages/tabs/mine/account_money_transfer/account_transfer/contacts_list/contants_list_view.dart';
import '../pages/tabs/mine/account_money_transfer/account_transfer/transfer_result/transfer_result_view.dart';
import '../pages/tabs/mine/account_money_transfer/bind_phone/bind_phone_view.dart';
import '../pages/tabs/mine/account_money_transfer/sub_page1/sub_page1_view.dart';
import '../pages/tabs/mine/account_money_transfer/sub_page2/sub_page2_view.dart';
import '../pages/tabs/mine/account_money_transfer/ta_hang_zhuan_ru/view.dart';
import '../pages/tabs/mine/account_preview/account_preview_view.dart';
import '../pages/tabs/mine/account_preview/card_detail/card_detail_view.dart';
import '../pages/tabs/mine/account_money_transfer/account_transfer/account_transfer_view.dart';
import '../pages/tabs/mine/ccb_home/ccb_home_view.dart';
import '../pages/tabs/mine/ccb_home/hold_page/hold_page_view.dart';
import '../pages/tabs/mine/ccb_home/person_page/person_page_view.dart';
import '../pages/tabs/mine/ccb_home/print_progress/print_progress_view.dart';
import '../pages/tabs/mine/main_e_account/main_e_account_view.dart';
import '../pages/tabs/mine/mine_coupon/mine_coupon_view.dart';
import '../pages/tabs/mine/mine_credit/mine_credit_view.dart';
import '../pages/tabs/mine/mine_loan/mine_loan_view.dart';
import '../pages/tabs/mine/mine_message/mine_message_view.dart';
import '../pages/tabs/mine/mine_peizhi/mine_pz_view.dart';
import '../pages/tabs/mine/mine_points/mine_points_view.dart';
import '../pages/tabs/mine/mine_prove/mine_prove_view.dart';
import '../pages/tabs/mine/mine_receipt/mine_receipt_view.dart';
import '../pages/tabs/mine/mine_receipt/send_message/send_message_view.dart';
import '../pages/tabs/mine/mine_rights/mine_rights_view.dart';
import '../pages/tabs/mine/mine_setting/mine_setting_view.dart';
import '../pages/tabs/mine/mine_task/mine_task_view.dart';
import '../pages/tabs/mine/prove_application/prove _application_view.dart';
import '../pages/tabs/mine/transfer_detail/transfer_detail_view.dart';
import '../pages/tabs/mine/transfer_record/person_transfer/person_transfer_view.dart';
import '../pages/tabs/mine/transfer_record/transfer_record_view.dart';
import '../pages/tabs/mine/account_money_transfer/transfer_setting/transfer_setting_view.dart';
import '../pages/tabs/mine/turnover_print/print_info/print_info_view.dart';
import '../pages/tabs/mine/turnover_print/print_result/print_result_view.dart';
import '../pages/tabs/mine/turnover_print/turnover_print_view.dart';
import '../pages/tabs/mine/turnover_print_select/turnover_print_select_view.dart';
import 'package:ccb/pages/tabs/new_card/card_package/view.dart';
import 'package:ccb/pages/tabs/new_card/card_services/view.dart';
import 'package:ccb/pages/tabs/new_card/fen_qi_cha/view.dart';
import 'package:ccb/pages/tabs/new_card/fen_qi_tong/view.dart';
import 'package:get/get.dart';

import '../pages/tabs/wealth/children/ckcp/children/sm/view.dart';
import '../pages/tabs/mine/account_preview/children/add_bank/add_bank_view.dart';
import '../pages/tabs/mine/account_preview/children/manager/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/khhcx/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/gljwjy/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/gengduo/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/aqs/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/yyhk/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/zhgs/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/zhsjj/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/wkqk/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/xesz/view.dart';
import '../pages/tabs/mine/account_preview/card_detail/children/gengduo/zixinzhengming/view.dart';
import 'package:ccb/pages/tabs/mine/account_preview/card_detail/children/gengduo/delete_account/view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.tabs,
      page: () => IndexPage(),
    ),
    GetPage(
      name: Routes.addBank,
      page: () => AddBankPage(),
    ),
    GetPage(name: Routes.search, page: () => SearchPage()),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.face,
      page: () => FacePage(),
    ),
    GetPage(
      name: Routes.accountPreview,
      page: () => AccountPreviewPage(),
    ),
    GetPage(
      name: Routes.accountDetail,
      page: () => AccountDetailsPage(),
    ),
    GetPage(
      name: Routes.accountMoneyTransferView,
      page: () => AccountMoneyTransferView(),
    ),
    GetPage(
      name: Routes.accountTransferPage,
      page: () => AccountTransferPage(),
    ),
    GetPage(
      name: Routes.ccbHomePage,
      page: () => CcbHomePage(),
    ),
    GetPage(
      name: Routes.turnoverPrintPage,
      page: () => PrintPreviewPage(),
    ),
    GetPage(
      name: Routes.minePointsPage,
      page: () => MinePointsPage(),
    ),
    GetPage(
      name: Routes.mineCouponPage,
      page: () => MineCouponPage(),
    ),
    GetPage(
      name: Routes.mineRightsPage,
      page: () => MineRightsPage(),
    ),
    GetPage(
      name: Routes.minePeizhiPage,
      page: () => MinePzPage(),
    ),
    GetPage(
      name: Routes.ccbCustomerPage,
      page: () => CcbCustomerPage(),
    ),
    GetPage(
      name: Routes.mineSettingPage,
      page: () => MineSettingPage(),
    ),
    GetPage(
      name: Routes.mineMessagePage,
      page: () => MineMessagePage(),
    ),
    GetPage(
      name: Routes.mineTaskPage,
      page: () => MineTaskPage(),
    ),
    GetPage(
      name: Routes.homeScanPage,
      page: () => HomeScanPage(),
    ),
    GetPage(
      name: Routes.changeNavPage,
      page: () => ChangeNavPage(),
    ),
    GetPage(
      name: Routes.fixedNavPage,
      page: () => FixedNavPage(),
    ),
    GetPage(
      name: Routes.settingPage,
      page: () => MineSettingPage(),
    ),
    GetPage(
      name: Routes.turnoverPrintSelectPage,
      page: () => TurnoverPrintSelectPage(),
    ),
    GetPage(
      name: Routes.realturnoverPrintSelectPage,
      page: () => TurnoverPrintPage(),
    ),
    GetPage(
      name: Routes.printNewSelectPage,
      page: () => PrintNewSelectPage(),
    ),
    GetPage(
      name: Routes.minCreditPage,
      page: () => MinCreditPage(),
    ),
    GetPage(
      name: Routes.mineProvePage,
      page: () => MineProvePage(),
    ),
    GetPage(
      name: Routes.mineLoanPage,
      page: () => MineLoanPage(),
    ),
    GetPage(
      name: Routes.cardDetailPage,
      page: () => CardDetailPage(),
    ),
    GetPage(name: Routes.yijiananquan, page: () => YijiananquanPage()),
    GetPage(name: Routes.denglumima, page: () => ShezhidengluPage()),
    GetPage(
      name: Routes.bangxingsheb,
      page: () => BangdingshebeiPage(),
    ),
    GetPage(
      name: Routes.naviOffset,
      page: () => NaviOffsetPage(),
    ),
    GetPage(
      name: Routes.gongjijin,
      page: () => GongjijinPage(),
    ),
    GetPage(
      name: Routes.gengduo,
      page: () => GengduoPage(),
    ),
    GetPage(
      name: Routes.yibaodianzi,
      page: () => TargetPage(),
    ),
    GetPage(
      name: Routes.accountManager,
      page: () => ManagerPage(),
    ),
    GetPage(
      name: Routes.cardPackage,
      page: () => CardPackagePage(),
    ),
    GetPage(
      name: Routes.installmentInquiry,
      page: () => InstallmentInquiryPage(),
    ),
    GetPage(
      name: Routes.cardServices,
      page: () => CardServicesPage(),
    ),
    GetPage(
      name: Routes.kuaijiezhifu,
      page: () => KjzfPage(),
    ),
    GetPage(
      name: Routes.detailInfoPage,
      page: () => DetailInfoPage(),
    ),
    GetPage(name: Routes.transferRecordPage, page: () => TransferRecordPage()),
    GetPage(name: Routes.transferDetailPage, page: () => TransferDetailPage()),
    GetPage(name: Routes.transferPagePage, page: () => TransferPagePage()),
    GetPage(name: Routes.transferSettingPage, page: () => TransferSettingPage()),
    GetPage(name: Routes.personInfoPage, page: () => Person_infoPage()),
    GetPage(
      name: Routes.crsjzdc,
      page: () => CrsjzPage(),
    ),
    GetPage(
      name: Routes.zhhfyj,
      page: () => ZhgkPage(),
    ),
    GetPage(
      name: Routes.khinfo,
      page: () => KhinfoPage(),
    ),
    GetPage(name: Routes.bankListPage, page: () => BankListPage()),
    GetPage(name: Routes.contactsListPage, page: () => ContactsListPage()),
    GetPage(name: Routes.proveApplicationPage, page: () => ProveApplicationPage()),
    GetPage(name: Routes.transferResultPage, page: () => TransferResultPage()),
    GetPage(name: Routes.searchContentPage, page: () => SearchContentPage()),
    GetPage(name: Routes.printInfoPage, page: () => PrintInfoPage()),
    GetPage(name: Routes.printResultPage, page: () => PrintResultPage()),
    GetPage(name: Routes.printRecordPage, page: () => PrintRecordPage()),
    GetPage(name: Routes.printProgressPage, page: () => PrintProgressPage()),
    GetPage(name: Routes.detailSearchListPage, page: () => DetailSearchListPage()),
    GetPage(name: Routes.detailSearchPage, page: () => DetailSearchPage()),
    GetPage(name: Routes.bindPhonePage, page: () => BindPhonePage()),
    GetPage(name: Routes.personTransferPage, page: () => PersonTransferPage()),
    GetPage(name: Routes.yuedzdPage, page: () => YueduzdPage()),
    GetPage(name: Routes.sealPage, page: () => SealPage()),
    GetPage(name: Routes.sealSelectView, page: () => SealSelectView()),
    GetPage(name: Routes.sealReviewPage, page: () => SealReviewPage()),
    GetPage(name: Routes.subpage1Page, page: () => Sub_page1Page()),
    GetPage(name: Routes.subpage2Page, page: () => Sub_page2Page()),
    GetPage(name: Routes.holdPagePage, page: () => Hold_pagePage()),
    GetPage(name: Routes.personPagePage, page: () => Person_pagePage()),
    GetPage(name: Routes.Jh_ydzdPage, page: () => Jh_ydzdPage()),
    GetPage(name: Routes.saoyisaoPage, page: () => SaoyisaoPage()),
    GetPage(name: Routes.detailMoreTimePage, page: () => DetailMoreTimePage()),
    GetPage(name: Routes.mineReceiptPage, page: () => MineReceiptPage()),
    GetPage(name: Routes.sendMessagePage, page: () => SendMessagePage()),
    GetPage(name: Routes.mainEAccountPage, page: () => MainEAccountPage()),
    GetPage(
      name: Routes.NewLife,
      page: () => NewLifePage(),
    ),
    GetPage(
      name: Routes.dianFei,
      page: () => DianFeiPage(),
    ),
    GetPage(
      name: Routes.phoneFee,
      page: () => PhoneFeePage(),
    ),
    GetPage(
      name: Routes.diTanLife,
      page: () => DiTanLifePage(),
    ),
    GetPage(
      name: Routes.movie,
      page: () => MoviePage(),
    ),
    GetPage(name: Routes.yueHuiBeiJing, page: () => YueHuiBeiJingPage()),
    GetPage(
      name: Routes.feeUnitSelection,
      page: () => FeeUnitSelectionPage(),
    ),
    GetPage(
      name: Routes.jianHangLife,
      page: () => JianHangLifePage(),
    ),
    GetPage(
      name: Routes.ranQiFee,
      page: () => RanQiFeePage(),
    ),
    GetPage(
      name: Routes.sheBao,
      page: () => SheBaoPage(),
    ),
    GetPage(
      name: Routes.lingJuanZhongXin,
      page: () => LingJuanZhongXinPage(),
    ),
    GetPage(
      name: Routes.quanYiZhongXin,
      page: () => QuanYiZhongXinPage(),
    ),
    GetPage(
      name: Routes.lianHeHuiYuanShouQuan,
      page: () => LianHeHuiYuanShouQuanPage(),
    ),
    GetPage(
      name: Routes.moreServices,
      page: () => MoreServicesPage(),
    ),
    GetPage(
      name: Routes.lccp,
      page: () => LccpPage(),
    ),
    GetPage(
      name: Routes.lc,
      page: () => LcPage(),
    ),
    GetPage(
      name: Routes.jjtz,
      page: () => JiJinTouZiMainPage(),
    ),
    GetPage(
      name: Routes.bx,
      page: () => BaoXianMainPage(),
    ),
    GetPage(
      name: Routes.gjs,
      page: () => GuiJinShuMainPage(),
    ),
    GetPage(
      name: Routes.jhyx,
      page: () => JianHangYanXuanPage(),
    ),
    GetPage(
      name: Routes.lqb1,
      page: () => Lqb1Page(),
    ),
    GetPage(
      name: Routes.lqb2,
      page: () => Lqb2Page(),
    ),
    GetPage(
      name: Routes.sy,
      page: () => SyPage(),
    ),
    GetPage(
      name: Routes.more,
      page: () => MorePage(),
    ),
    GetPage(
      name: Routes.ckcp,
      page: () => CkcpPage(),
    ),
    GetPage(
      name: Routes.dqck,
      page: () => DqckView(),
    ),
    GetPage(
      name: Routes.decd,
      page: () => DecdView(),
    ),
    GetPage(
      name: Routes.tzck,
      page: () => TzckView(),
    ),
    GetPage(
      name: Routes.tsck,
      page: () => TsckView(),
    ),
    GetPage(
      name: Routes.jgxck,
      page: () => JgxckView(),
    ),
    GetPage(
      name: Routes.sm,
      page: () => SMPage(),
    ),
    GetPage(name: Routes.homeMore, page: () => HomeMore.MorePage()),
    GetPage(name: Routes.cftj, page: () => CftjPage()),
    GetPage(name: Routes.wdfw, page: () => WdfwPage()),
    GetPage(name: Routes.cftj, page: () => CftjPage()),
    GetPage(name: Routes.shjf, page: () => ShjfPage()),
    GetPage(name: Routes.kd, page: () => KDPage()),
    GetPage(
      name: Routes.khhcx,
      page: () => KhhcxPage(),
    ),
    GetPage(
      name: Routes.gljwjy,
      page: () => GljwjyPage(),
    ),
    GetPage(
      name: Routes.yhkxqgd,
      page: () => YHKXQGengduoPage(),
    ),
    GetPage(
      name: Routes.aqs,
      page: () => AqsPage(),
    ),
    GetPage(
      name: Routes.yyhk,
      page: () => YyhkPage(),
    ),
    GetPage(
      name: Routes.zhgs,
      page: () => ZhgsPage(),
    ),
    GetPage(
      name: Routes.zhsjj,
      page: () => ZhsjjPage(),
    ),
    GetPage(
      name: Routes.wkqk,
      page: () => WkqkPage(),
    ),
    GetPage(
      name: Routes.xesz,
      page: () => XeszPage(),
    ),
    GetPage(
      name: Routes.mineInfo,
      page: () => AccountSettingPage(),
    ),
    GetPage(
      name: Routes.ziXinZhengMing,
      page: () => ZiXinZhengMingPage(),
    ),
    GetPage(
      name: Routes.changePhone,
      page: () => ChangePhonePage(),
    ),
    GetPage(
      name: Routes.sczh,
      page: () => DeleteAccountPage(),
    ),
    GetPage(
      name: Routes.yjbk,
      page: () => YJBKPage(),
    ),
    GetPage(
      name: Routes.wdszgd,
      page: () => MineBottomSettingMorePage(),
    ),
    GetPage(
      name: Routes.wdcx,
      page: () => WdcxPage(),
    ),
    GetPage(
      name: Routes.fdys,
      page: () => FangDaiYuShenPage(),
    ),
    GetPage(
      name: Routes.zfwddk,
      page: () => ZFWDDKPage(),
    ),
    GetPage(
      name: Routes.splashPage,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.tahangzhuanru,
      page: () => TaHangZhuanRuPage(),
    ),
    GetPage(
      name: Routes.calendarDemoPage,
      page: () => CalendarDemoPage(),
    ),
  ];

  static toPrintView() {
    "".showLoading;
    Future.delayed(Duration(seconds: 1), () {
      SmartDialog.dismiss(status: SmartStatus.loading);
      Get.toNamed(
        Routes.turnoverPrintPage,
      );
    });
  }
}
