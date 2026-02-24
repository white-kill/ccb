import 'package:azlistview/azlistview.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/data/model/member_info_entity.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/add_partner/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../bank_list/bank_list_model.dart';
import 'contants_list_logic.dart';
import 'contants_list_state.dart';

class ContactsListPage extends BaseStateless {
  ContactsListPage({Key? key}) : super(key: key, title: '收款人名册');

  final ContactsListLogic logic = Get.put(ContactsListLogic());
  final ContactsListState state = Get.find<ContactsListLogic>().state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (ContactsListLogic c) {
        return Stack(
          children: [
            Image(
              image: 'add_contract_bg'.png,
              fit: BoxFit.fitWidth,
            ),
            Container(
              margin: EdgeInsets.only(top: 120.w),
              child: AzListView(
                data: logic.contactList,
                itemCount: logic.contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) return _buildHeader();
                  ContactInfo model = logic.contactList[index];
                  return _buildListItem(model);
                },
                susItemHeight: 40.w,
                susItemBuilder: (BuildContext context, int index) {
                  ContactInfo model = logic.contactList[index];
                  if ('我' == model.getSuspensionTag()) {
                    return Container();
                  }
                  return getSusItem(context, model.getSuspensionTag(),
                      susHeight: 40.w);
                },
                indexBarData: SuspensionUtil.getTagIndexList(logic.contactList),
                indexBarOptions: const IndexBarOptions(
                  needRebuild: true,
                  selectTextStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  selectItemDecoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blueAccent),
                  indexHintWidth: 97,
                  indexHintHeight: 97,
                  indexHintAlignment: Alignment.centerRight,
                  indexHintTextStyle:
                      TextStyle(fontSize: 24.0, color: Colors.black87),
                  indexHintOffset: Offset(-30, 0),
                ),
              ),
            ),
            Positioned(
                top: 60.w,
                left: 0,
                child: Container(
                  width: 1.sw,
                  height: 40.w,
                ).withOnTap(onTap: () {
                  Get.to(AddPartnerPage());
                }))
          ],
        );
      },
      id: 'updateUI',
    );
  }

  Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 16.w, top: 12),
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            MemberInfoBankList model = state.infoModel.bankList[index];
            return Row(
              children: [
                Image(
                  image: 'ic_jsyh'.png3x,
                  width: 18.w,
                  height: 18.w,
                ).withPadding(right: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: model.realName,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Row(
                      children: [
                        BaseText(
                          text: model.bankName,
                          fontSize: 13.sp,
                          color: const Color(0xff666666),
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xff666666),
                              height: 1.0),
                          strutStyle: StrutStyle(fontSize: 13.sp, height: 1.0),
                        ),
                        BaseText(
                          text: '（${model.bankCard.maskBankCardNumber()}）',
                          fontSize: 13.sp,
                          color: Color(0xff666666),
                        )
                      ],
                    )
                  ],
                )
              ],
            ).withContainer(
                constraints: BoxConstraints(
                  minHeight: 55.w,
                ),
                padding: EdgeInsets.all(12.w));
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 1.sw,
              height: 0.5.w,
              color: const Color(0xffdedede),
            );
          },
          itemCount: state.infoModel.bankList.length),
    );
  }

  Widget _buildListItem(ContactInfo model) {
    return Row(
      children: [
        NetImageWidget(
          url: model.icon,
          width: 32.w,
          height: 32.w,
        ).withPadding(right: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: model.name,
              fontSize: 16.sp,
            ),
            SizedBox(
              height: 4.w,
            ),
            Row(
              children: [
                BaseText(
                  text: model.bankName,
                  fontSize: 13.sp,
                  color: const Color(0xff666666),
                ),
                BaseText(
                  text: '（${model.bankCard.maskBankCardNumber()}）',
                  fontSize: 13.sp,
                  color: Color(0xff666666),
                )
              ],
            )
          ],
        )
      ],
    )
        .withContainer(
            constraints: BoxConstraints(
              minHeight: 55.w,
            ),
            padding: EdgeInsets.all(12.w))
        .withOnTap(onTap: () {
      Get.back(result: {
        'bank': {'url': model.icon, 'name': model.bankName, 'id': model.bankId},
        'name': model.name,
        'bankCard': model.bankCard,
      });
    });
  }
}
