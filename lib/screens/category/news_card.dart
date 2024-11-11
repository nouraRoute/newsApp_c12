import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12/common/app_colors.dart';
import 'package:news_app_c12/screens/category/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            newsModel.imagePath,
            height: 230.h,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            newsModel.company,
            style: TextStyle(color: AppColors.grayColor, fontSize: 10),
          ),
          Text(
            newsModel.title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              timeago.format(newsModel.publishDate),
              style: TextStyle(color: AppColors.lightGrayColor, fontSize: 13),
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
