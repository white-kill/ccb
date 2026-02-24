import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/text_style_unit.dart';
import 'package:ccb/utils/common_picker_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'widget/setting_item.dart';
import 'widget/setting_text_field.dart';
import 'widget/multi_segment_phone_widget.dart';

class AccountSettingPage extends BaseStateless {

  @override
  Widget? get titleWidget => const Text(
    '客户信息修改',
    style: TextStyle(fontSize: 17, color: Color(0xFF505050), fontWeight: FontWeight.w700, fontFamily: 'PingFangSC',letterSpacing: -1),
  );

  @override
  Widget? get leftItem => IconButton(
        icon:
            Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w),
        onPressed: () => Get.back(),
      );

  @override
  List<Widget>? get rightAction => [
        ScalePointWidget(
          icColor: Colors.black,
        ).withPadding(right: 10.w, left: 10.w),
        IconButton(
          icon: Image.asset('assets/new_images/close.png',
              width: 14.w, height: 14.w),
          onPressed: () => Get.back(),
        ),
        SizedBox(width: 8.w),
      ];

  @override
  Widget initBody(BuildContext context) {
    final logic = Get.put(AccountSettingLogic());
    final state = logic.state;

    return Container(
      color: Color(0xFFEFEFEF),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key: state.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Basic Info (Non-editable) ---
                    const SectionHeader(title: '基本信息'),
                    Container(
                      margin:
                          EdgeInsets.only(left: 16.sp, right: 16.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => SettingItem(
                              label: '客户姓名',
                              content: state.customerName.value,
                              isEditable: false)),
                          Obx(() => SettingItem(
                              label: '证件类型',
                              content: state.idType.value,
                              isEditable: false)),
                          Obx(() => SettingItem(
                              label: '证件号码',
                              content: state.idNumber.value,
                              isEditable: false)),
                          Obx(() => SettingItem(
                              label: '性别',
                              content: state.gender.value,
                              isEditable: false,
                              showDivider: true)),
                          _buildModificationNotice(),
                          Divider(height: 1, indent: 0, endIndent: 0),
                          Obx(() => SettingItem(
                              label: '证件有效期*',
                              content: state.idExpiryDate.value,
                              onTap: logic.editIdExpiryDate,
                              contentTextStyle: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black.withAlpha(170),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PingFangSC'),
                            rightIcon: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 25.sp,
                              height: 25.sp / 156 * 129,
                              child: Image.asset("assets/new_images/mine/children/card_icon.png"),
                            ),
                              )),
                          Obx(() => SettingItem(
                              label: '手机号码*',
                              content: state.mobileNumber.value,
                              onTap: logic.editMobileNumber)),
                          Obx(() => SettingItem(
                              label: '国家/地区*',
                              content: state.country.value,
                              onTap: logic.selectCountry)),
                          Obx(() => SettingItem(
                              label: '学历',
                              content: state.education.value,
                              onTap: logic.selectEducation)),
                          Obx(() => SettingItem(
                              label: '婚姻状况',
                              content: state.maritalStatus.value,
                              onTap: logic.selectMaritalStatus,
                              showDivider: false)),
                        ],
                      ),
                    ),
                    // --- Basic Info (Editable Pickers) ---
                    // --- Address Info ---
                    const SectionHeader(title: '常住地址信息'),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 16.sp, right: 16.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SettingTextField(
                              label: '住宅地址*',
                              controller: state.residentialAddressController,
                              validator: logic.validateNotEmpty,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                              textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black.withAlpha(170),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PingFangSC'),
                            ),
                            SettingTextField(
                              label: '住宅地址邮编',
                              controller: state.residentialPostCodeController,
                              keyboardType: TextInputType.number,
                              validator: logic.validatePostCode,
                            ),
                            MultiSegmentPhoneWidget.twoSegment(
                              label: '住宅电话',
                              areaController: state.residentialPhoneAreaController,
                              numberController: state.residentialPhoneNumberController,
                              areaHint: '区号',
                              numberHint: '电话号码',
                              validator: logic.validateTwoSegmentPhone,
                            ),
                            SettingTextField(
                              label: '住宅性质',
                              controller: state.residentialTypeController,
                              showDivider: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // --- Work Info ---
                    const SectionHeader(title: '工作信息'),
                    Container(
                      margin:
                          EdgeInsets.only(left: 16.sp, right: 16.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Obx(() => SettingItem(
                              label: '职业*',
                              content: state.occupation.value,
                              onTap: logic.selectOccupation)),
                          SettingTextField(
                              label: '单位名称',
                              controller: state.companyNameController,
                              validator: logic.validateNotEmpty),
                          SettingTextField(
                              label: '单位地址',
                              controller: state.companyAddressController,
                              validator: logic.validateNotEmpty),
                          SettingTextField(
                              label: '单位地址邮编',
                              controller: state.companyPostCodeController,
                              keyboardType: TextInputType.number,
                              validator: logic.validatePostCode),
                          MultiSegmentPhoneWidget.threeSegment(
                              label: '单位电话',
                              firstController: state.companyPhoneFirstController,
                              secondController: state.companyPhoneSecondController,
                              thirdController: state.companyPhoneThirdController,
                              firstHint: '区号',
                              secondHint: '电话号码',
                              thirdHint: '分机号',
                              showDivider: false,
                              validator: logic.validateThreeSegmentPhone),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    SafeArea(
                      bottom: true,
                      child: Obx(() {
                        return InkWell(
                          onTap: () async {
                            "更新中...".showLoading;
                            await logic.saveValue();
                            await SmartDialog.dismiss(status: SmartStatus.loading);
                          },
                          child:
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 20),
                            child:
                            logic.isButtonEnabled.value ?
                            Image.asset('assets/new_images/mine/info_update_enable.png', width: screenWidth - 32.sp, fit: BoxFit.fitWidth,) :
                            Image.asset('assets/new_images/mine/info_update_unenable.png', width: screenWidth - 32.sp, fit: BoxFit.fitWidth,)
                          )


                          // Container(
                          //   alignment: Alignment.center,
                          //   height: 40,
                          //   margin: EdgeInsets.only(
                          //     left: 16.w,
                          //     right: 16.w,
                          //     bottom: MediaQuery.of(context).padding.bottom + 16.h,
                          //     top: 16.h,
                          //   ),
                          //   decoration: BoxDecoration(
                          //       color: logic.isButtonEnabled.value
                          //           ? Color(0xFF1460DA)
                          //           : Colors.grey,
                          //       borderRadius: BorderRadius.circular(4)),
                          //   child: Text(
                          //     '立即更新',
                          //     style: TextStyle(
                          //       fontSize: 16.sp,
                          //       fontWeight: FontWeight.w500,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModificationNotice() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '如需修改以上信息请您携带相关有效证件前往建行\n',
                  style:
                      TextStyleUnit.caption.copyWith(color: Color(0xFFABABAB)),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () {
                    Get.toNamed(Routes.wdcx);
                  },
                  text: '网点预约',
                  style: TextStyleUnit.caption.copyWith(
                    color: Color(0xFF3B4FA3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
