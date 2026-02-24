import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'bank_list_logic.dart';
import 'bank_list_model.dart';
import 'bank_list_state.dart';

class BankListPage extends BaseStateless {
  BankListPage({super.key}) : super(title: '收款银行');

  final BankListLogic logic = Get.put(BankListLogic());
  final BankListState state = Get.find<BankListLogic>().state;

  Widget customHeader() {
    return VerticalGridView(
      padding: EdgeInsets.only(left:15.w,right: 15.w,top: 5.w,bottom: 5.w),
      widgetBuilder: (_, index) {
        ContactInfo model = state.hotBankList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NetImageWidget(
              url:model.icon,
              width: 28.w,
              height: 28.w,
            ),
            SizedBox(
              height: 8.w,
            ),

            BaseText(
              text: model.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,),
            ),

          ],
        ).withOnTap(onTap: (){
          Get.back(
              result: {
                'url':model.icon,
                'name':model.name,
                'id':model.id
              }
          );
        });
      },
      itemCount: state.hotBankList.length,
      crossCount: 4,
      mainHeight: 68.w,
      spacing: 5.w,
    ).withContainer(
      color: Colors.white
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (BankListLogic c) {
        return AzListView(
          data: state.contactList,
          itemCount: state.contactList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) return customHeader();
            ContactInfo model = state.contactList[index];
            return getWeChatListItem(context, model);
          },
          susItemHeight: state.susItemHeight.w,
          susItemBuilder: (BuildContext context, int index) {
            ContactInfo model = state.contactList[index];
            if ('热' == model.getSuspensionTag()) {
              return Container();
            }
            return getSusItem(context, model.getSuspensionTag(),
                susHeight: state.susItemHeight);
          },
          indexBarData: SuspensionUtil.getTagIndexList(state.contactList),
          indexBarOptions: IndexBarOptions(
            needRebuild: true,
            selectTextStyle: TextStyle(
                fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w500),
            selectItemDecoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            indexHintWidth: 97.w,
            indexHintHeight: 97.w,
            // indexHintDecoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(Utils.getImgPath('ic_index_bar_bubble_white')),
            //     fit: BoxFit.contain,
            //   ),
            // ),
            indexHintAlignment: Alignment.centerRight,
            indexHintTextStyle:
                TextStyle(fontSize: 24.0.sp, color: Colors.white),
            indexHintOffset: Offset(-30.w, 0),
          ),
        );
      },
      id: 'updateUI',
    );
  }

  Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
    return Container(
      height: susHeight.w,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.w),
      color: const Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: BaseText(
        text: tag,
        softWrap: false,
        fontSize: 14.sp,
        color: const Color(0xFF666666),
      ),
    );
  }

  Widget getWeChatListItem(
    BuildContext context,
    ContactInfo model,) {
    return SizedBox(
      height: 45.w,
      child: Column(
        children: [
          Expanded(child: Row(
            children: [
              NetImageWidget(
                url: model.icon,
                width: 20.w,
                height: 20.w,
              ).withPadding(
                  left: 20.w,
                  right: 10.w
              ),
              BaseText(text: model.name),
            ],
          )),
          Container(
            width: 320.w,
            height: 0.3.w,
            color: const Color(0xffd2d2d2),
          )
        ],
      ),
    ).withOnTap(onTap: (){

      Get.back(
        result: {
          'url':model.icon,
          'name':model.name,
          'id':model.id
        }
      );
    });
  }

}
