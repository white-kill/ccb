import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'child/view.dart';
import 'search_content_state.dart';

class SearchContentLogic extends GetxController {
  final SearchContentState state = SearchContentState();


  var selectName = '精选'.obs;
  @override
  void onInit() {
    super.onInit();

    state.name = Get.arguments['name']??'';
  }

  void jumpPage(String name){
    switch (name) {
      case '转账汇款':
        Get.toNamed(Routes.accountMoneyTransferView,);
        break;
      case '转账记录':
        Get.toNamed(Routes.transferRecordPage,);
        break;
      case '我要转账':
        Get.offNamed(Routes.accountTransferPage);
        break;
      case '预约转账':
      //TODO: 这里需要跳转，需要图
      Get.toNamed(Routes.naviOffset, arguments: {
        'title': '预约转账',
        'image': 'bg_yyzz',
      });
        break;
      case '境内外币转账':
        Get.toNamed(Routes.accountMoneyTransferView,);
        break;
      case '流水打印':
        AppPages.toPrintView();
        break;
      case '账户明细查询':
        Get.toNamed(Routes.accountDetail);
        break;
      case '钱包明细':
      case '我的账户':
        Get.toNamed(Routes.accountPreview,);
        break;
      case '信用卡已出账单':
      case '信用卡未出账单':
      case '账单分期':
      case '信用卡交易明细申请':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '建行移动门户',
          'image': 'bg_xyksq',
        });
        break;
      case '信用卡交易明细':
        Get.to(XykjymxsqPage());
      break;
      case '信用卡交易明细查询':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '建行移动门户',
          'image': 'bg_xyksq',
        });
        break;
      case '月度账单':
        Get.toNamed(Routes.yuedzdPage);
        break;
      case '支付账单':
        Get.toNamed(Routes.accountDetail);
        break;
      case '信用卡账单查询':
        Get.toNamed(Routes.fixedNavPage, arguments: {
          'title': '交易明细查询',
          'image': 'xykzdcx',
        });
        break;
      case '信用卡账单分期':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '建行移动门户',
          'image': 'bg_xyksq',
        });
        break;
      case '账单日修改':
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '建行移动门户',
          'image': 'bg_xyksq',
        });
      case '电子印章查验':
      case '印章查验':
        // Get.toNamed(Routes.sealPage);
        Get.toNamed(Routes.sealSelectView);
        break;
      }
  }
}
