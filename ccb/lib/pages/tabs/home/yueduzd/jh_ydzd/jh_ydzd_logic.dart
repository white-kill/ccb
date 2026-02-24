import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/data/model/month_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'jh_ydzd_state.dart';

class Jh_ydzdLogic extends GetxController {
  final Jh_ydzdState state = Jh_ydzdState();

  void changeSelected1(bool valuee) {
    state.isSelected1.value = valuee;
    update();
  }

  void changeSelected2(bool valuee) {
    state.isSelected2.value = valuee;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    print(Get.arguments['dateTime']);
    
    Http.get(Apis.monthBill,queryParameters: {
      'dateTime':Get.arguments['dateTime'],
    }).then((v){
      if(v != null){
        state.billModel = MonthBillModel.fromJson(v);

         state.chartData1 = state.billModel.income?.trend!.map((data){
          return ChartData(data.day, data.amount);
        }).toList() ??[];

        state.data1 = state.billModel.income?.category!.chartList.map((data){
          int index = state.billModel.income?.category!.chartList.indexOf(data)??0;
          return SalesData(data.name, data.amount, (index+1)%2 == 0?Colors.red:Colors.orange);
        }).toList() ??[];


        state.chartData2 = state.billModel.expenses?.trend!.map((data){
          return ChartData(data.day, data.amount);
        }).toList() ??[];

        state.data2 = state.billModel.expenses?.category!.chartList.map((data){

          int index = state.billModel.expenses?.category!.chartList.indexOf(data)??0;
          return SalesData(data.name, data.amount, (index+1)%2 == 0?Colors.red:Colors.orange);
        }).toList() ??[];
      }

      update(['updateUI']);
    });
  }

}
