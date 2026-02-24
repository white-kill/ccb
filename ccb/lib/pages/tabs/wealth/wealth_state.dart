import '../../../data/model/account_view_model.dart';

class WealthState {
   AccountViewModel accountViewModel = AccountViewModel();
  WealthState() {
    ///Initialize variables
  }


   final List<Map<String, String>> gridItems = [
     {'image': 'assets/new_images/cai_fu/ckcp.png', 'label': '存款产品'},
     {'image': 'assets/new_images/cai_fu/lccp.png', 'label': '理财产品'},
     {'image': 'assets/new_images/cai_fu/jjtz.png', 'label': '基金投资'},
     {'image': 'assets/new_images/cai_fu/bx.png', 'label': '保险'},
     {'image': 'assets/new_images/cai_fu/gjs.png', 'label': '贵金属'},
     {'image': 'assets/new_images/cai_fu/jhyx.png', 'label': '建行严选'},
     {'image': 'assets/new_images/cai_fu/lqb1.png', 'label': '龙钱宝1号'},
     {'image': 'assets/new_images/cai_fu/lqb2.png', 'label': '龙钱宝2号'},
     {'image': 'assets/new_images/cai_fu/sy.png', 'label': '速盈'},
     {'image': 'assets/new_images/cai_fu/gd.png', 'label': '更多'},
   ];



}
