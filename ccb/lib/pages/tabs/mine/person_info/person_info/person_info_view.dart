import 'package:ccb/config/app_config.dart';
import 'package:ccb/pages/tabs/mine/person_info/person_info/person_info_logic.dart';
import 'package:ccb/pages/tabs/mine/person_info/person_info/person_info_state.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class Person_infoPage extends BaseStateless {
  Person_infoPage({Key? key}) : super(key: key);

  final Person_infoLogic logic = Get.put(Person_infoLogic());
  final Person_infoState state = Get.find<Person_infoLogic>().state;

  @override
  Widget? get titleWidget => const Text(
        '个人信息',
        style: TextStyle(fontSize: 18, color: Colors.black),
      );

  @override
  Widget initBody(BuildContext context) {
    return Obx(() => _buildGroupedListView(context));
  }
  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 允许弹窗高度超过屏幕一半
      shape: const RoundedRectangleBorder( // 顶部圆角
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // 适配键盘弹出
        ),
        child:
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
          height: 170.w,
          child: Column(
            children: [
              // 弹窗标题
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 16.w,),
                      Icon(Icons.clear),
                    ],
                  )
                )
              ),
              // 可滚动内容
              Expanded(
                child: ListView.separated(
                  itemCount: state.bomttomSheets.length,
                  separatorBuilder: (_, __) => const Divider(height: 0.5),
                  itemBuilder: (context, index) => Center(
                    child: Padding(padding: index == 0?EdgeInsets.only(bottom: 10.w): EdgeInsets.only(top: 10.w,bottom: 10.w),
                      child: Text(
                        state.bomttomSheets[index],
                        style: const TextStyle(fontSize: 16),
                      ),)
                  )
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
  Widget _buildGroupedListView(BuildContext context) {
    // 示例分组数据，根据实际数据结构调整
    final sections = [
      _buildSection(state.items.sublist(0, 3)),
      _buildSection(state.items.sublist(3, 6)),
      // _buildSection(state.items.sublist(6)),
    ];

    return Column(
      children: [
        SizedBox(height: 16.w),
    GestureDetector(
    onTap: () {
    _showCustomBottomSheet(context);
    },
    child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          width: 1.sw - 32.w,
          height: 69.w,
          child:  Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 14.w)),
                Image(image: 'ic_ccb_sex${logic.sex}'.png3x,width: 43.w,height: 43.w,),
                Padding(padding: EdgeInsets.only(left: 16.w)),
                Row(
                  children: [
                    BaseText(text: '*',fontSize: 16.sp,).withPadding(
                        bottom:0.w
                    ),
                    BaseText(
                      text: AppConfig
                          .config.balanceLogic.memberInfo.realName.removeFirstChar(),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(left: 150.w)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Text(
                        '修改头像',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFCCCCCC),
                    ),
                  ],
                ),
              ],
            ),
        )),
        Expanded(
            child: ListView.separated(
          padding: EdgeInsets.all(16.w),
          itemCount: sections.length,
          separatorBuilder: (context, index) => SizedBox(height: 14.w),
          itemBuilder: (context, sectionIndex) => sections[sectionIndex],
        ))
      ],
    );
  }

  Widget _buildSection(List<item> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 分组内容
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            separatorBuilder: (context, index) => const Divider(
              height: 0.5,
              indent: 16,
              endIndent: 16,
              color: Color(0xFFEEEEEE),
            ),
            itemBuilder: (context, index) =>
                _buildListItem(items[index], isLast: index == items.length - 1),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(item item, {bool isLast = false}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          switch (item.title) {
            case '涉税信息尽职调查':
              Get.toNamed(Routes.naviOffset, arguments: {
                'title': '特定客户信息采集',
                'image': 'bg_sheshui',
              });
              break;
            case '我的龙信商':
              Get.toNamed(Routes.naviOffset, arguments: {
                'title': '龙信商',
                'image': 'bg_longxins',
              });
              break;
            case '特定客户尽职调查':
              Get.toNamed(Routes.crsjzdc);
              break;
            case '客户信息管控应急恢复':
              Get.toNamed(Routes.zhhfyj);
              break;
            case '客户信息':
              Get.toNamed(Routes.mineInfo);
              break;
            default:
              break;
          }
        },
        splashColor: Colors.blue.withOpacity(0.1),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
          decoration: BoxDecoration(
            borderRadius: isLast
                ? const BorderRadius.vertical(bottom: Radius.circular(10))
                : BorderRadius.zero,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 左侧内容
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (item.subtitle?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          item.subtitle!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // 右侧内容
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.rightContent?.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Text(
                        item.rightContent!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xFFCCCCCC),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
