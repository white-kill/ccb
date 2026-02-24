import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../../routes/app_pages.dart';
import 'login_state.dart';

class LoginLogic extends GetxController {
  var navActionColor = Colors.white.obs;
  final LoginState state = LoginState();

  void goLogin() {

    if (state.phoneTextController.text == '') {
      '请输入账号'.showToast;
      return;
    }

    if (state.psdTextController.text == '') {
      '请输入密码'.showToast;
      return;
    }
    Http.post(Apis.login, data: {
      "username": state.phoneTextController.text,
      "password": state.psdTextController.text
    }).then((value) {
      if (value != null && value['access_token'] != '') {
        'Bearer ${value['access_token']}'.saveToken;
        Http.setHeaders({'Authorization':token});
        AppConfig.config.balanceLogic
            .memberInfoData()
            .then((v) => Get.offAllNamed(Routes.tabs));
      }
    });
  }
}
