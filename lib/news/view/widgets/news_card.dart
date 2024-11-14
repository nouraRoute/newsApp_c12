import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12/common/app_assets.dart';
import 'package:news_app_c12/common/app_colors.dart';
import 'package:news_app_c12/news/data/data_models/news_model/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsModel});
  final Article newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            errorBuilder: (context, error, stackTrace) => Image.asset(
              AppAssets.failedImage,
              height: 230.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            newsModel.urlToImage ?? "",
            height: 230.h,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            newsModel.author ?? '',
            style: TextStyle(color: AppColors.grayColor, fontSize: 10),
          ),
          Text(
            newsModel.title ?? "",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          if (newsModel.publishedAt != null)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                timeago.format(DateTime.parse(newsModel.publishedAt!)),
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
