import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'khinfo_logic.dart';
import 'khinfo_state.dart';

class KhinfoPage extends BaseStateless {
  // 直接在构造函数中传递 key 给父类，解决 key 参数问题
  KhinfoPage({Key? key}) : super(key: key);

  final KhinfoLogic logic = Get.put(KhinfoLogic());
  final KhinfoState state = Get.find<KhinfoLogic>().state;

  @override
  Widget? get titleWidget => const Text(
        '账户信息修改',
        style: TextStyle(fontSize: 18, color: Colors.white),
      );

  @override
  Color? get navColor => Colors.blue;

  @override
  double? get lefItemWidth => 30.w;

  @override
  // TODO: implement leftItem
  Widget? get leftItem => Image(
        image: ('login_back').png3x,
        color: Colors.white,
        width: 20.w,
        height: 20.w,
      ).withOnTap(onTap: () {
        Get.back();
      });

  @override
  Widget initBody(BuildContext context) {
    // 监听状态变化，当状态更新时自动重建 UI
    return Obx(() {
      return ListView.builder(
        itemCount: state.items.length, // 添加 itemCount 参数，避免潜在错误
        itemBuilder: (context, index) {
          return GetBuilder(builder: (KhinfoLogic c){
            return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.items[index].title ?? '',
                            style: TextStyle(fontSize: 15.sp),
                          ).withContainer(
                            width: 120.w,
                          ),
                          Expanded(
                            child: state.items[index].showTextField == true
                                ? TextFieldWidget(
                              hintText: state.items[index].data != null
                                  ?state.items[index].data ?? '': state.items[index].centerContent ?? '',
                              onChanged: (v) {
                                logic.setContent(index, v);
                              },
                              hintStyle: TextStyle(
                                color:  state.items[index].data != null
                                    ? Colors.black
                                    :state.items[index].darkColor
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            )
                                : Text(
                                  state.items[index].data != null
                                  ?state.items[index].data ?? '': state.items[index].centerContent ?? '',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color:  state.items[index].data != null
                                    ? Colors.black
                                    : state.items[index].darkColor
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          state.items[index].showrightImage
                              ? const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xFFCCCCCC),
                          )
                              : const SizedBox(),
                        ],
                      ),
                      subtitle: null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16), // 设置左右边距为 16，可按需调整
                      child: const Divider(
                        height: 0.5, // 设置分割线的高度
                        thickness: 0.5, // 设置分割线的粗细
                        color: Color(0xFFCCCCCC), // 设置分割线的颜色
                      ),
                    ),
                  ],
                ));
          },id: 'updateUI',);
        },
      );
    });
  }
}
