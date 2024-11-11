import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12/common/app_colors.dart';
import 'package:news_app_c12/screens/category/models/news_model.dart';
import 'package:news_app_c12/screens/category/news_card.dart';
import 'package:news_app_c12/screens/category/widgets/sources_list.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.id});
  final String id;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  List<NewsModel> newsList = List.generate(
    10,
    (index) => NewsModel(
        imagePath: 'assets/NewsTest.png',
        title:
            '''Why are football's biggest clubs starting a new tournament?''',
        company: 'BBC news',
        id: index.toString(),
        publishDate: DateTime(2024, 10, 5)),
  );
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SourcesList(categoryId: widget.id),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: newsList.length,
          itemBuilder: (context, index) => NewsCard(
            newsModel: newsList[index],
          ),
        )
      ],
    );
  }
}
