import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../utils/sp_util.dart';
import '../turnover_print_logic.dart';
import '../turnover_print_state.dart';

class AddEmail extends StatefulWidget {
  final Function callBack;
  const AddEmail({super.key, required this.callBack});

  @override
  State<AddEmail> createState() => _AddEmailState();
}

class _AddEmailState extends State<AddEmail> {
  bool isAdd = false;
  bool agree = false;

  final TurnoverPrintLogic logic = Get.put(TurnoverPrintLogic());
  final TurnoverPrintState state = Get.find<TurnoverPrintLogic>().state;

  String email = '';

  List<Object> emailList = [];


  int idx = -1;

  bool ck = false;

  @override
  void initState() {
    super.initState();
    emailList = spEmailList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh * 0.68,
      child: Column(
        children: [
          Expanded(
              child: Container(
                color: const Color(0xFFF7F7F7),
                alignment: isAdd ? Alignment.topCenter : Alignment.center,
                child: isAdd ? _addEmailWidget() : _emailWidget(),
              )),
          Container(
            color: Colors.white,
            width: 1.sw,
            height: isAdd ? 350.w:62.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 350.w,
                  height: 42.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff3768CB), Color(0xff6FACF9)], // 渐变色列表
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(6.w)),
                  ),
                  margin: EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 10.w),
                  child: BaseText(
                    text: isAdd ? '保存' : "新増邮箱",
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ).withOnTap(onTap: () {
                  if (isAdd) {
                    if (!RegexUtil.isEmail(email)) {
                      '请填写正确的邮箱'.showToast;
                      return;
                    }
                    if(agree){
                      emailList.forEach((e){
                        (e as Map)['def'] = false;
                      });
                    }
                    if(idx != -1){
                      emailList.forEach((e){
                        if(emailList.indexOf(e) == idx){
                          (e as Map)['def'] = agree;
                          (e as Map)['email'] = email;
                        }
                      });
                    }else{
                      emailList.insert(0, {
                        'email': email,
                        'def': agree,
                      });
                    }
                    emailList.saveEmailList;
                    isAdd = false;
                    agree = false;
                    state.item5TextController.text = '';
                    idx = -1;
                    setState(() {});
                  } else {
                    isAdd = true;
                  }
                  setState(() {});
                }),
              ]
            )
          )
        ],
      ),
    );
  }

  Widget _emailWidget() {
    if (emailList.isEmpty) {
      return const BaseText(
        text: '暂无电子邮箱信息',
        color: Color(0xff666666),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12.w,
        ),
        BaseText(
          text: '温馨提示:',
          fontSize: 12.sp,
          color: const Color(0xff333333),
        ),
        SizedBox(
          height: 5.w,
        ),
        Row(
          children: [
            BaseText(
              text: '如需查看完整信息，请点击:',
              fontSize: 12.sp,
              color: const Color(0xff333333),
            ),
            BaseText(
              text: '查看>',
              fontSize: 12.sp,
              color: const Color(0xff283CB1),
            ).withOnTap(onTap: (){
              ck = true;
              setState(() {});
            }),
          ],
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 75.w,
              width: 1.sw,
              margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 12.w),
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4.w)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text:ck?(emailList[index] as Map)['email'] as String:obscureEmail(
                        (emailList[index] as Map)['email'] as String),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _rowWidget(
                          icon: (emailList[index] as Map)['def']
                              ? Icon(Icons.check_circle,
                                  size: 17.w, color: const Color(0xff283CB1))
                              : Image(
                                  image: 'check1'.png,
                                  width: 17.w,
                                  height: 17.w,
                                  color: Color(0xffA2A2A2),
                                ),
                          name: '默认邮箱'),
                      Row(
                        children: [
                          _rowWidget(
                              icon: Image(
                                image: 'embj'.png,
                                width: 14.w,
                                height: 14.w,
                              ),
                              name: '修改').withOnTap(onTap: (){
                                isAdd = true;
                                idx = index;
                                agree = (emailList[index] as Map)['def'];
                                state.item5TextController.text = (emailList[index] as Map)['email'];
                                setState(() {});
                          }),
                          SizedBox(
                            width: 12.w,
                          ),
                          _rowWidget(
                              icon: Image(
                                image: 'emsc'.png,
                                width: 14.w,
                                height: 14.w,
                              ),
                              name: '删除').withOnTap(onTap: (){
                                emailList.removeAt(index);
                                emailList.saveEmailList;
                                setState(() {});
                          }),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ).withOnTap(onTap: (){
              widget.callBack((emailList[index] as Map)['email']);
            });
          },
          itemCount: emailList.length,
          shrinkWrap: true,
        ))
      ],
    ).withContainer(
        color: const Color(0xFFF7F7F7),
        padding: EdgeInsets.only(left: 12.w, right: 12.w));
  }

  Widget _rowWidget({
    required Widget icon,
    required String name,
  }) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 6.w,
        ),
        BaseText(text: name)
      ],
    );
  }

  Widget _addEmailWidget() {
    return Container(
      height: 105.w,
      width: 1.sw,
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 12.w),
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, bottom: 12.w, top: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.w)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                text: '邮箱信息',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              _rowWidget(
                  icon: (agree
                          ? Icon(Icons.check_circle,
                              size: 17.w, color: const Color(0xff283CB1))
                          : Image(
                              image: 'check1'.png,
                              width: 17.w,
                              height: 17.w,
                              color: Color(0xffA2A2A2),
                            ))
                      .withOnTap(onTap: () {
                    agree = !agree;
                    setState(() {});
                  }),
                  name: '设为默认邮箱'),
            ],
          ),
          SizedBox(
            height: 6.w,
          ),
          Row(
            children: [
              BaseText(text: '电子邮箱').withContainer(width: 110.w),
              TextFieldWidget(
                hintText: '请输入电子邮箱',
                controller: state.item5TextController,
                onChanged: (v) {
                  email = v;
                },
              ).withContainer(width: 200.w),
            ],
          ),
          Container(
            width: 1.sw,
            height: 0.5.w,
            color: const Color(0xffdedede),
          ),
        ],
      ),
    );
  }

  String obscureEmail(String email) {
    if (!email.contains('@')) return email;

    List<String> parts = email.split('@');
    String username = parts[0];
    String domain = parts[1];

    if (username.length <= 2) {
      return '${username.substring(0, 1)}***@$domain';
    } else {
      return '${username.substring(0, 3)}***@$domain';
    }
  }
}
