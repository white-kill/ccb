import 'package:get/get.dart';

import '../../../../../../data/model/flow_deatil_model.dart';
import 'print_progress_info_state.dart';

class Print_progress_infoLogic extends GetxController {
  final Print_progress_infoState state = Print_progress_infoState();

  FlowDeatilModel model = FlowDeatilModel();


  @override
  void onInit() {
    super.onInit();

    model = Get.arguments['model']??FlowDeatilModel();
  }

  String typeName(String statue) {
    if (statue == '0') {
      return '处理中';
    }
    if (statue == '1') {
      return '已寄出';
    }
    if (statue == '2') {
      return '已完成';
    }
    return '';
  }

  String valueStr(String name){
    if(name == '业务类型'){return model.busType;}
    if(name == '当前状态'){return typeName(model.status);}
    if(name == '提交时间'){return model.createTime;}
    if(name == '办理渠道'){return model.channel;}
    if(name == '申请账户'){return model.bankCard;}
    if(name == '币种'){return model.currency;}
    if(name == '明细类型'){return model.detailType;}
    if(name == '查询时段'){return '${model.beginTime}-${model.endTime}';}
    if(name == '交易金额区间'){return model.amountRange;}
    if(name == '获取方式'){return model.method;}
    if(name == '接收邮箱'){return model.email;}
    if(name == '解压密码'){return model.code;}

    return '';
  }
}
