import 'package:news_app_c12/news/data/data_models/news_model/article.dart';
import 'package:news_app_c12/news/data/data_source/news_data_source.dart';

class NewsFirebaseDataSource extends NewsDataSource {
  @override
  Future<List<Article>> getNews(String sourceId) async {
//Firebase logic
    return [];
  }
}
