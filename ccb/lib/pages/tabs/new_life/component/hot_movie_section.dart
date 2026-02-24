import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HotMovieSection extends StatelessWidget {
  HotMovieSection({Key? key}) : super(key: key);

  final List<Map<String, String>> movies = const [
    {'image': 'assets/new_images/life/movie_1.png', 'title': '酱园弄·悬案'},
    {'image': 'assets/new_images/life/movie_2.png', 'title': '新·驯龙高手'},
    {'image': 'assets/new_images/life/movie_3.png', 'title': '时间之子'},
    {'image': 'assets/new_images/life/movie_4.png', 'title': '分手清单'},
    {'image': 'assets/new_images/life/movie_5.png', 'title': '碟中谍8：最后一搏'},
    {'image': 'assets/new_images/life/movie_6.png', 'title': '疾速追杀：芭蕾'},
    {'image': 'assets/new_images/life/movie_7.png', 'title': '私家侦探'},
  ];

  @override
  Widget build(BuildContext context) {
    double height = screenWidth/1.237;
    return Container(
      width: screenWidth,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/new_images/life/hot_movie_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(top: height/303 * 86, left: 16, right: 16),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: height/303 * 200 + 14,
          alignment: Alignment.topCenter,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.movie);
                },
                child: Container(
                  height: height/303 * 200 + 14,
                  width: height/303 * 135 * 0.71,
                  child: _buildMovieCard(movies[index], height),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMovieCard(Map<String, String> movie, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          movie['image']!,
          width: height/303 * 135 * 0.71,
          height: height/303 * 135,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 4),
        Text(
          movie['title']!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8,),
        Image.asset(
          'assets/new_images/life/buy.png',
          width: 50,
          height: 22,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
} 