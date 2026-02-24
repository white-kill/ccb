import 'package:ccb/utils/text_style_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MultiSegmentPhoneWidget extends StatelessWidget {
  final String label;
  final List<TextEditingController> controllers;
  final List<int> maxLengths;
  final List<String> hints;
  final bool showDivider;
  final FormFieldValidator<String>? validator;

  const MultiSegmentPhoneWidget({
    super.key,
    required this.label,
    required this.controllers,
    required this.maxLengths,
    required this.hints,
    this.showDivider = true,
    this.validator,
  }) : assert(controllers.length == maxLengths.length && controllers.length == hints.length,
             '控制器、最大长度和提示文本的数量必须一致');

  // 便捷构造函数 - 两段式住宅电话
  factory MultiSegmentPhoneWidget.twoSegment({
    required String label,
    required TextEditingController areaController,
    required TextEditingController numberController,
    bool showDivider = true,
    FormFieldValidator<String>? validator,
    String areaHint = '区号',
    String numberHint = '电话号码',
  }) {
    return MultiSegmentPhoneWidget(
      label: label,
      controllers: [areaController, numberController],
      maxLengths: const [4, 8],
      hints: [areaHint, numberHint],
      showDivider: showDivider,
      validator: validator,
    );
  }

  // 便捷构造函数 - 三段式单位电话
  factory MultiSegmentPhoneWidget.threeSegment({
    required String label,
    required TextEditingController firstController,
    required TextEditingController secondController,
    required TextEditingController thirdController,
    bool showDivider = true,
    FormFieldValidator<String>? validator,
    String firstHint = '****',
    String secondHint = '****385',
    String thirdHint = '分机号',
  }) {
    return MultiSegmentPhoneWidget(
      label: label,
      controllers: [firstController, secondController, thirdController],
      maxLengths: const [4, 8, 6],
      hints: [firstHint, secondHint, thirdHint],
      showDivider: showDivider,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyleUnit.bodyMedium.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: 56.h,
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(label, style: TextStyleUnit.bodyLarge),
                SizedBox(width: 24.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: _buildInputFields(context, textStyle),
                  ),
                ),
              ],
            ),
          ),
          if (showDivider) const Divider(height: 1, indent: 0, endIndent: 0),
        ],
      ),
    );
  }

  List<Widget> _buildInputFields(BuildContext context, TextStyle textStyle) {
    final List<Widget> widgets = [];
    
    for (int i = 0; i < controllers.length; i++) {
      // 添加输入框
      widgets.add(
        Container(
          width: _getWidthForLength(maxLengths[i]),
          child: TextFormField(
            controller: controllers[i],
            textAlign: TextAlign.center,
            maxLength: maxLengths[i],
            decoration: InputDecoration(
              hintText: hints[i],
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              isDense: true,
              // contentPadding: EdgeInsets.symmetric(
              //   horizontal: 4.w,
              //   vertical: 8.h
              // ),
              hintStyle: TextStyleUnit.bodyMedium.copyWith(
                color: Colors.grey,
                fontSize: 13.sp,
                fontFamily: 'PingFangSC'
              ),
              counterText: '', // 隐藏字符计数器
            ),
            style: textStyle.copyWith(fontSize: 15.sp, fontFamily: 'PingFangSC'),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(maxLengths[i]),
            ],
            validator: validator,
            onChanged: (value) {
              // 当输入达到最大长度时自动跳转到下一个输入框
              if (value.length == maxLengths[i] && i < controllers.length - 1) {
                FocusScope.of(context).nextFocus();
              }
              // 当删除到空且不是第一个输入框时，跳转到前一个输入框
              else if (value.isEmpty && i > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        ),
      );
      
      // 如果不是最后一个输入框，添加分隔符
      if (i < controllers.length - 1) {
        widgets.add(Text('-', style: textStyle));
      }
    }
    
    return widgets;
  }

  // 根据数字长度返回合适的输入框宽度
  double _getWidthForLength(int length) {
    // 根据不同长度返回合适的宽度
    return (length) * 10.sp;
    switch (length) {
      case 4: return 50.w;  // 4位区号
      case 6: return 65.w;  // 6位分机号
      case 8: return 80.w;  // 8位电话号码
      default: return (length * 10.0 + 10.0).w;
    }
  }


} 