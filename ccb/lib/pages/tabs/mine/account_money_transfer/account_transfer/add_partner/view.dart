import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class AddPartnerPage extends BaseStateless {
  AddPartnerPage({Key? key}) : super(key: key, title: "新增收款人");

  final AddPartnerLogic logic = Get.put(AddPartnerLogic());
  final AddPartnerState state = Get.find<AddPartnerLogic>().state;
  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  List<Widget>? get rightAction => [
    // // 调试按钮：查看已保存的收款人
    // GestureDetector(
    //   onTap: () {
    //     logic.debugShowPayeeList();
    //   },
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
    //     child: Icon(
    //       Icons.list,
    //       color: Colors.white,
    //       size: 24.w,
    //     ),
    //   ),
    // ),
    ScalePointWidget(
      icColor: Colors.white,
    ).withPadding(right: 10.w, left: 10.w),
    SizedBox(width: 8.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder<AddPartnerLogic>(builder: (logic) {
      return Container(
        color: const Color(0xffF5F7FA),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      // 收款户名
                      _buildListItem(
                        title: "收款户名",
                        hint: "请输入收款户名",
                        controller: state.nameController,
                        showDivider: true,
                        suffixIcon: Container(
                          width: 24.w,
                          height: 24.w,
                          margin: EdgeInsets.only(left: 8.w),
                          child: Image(image: 'add_contract_book'.png),
                        ),
                        onChanged: (value) {
                          logic.update(); // 确保按钮状态更新
                        },
                      ),
                      
                      // 收款账号
                      _buildListItem(
                        title: "收款账号",
                        hint: "请输入收款账号或手机号",
                        controller: state.accountController,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // TODO: 扫描功能
                          },
                          child: Container(
                            width: 24.w,
                            height: 24.w,
                            margin: EdgeInsets.only(left: 8.w),
                            child: Image(image: 'add_contract_camera'.png),
                          ),
                        ),
                        showDivider: true,
                        onChanged: (value) {
                          logic.update(); // 确保按钮状态更新
                        },
                      ),

                      // 收款银行
                      _buildSelectListItem(
                        title: "收款银行",
                        hint: "请选择收款银行",
                        value: state.selectedBank?["name"],
                        onTap: () async {
                          state.selectedBank = await Get.toNamed(Routes.bankListPage) as Map?;
                          logic.update(); // 选择银行后更新UI
                        },
                        showDivider: logic.shouldShowBranch, // 如果要显示网点，就不显示分隔线
                      ),
                      // 收款银行
                      // _buildListItem(
                      //   title: "收款银行",
                      //   hint: "请选择收款银行",
                      //   controller: state.bankController,
                      //   showDivider: logic.shouldShowBranch, // 如果要显示网点，就不显示分隔线
                      //   onChanged: (value) {
                      //     logic.update(); // 确保UI更新
                      //   },
                      // ),
                      
                      // 收款网点 - 动态显示
                      if (logic.shouldShowBranch)
                        _buildListItem(
                          title: "收款网点",
                          hint: "输入收款网点（选填）",
                          controller: state.branchController,
                          showDivider: true,
                        ),
                      
                      // 短信通知手机号
                      _buildListItem(
                        title: "短信通知手机号",
                        hint: "选填",
                        controller: state.phoneController,
                        showDivider: true,
                      ),
                      
                      // 别名
                      _buildListItem(
                        title: "别名",
                        hint: "选填",
                        controller: state.aliasController,
                        showDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // 底部确定按钮
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.w),
              child: GestureDetector(
                onTap: logic.isFormValid ? () {
                  logic.onConfirm();
                } : null,
                child: Container(
                  width: double.infinity,
                  child: Image(
                    image: logic.isFormValid 
                        ? 'add_contract_enable'.png 
                        : 'add_contract_unable'.png,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
  
  // 构建列表输入框组件
  Widget _buildListItem({
    required String title,
    required String hint,
    IconData? icon,
    Color? iconColor,
    TextEditingController? controller,
    Widget? suffixIcon,
    bool showDivider = true,
    Function(String)? onChanged,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: [
              // 标题
              SizedBox(
                width: 130.w,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              
              // 输入框
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onChanged: onChanged,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey[400],
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    
                    // 右侧图标
                    if (icon != null)
                      Container(
                        width: 20.w,
                        height: 20.w,
                        margin: EdgeInsets.only(left: 8.w),
                        decoration: BoxDecoration(
                          color: iconColor?.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        child: Icon(
                          icon,
                          size: 14.w,
                          color: iconColor,
                        ),
                      ),
                    
                    if (suffixIcon != null) suffixIcon,
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // 分隔线
        if (showDivider)
          Container(
            margin: EdgeInsets.only(left: 16.w),
            height: 0.5.h,
            color: Colors.grey[200],
          ),
      ],
    );
  }
  
  // 构建列表选择框组件
  Widget _buildSelectListItem({
    required String title,
    required String hint,
    String? value,
    VoidCallback? onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                // 标题
                SizedBox(
                  width: 130.w,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                
                // 内容
                Expanded(
                  child: Text(
                    value ?? hint,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: value != null ? Colors.black87 : Colors.grey[400],
                    ),
                  ),
                ),
                
                // 右箭头
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey[400],
                  size: 20.w,
                ),
              ],
            ),
          ),
        ),
        
        // 分隔线
        if (showDivider)
          Container(
            margin: EdgeInsets.only(left: 16.w),
            height: 0.5.h,
            color: Colors.grey[200],
          ),
      ],
    );
  }
}
