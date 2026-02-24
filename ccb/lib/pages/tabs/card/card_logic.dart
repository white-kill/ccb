import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/dio/network.dart';
import '../../../config/net_config/apis.dart';
import '../../../data/model/account_view_model.dart';
import 'card_state.dart';

class CardLogic extends GetxController {
  final CardState state = CardState();


  void accountView() async{
    await Http.get(Apis.accountView,queryParameters: {
      'type':'0'
    }).then((value) {
      if (value is Map<String, dynamic>) {
        state.accountViewModel = AccountViewModel.fromJson(value);
        update(['updateUI']);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    accountView();
  }
}
