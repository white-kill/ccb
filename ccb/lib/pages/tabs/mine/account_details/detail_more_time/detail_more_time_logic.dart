import 'package:get/get.dart';

import '../../../../../config/dio/network.dart';
import '../../../../../config/net_config/apis.dart';
import '../../../../../data/model/bill_list_model.dart';
import 'detail_more_time_state.dart';

class DetailMoreTimeLogic extends GetxController {
  final DetailMoreTimeState state = DetailMoreTimeState();


  @override
  void onInit() {
    super.onInit();
    getListData(isJump:false);
  }

  String typeValue(String name){
    if(name == '收入'){
      return '1';
    }
    if(name == '支出'){
      return '2';
    }
    return '';
  }

  void getListData({bool isRef = true,bool isJump = true}){
    if(isRef){
      state.reqData1.endPageTime = '';
      state.reqData1.pageNum = 1;
    }
    state.reqData1.beginTime = state.getMonthStartEnd().first;
    state.reqData1.endTime = state.getMonthStartEnd().last;
    state.reqData1.orderSort = state.orderSort;
    state.reqData1.type = typeValue(state.type);
    state.reqData1.transactionType = state.transactionType;
    state.reqData1.transactionMethod = state.transactionMethod;
    state.reqData1.maxAmount = state.controller2.text;
    state.reqData1.minAmount = state.controller1.text;
    Map<String, dynamic> data = state.reqData1.toJson();
    print(data);
    Http.get(Apis.billPage,queryParameters: data).then((value){
      if((value is! Map<String, dynamic>)) return;
      BillListModel model = BillListModel.fromJson(value);
      if(model.list.isNotEmpty){
        state.reqData1.endPageTime  = model.list.first.day;
      }
      if(isRef){
        state.list = model.list;
        state.refreshController.refreshCompleted();
        state.refreshController.loadComplete();
      }else{
        if(model.list.isEmpty){
          state.refreshController.loadNoData();
        }else {
          state.refreshController.loadComplete();
        }
        state.list = state.list + model.list;
      }
      state.incomeTotal = model.incomeTotal;
      state.expensesTotal = model.expensesTotal;
      update(['updateUI']);
      Future.delayed(const Duration(milliseconds: 200),(){
        if(isRef && isJump && model.list.isNotEmpty){state.controller.jumpTo(0);}
      });
    });
  }


  String checkCurrentMonth(String dateStr) {
    try {
      final parts = dateStr.split('.');
      if (parts.length != 2) return "Invalid date format";

      final year = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1]);
      if (year == null || month == null || month < 1 || month > 12) {
        return "Invalid date format";
      }

      final now = DateTime.now();
      if (now.year == year && now.month == month) {
        return "本月";
      } else {
        return dateStr;
      }
    } catch (e) {
      return "Invalid date format";
    }
  }

  void sure(){

    state.beginTime1 = state.temBeginTime1;
    state.selectBeginList1.clear();
    state.selectBeginList1.addAll(state. temSelectBeginList1);

    state.endTime1 =  state.temEndTime1;
    state.selectEndList1.clear();
    state.selectEndList1.addAll(state.temSelectEndList1);

    state.monthTime1 = state.temMonthTime1;
    state.selectMonthList1.clear();
    state.selectMonthList1.addAll(state.temSelectMonthList1);


    state.temBeginTime1 = '';
    state. temSelectBeginList1.clear();

    state.temEndTime1 = '';
    state.temSelectEndList1.clear();

    state.temMonthTime1 = '';
    state.temSelectMonthList1.clear();

    getListData();
    update(['updateTime']);
  }

  void restData(){

    state.temBeginTime1 = '';
    state. temSelectBeginList1.clear();

    state.temEndTime1 = '';
    state.temSelectEndList1.clear();

    state.temMonthTime1 = '';
    state.temSelectMonthList1.clear();


    state.beginTime1 ='';
    state.selectBeginList1.clear();

    state.endTime1 =  '';
    state.selectEndList1.clear();

    state.monthTime1 = '';
    state.selectMonthList1.clear();

    state.restData();

    state.isDay = true;
    state.isSelectB = true;

    getListData();
    update(['updateTime']);
  }
}
