import 'package:news_app_c12/news/data/data_models/news_model/article.dart';

abstract class NewsDataSource {
  Future<List<Article>> getNews(String sourceId);
}
