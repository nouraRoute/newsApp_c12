import 'package:flutter/material.dart';
import 'package:news_app_c12/common/widgets/error_widget.dart';
import 'package:news_app_c12/common/widgets/loading_widget.dart';
import 'package:news_app_c12/news/model_view/news_provider.dart';
import 'package:news_app_c12/news/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late NewsProvider newsProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsProvider = NewsProvider();
    newsProvider.getNews(widget.sourceId);
  }

  @override
  void didUpdateWidget(covariant NewsList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    newsProvider.getNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => newsProvider,
      child: Consumer<NewsProvider>(
        builder: (context, value, child) => value.waiting
            ? LoadingWidget()
            : value.errorMessage != null
                ? CustomErrorWidget(errorMessage: value.errorMessage!)
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.newsModel?.articles?.length,
                    itemBuilder: (context, index) => NewsCard(
                      newsModel: value.newsModel!.articles![index],
                    ),
                  ),
      ),
    );
  }
}
